<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:rng="http://relaxng.org/ns/structure/1.0"
  xmlns:rnga="http://relaxng.org/ns/compatibility/annotations/1.0"
  xmlns:rng2ditadtd="http://dita.org/rng2ditadtd"
  xmlns:relpath="http://dita2indesign/functions/relpath"
  xmlns:str="http://local/stringfunctions"
  xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/"
  xmlns:rngfunc="http://dita.oasis-open.org/dita/rngfunctions"
  exclude-result-prefixes="xs xd rng rnga relpath str ditaarch rngfunc"
  version="2.0">
  <!-- ==============================
       Gather Modules mode
       ============================== -->

  <xsl:template match="rng:grammar" mode="gatherModules">
    <xsl:apply-templates select="rng:include | rng:div" mode="#current" />
  </xsl:template>

  <xsl:template match="rng:include" mode="gatherModules">
    <xsl:param name="origModule" as="document-node()" tunnel="yes" select="root(.)"/>
    <xsl:variable name="rngModule" as="document-node()?" select="document(@href, $origModule)" />
    <xsl:choose>
      <xsl:when test="$rngModule">
        <xsl:if test="false() and $doDebug">
          <xsl:message> + [DEBUG] Resolved reference to module <xsl:sequence select="string(@href)" /></xsl:message>
        </xsl:if>
        <xsl:variable name="rngModuleNoDivs" as="document-node()">
          <xsl:choose>
            <xsl:when test="$rngModule//rng:div">
              <xsl:apply-templates mode="removeDivs" select="$rngModule"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:sequence select="$rngModule"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
<!--        <xsl:result-document href="{relpath:newFile(relpath:getParent(document-uri($rngModule)), concat(relpath:getNamePart(document-uri($rngModule)), '-nodiv', '.rng'))}">
          <xsl:sequence select="$rngModuleNoDivs"/>
        </xsl:result-document>
-->        
        <xsl:sequence select="$rngModuleNoDivs" />
        <xsl:variable name="newBaseDoc" as="document-node()"
          select="if ($rngModule/*/@origURI) then $origModule else $rngModule"
        />
        <xsl:apply-templates mode="gatherModules" select="$rngModuleNoDivs" >
          <xsl:with-param 
            name="origModule" 
            as="document-node()" 
            tunnel="yes" 
            select="$newBaseDoc"
          />
        </xsl:apply-templates>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message> - [ERROR] Failed to resolve reference to module <xsl:sequence select="string(@href)" /> relative to base "<xsl:sequence select="document-uri($origModule)"/>"</xsl:message>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>