<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:rng="http://relaxng.org/ns/structure/1.0"
  xmlns:rnga="http://relaxng.org/ns/compatibility/annotations/1.0"
  xmlns:rng2ditadtd="http://dita.org/rng2ditadtd"
  xmlns:relpath="http://dita2indesign/functions/relpath"
  xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
  xmlns:str="http://local/stringfunctions"
  xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/"
  xmlns:dita="http://dita.oasis-open.org/architecture/2005/"
  xmlns:rngfunc="http://dita.oasis-open.org/dita/rngfunctions"
  exclude-result-prefixes="xs xd rng rnga relpath a str ditaarch dita rngfunc rng2ditadtd"
  version="2.0">
  
  <!-- Constructs a normalized version of the root grammar
       with all references expanded.
    -->

  <xsl:template match="/" mode="normalize">
<!--    <xsl:message> + [DEBUG] normalize: Starting...</xsl:message>-->
    <xsl:variable name="grammarIncludesResolved" as="document-node()">
      <xsl:document>
        <xsl:apply-templates mode="resolveIncludesNormalize">
          <xsl:with-param name="origModule" as="document-node()" tunnel="yes" select="."/>
        </xsl:apply-templates>
      </xsl:document>
    </xsl:variable>
    <xsl:if test="false() or $doDebug">
    <xsl:message> + [DEBUG] normalize: Writing includesResolved module to "<xsl:value-of select="relpath:newFile($outdir, 'includesResolvedModule.rng')"/></xsl:message>
      <xsl:result-document href="{relpath:newFile($outdir, 'includesResolvedModule.rng')}">
        <xsl:sequence select="$grammarIncludesResolved"/>
      </xsl:result-document>
    </xsl:if>
    <xsl:variable name="expandedRefs" as="document-node()">
      <xsl:document>
        <xsl:apply-templates select="$grammarIncludesResolved" mode="expandRefs"/>
      </xsl:document>
    </xsl:variable>
    <xsl:if test="false() or $doDebug">
    <xsl:message> + [DEBUG] normalize: Writing normalized module to "<xsl:value-of select="relpath:newFile($outdir, 'expandedModule.rng')"/></xsl:message>
      <xsl:result-document href="{relpath:newFile($outdir, 'expandedModule.rng')}">
        <xsl:sequence select="$expandedRefs"/>
      </xsl:result-document>
    </xsl:if>
    <xsl:sequence select="$expandedRefs"/>
  </xsl:template>
  
  <xsl:template mode="resolveIncludesNormalize expandRefs" match="a:* | dita:*"/>
  
  <xsl:template mode="resolveIncludesNormalize" match="/*">
    <xsl:copy>
      <xsl:attribute name="datatypeLibrary" select="'http://www.w3.org/2001/XMLSchema-datatypes'"/>
      <xsl:apply-templates mode="#current" select="@*, node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template mode="resolveIncludesNormalize" match="*" priority="-1">
    <xsl:copy>
      <xsl:apply-templates mode="#current" select="@*, node()"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template mode="resolveIncludesNormalize" match="rng:include">
    <xsl:param name="origModule" as="document-node()" tunnel="yes" select="root(.)"/>
    <xsl:variable name="rngModule" as="document-node()?" select="document(@href, $origModule)" />
    <xsl:choose>
      <xsl:when test="$rngModule">
        <xsl:apply-templates select="$rngModule/*/*" mode="#current">
          <xsl:with-param name="origModule" as="document-node()" tunnel="yes" select="$rngModule"/>
        </xsl:apply-templates>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message> - [WARN] resolveIncludes: Failed to resolve reference to module "<xsl:value-of select="@href"/>" relative to module "<xsl:value-of select="document-uri($origModule)"/>"</xsl:message>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template mode="resolveIncludesNormalize expandRefs" match="@* | text()">
    <xsl:sequence select="."/>
  </xsl:template>
  
  <xsl:template mode="expandRefs" match="/*"> 
    <!-- Process each element-defining define once -->
    <xsl:copy>
      <xsl:apply-templates select="@*, rng:define | rng:start" mode="#current"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template mode="expandRefs" match="*" priority="-1">
<!--    <xsl:message> + [DEBUG] expandRefs: catch-all: <xsl:value-of select="name(..), '/', name(.)"/></xsl:message>-->
    <xsl:copy>
      <xsl:apply-templates mode="#current" select="@*,node()"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template mode="expandRefs" match="rng:start">
    <xsl:sequence select="."/>
  </xsl:template>
  
  <xsl:template mode="expandRefs" match="rng:define[rng:element]" priority="10">
    <xsl:copy>
      <xsl:apply-templates mode="#current" select="@*,node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template mode="expandRefs" 
    match="rng:define[ends-with(@name, '.attributes') or
           ends-with(@name, '-atts') or
           ends-with(@name, 'att')]" priority="20">
    <xsl:sequence select="."/>
  </xsl:template>

  <xsl:template mode="expandRefs" match="rng:define[count(*) = 1][rng:ref[ends-with(@name, '.element')]]" priority="20">
    <!-- [rng:ref[ends-with(@name, '.element')]] -->
<!--    <xsl:message> + [DEBUG] expandRefs: define <xsl:value-of select="@name"/>: with exactly one rng:ref child, </xsl:message>-->
    <xsl:sequence select="."/>
  </xsl:template>
  
  <xsl:template mode="expandRefs" match="rng:define"/>
  
  <xsl:template mode="expandRefs" match="rng:ref">
    <xsl:variable name="targetName" select="@name" as="xs:string"/>
    <xsl:variable name="target" as="element()*"
      select="//*[@name = $targetName][not(self::rng:ref)]"
    />
    <!--<xsl:message> + [DEBUG] expandRefs: rng:ref: targetName="<xsl:value-of select="$targetName"/>"</xsl:message>-->
    <xsl:choose>
      <xsl:when test="not($target)">
        <xsl:message> - [WARN]   expandRefs: Failed to resolve reference to name "<xsl:value-of select="@name"/>"</xsl:message>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$target/self::rng:element or $target/self::rng:attribute">
            <!-- If the target is an element or attribute, preserve the reference -->
<!--            <xsl:message>+ [DEBUG]   expandRefs: rng:ref: Target is an element or attribute, copying ref.</xsl:message>-->
            <xsl:sequence select="."/>
          </xsl:when>
          <xsl:when test="$target/rng:element">
<!--            <xsl:message>+ [DEBUG]   expandRefs: rng:ref: Target is an element-defining define, copying ref.</xsl:message>-->
            <xsl:sequence select="."/>
          </xsl:when>
          <xsl:when test="$targetName = 'any'">
<!--            <xsl:message>+ [DEBUG]   expandRefs: rng:ref: Target is "any", copying ref.</xsl:message>-->
            <xsl:sequence select="."/>
          </xsl:when>
          <xsl:otherwise>
            <!-- If it's a define, expand it -->
            <xsl:choose>
              <xsl:when test="ends-with($targetName, '.attributes') or ends-with($targetName, 'attlist')">
                <!-- No need to expand attribute definitions -->
<!--                <xsl:message> + [DEBUG]   expandRefs: target is an attribute list defintion, copying its content</xsl:message>-->
                <xsl:sequence select="$target/*"/>
              </xsl:when>
              <xsl:otherwise>
<!--                <xsl:message> + [DEBUG]   expandRefs: processing children of defines "<xsl:value-of select="$targetName"/>"</xsl:message>-->
                <xsl:for-each select="$target[not(ends-with(./@name, '.element'))]">
                  <xsl:apply-templates select="./*" mode="#current"/>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>