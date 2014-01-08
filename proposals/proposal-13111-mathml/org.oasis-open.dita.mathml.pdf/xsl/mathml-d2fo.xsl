<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:m="http://www.w3.org/1998/Math/MathML"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  exclude-result-prefixes="xs m"
  >
  <!-- Math and equation domain elements to HTML -->
  
  <xsl:template match="*[contains(@class, ' equation-d/equation-inline ')]">
    <fo:inline><xsl:apply-templates>
      <xsl:with-param name="blockOrInline" tunnel="yes" select="'inline'"/>
    </xsl:apply-templates></fo:inline>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' equation-d/equation-block ')]">
    <fo:block>
      <xsl:apply-templates>
        <xsl:with-param name="blockOrInline" tunnel="yes" select="'block'"/>
      </xsl:apply-templates>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' mathml-d/mathml ')]">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' mathml-d/mathmlref ')]" priority="100">
<!--    <xsl:message> + [DEBUG] mathml-d/mathmlref, href=<xsl:value-of select="@href"/></xsl:message>-->
    <!-- NOTE: For now, not worrying about keyref, although it is allowed -->
    <xsl:variable name="href" select="@href" as="xs:string?"/>
    <xsl:variable name="xtrf" select="(ancestor-or-self::*[@xtrf])[last()]/@xtrf" as="xs:string?"/>
    <xsl:variable name="refContextNode" as="node()?"
      select="if ($xtrf) then document($xtrf) else ."
    />
    <xsl:choose>
      <xsl:when test="not($href)">
        <xsl:message> - [WARN] mathmlref: No value for @href attribute.</xsl:message>
      </xsl:when>
      <xsl:otherwise>
        
        <xsl:variable name="resourcePart" as="xs:string"
          select="if (contains($href, '#')) then substring-before($href, '#') else $href"
        />
<!--        <xsl:message> + [DEBUG] mathmlref: Resource part = "<xsl:value-of select="$resourcePart"/>"</xsl:message>-->
        <xsl:variable name="fragmentId" as="xs:string"
          select="if (contains($href, '#')) then substring-after($href, '#') else ''"
        />
<!--        <xsl:message> + [DEBUG] mathmlref: fragmentId = "<xsl:value-of select="$fragmentId"/>"</xsl:message>-->
        <xsl:variable name="mathmlDoc" as="document-node()?"
          select="document($resourcePart, $refContextNode)"
        />
        <xsl:choose>
          <xsl:when test="not($mathmlDoc)">
            <xsl:message> - [WARN] mathmlref: Failed to resolve URI "<xsl:value-of select="$resourcePart"/> to a document.</xsl:message>
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="$fragmentId = ''">
                <!-- Root of target document should be a MathML m:math element -->
                <xsl:message> + [INFO] mathmlref: Processing root of document <xsl:value-of select="document-uri($mathmlDoc)"/>...</xsl:message>
                <xsl:apply-templates select="$mathmlDoc/*[1]" mode="validate-mathmldoc"/>
              </xsl:when>
              <xsl:otherwise>
                <!-- Fragment ID should be an element ID and should be the ID 
                     of an m:math element:
                  -->
                <xsl:variable name="targetElem" as="element()*" select="$mathmlDoc//*[@id = $fragmentId]"/>
                <xsl:choose>
                  <xsl:when test="not($targetElem)">
                    <xsl:message> - [WARN] mathmlref: Failed to find element with ID "<xsl:value-of select="$fragmentId"/> in document "<xsl:value-of select="document-uri($mathmlDoc)"/>"</xsl:message>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:if test="count($targetElem) > 1">
                      <xsl:message> - [WARN] mathmlref: Found <xsl:value-of select="count($targetElem)"/> elements with ID "<xsl:value-of select="$fragmentId"/> in document "<xsl:value-of select="document-uri($mathmlDoc)"/>". There should be at most one. Using first found.</xsl:message>
                    </xsl:if>
                    <xsl:message> + [INFO] mathmlref: Processing element with ID "<xsl:value-of select="$fragmentId"/>" in document <xsl:value-of select="document-uri($mathmlDoc)"/>...</xsl:message>
                    <xsl:apply-templates mode="validate-mathmldoc" select="$targetElem[1]"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template mode="validate-mathmldoc" match="m:math" priority="10">
    <!-- Must be good, apply templates in normal mode -->
    <xsl:apply-templates mode="#default" select="."/>
  </xsl:template>
  
  <xsl:template mode="validate-mathmldoc" match="*">
    <xsl:message> - [WARN] validate-mathmldoc: element <xsl:sequence select="name(.)"/> with ID "<xsl:value-of select="@id"/>" is not a MathML &lt;math&gt; element. &lt;mathmlref&gt; must resolve to a &lt;math&gt; element.</xsl:message>
  </xsl:template>
  
  <xsl:template mode="validate-mathmldoc" match="/*" priority="5">
    <xsl:message> - [WARN] validate-mathmldoc: Root element <xsl:sequence select="name(.)"/> is not a MathML &lt;math&gt; element. &lt;mathmlref&gt; must resolve to a &lt;math&gt; element.</xsl:message>
  </xsl:template>
  
  
  <xsl:template match="*[contains(@class, ' equation-d/equation-figure ')]/*[contains(@class, ' mathml-d/mathml ')]"
    priority="10"
    >
    <fo:block>
      <xsl:apply-templates>
        <xsl:with-param name="blockOrInline" tunnel="yes" select="'block'"/>
      </xsl:apply-templates>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="m:math">
    <xsl:param name="blockOrInline" as="xs:string" tunnel="yes" select="'inline'"/>
    <fo:instream-foreign-object>
      <m:math      
        >
        <xsl:if test="$blockOrInline = 'block'">
          <xsl:attribute name="display" select="'block'"/>
        </xsl:if>
        <xsl:sequence select="node()"/><!-- Just copy the math to the output -->
      </m:math>
    </fo:instream-foreign-object>
  </xsl:template>
  
  
</xsl:stylesheet>
