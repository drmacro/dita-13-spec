<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:m="http://www.w3.org/1998/Math/MathML"
  exclude-result-prefixes="xs m"
  >
  <!-- Math and equation domain elements to HTML -->
  
  <xsl:param name="mathJaxInclude" as="xs:string"
    select="'false'" 
  />
  
  <xsl:param name="mathJaxIncludeBoolean" as="xs:boolean"
    select="matches($mathJaxInclude, 'yes|true|on|1', 'i')" 
  />
  
  <xsl:param name="mathJaxUseCDNLink" select="'false'"/>
  <xsl:param name="mathJaxUseCDNLinkBoolean" 
    select="matches($mathJaxUseCDNLink, 'yes|true|on|1', 'i')"
    as="xs:boolean"
  />
  
  <xsl:param name="mathJaxUseLocalLink" select="'false'"/>
  <xsl:param name="mathJaxUseLocalLinkBoolean" 
    select="matches($mathJaxUseLocalLink, 'yes|true|on|1', 'i')"
    as="xs:boolean"
  />
  
  <xsl:param name="mathJaxLocalJavascriptUri" select="''"/>
  
  <xsl:param name="mathJaxConfigParam" select="'config=TeX-AMS-MML_HTMLorMML'"/>
  
  <xsl:template name="report-parameters" match="*" mode="report-parameters">
    <xsl:message>

      Math Domain parameters:
      
      + mathJaxInclude  = "<xsl:sequence select="$mathJaxIncludeBoolean"/>"
      + mathJaxUseCDNLink  = "<xsl:sequence select="$mathJaxUseCDNLinkBoolean"/>"
      + mathJaxUseLocalLink= "<xsl:sequence select="$mathJaxUseLocalLinkBoolean"/>"
      + mathJaxLocalJavascriptUri= "<xsl:sequence select="$mathJaxLocalJavascriptUri"/>"
      + mathJaxConfigParam = "<xsl:sequence select="$mathJaxConfigParam"/>"
      
    </xsl:message>
  </xsl:template>
  
  <xsl:template mode="gen-user-scripts" match="*[contains(@class, ' topic/topic ')]">
    <xsl:choose>
      <xsl:when test="$mathJaxUseCDNLinkBoolean">
        <!-- Reference to MathMax script as served over the public Web: -->
        <script type="text/javascript"
          src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?{$mathJaxConfigParam}">
        </script>    
      </xsl:when>
      <xsl:when test="$mathJaxUseLocalLinkBoolean">
        <xsl:if test="$mathJaxLocalJavascriptUri = ''">
          <xsl:message> - [WARN] Runtime parameter $mathJaxUseLocalLinkBoolean is true but $mathJaxLocalJavascriptUri is not set. </xsl:message>
        </xsl:if>
        <script type="text/javascript"
          src="{$mathJaxLocalJavascriptUri}?{$mathJaxConfigParam}">
        </script>    
      </xsl:when>
      <xsl:otherwise>
        <!-- Do not use MathJax Javascript library -->
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' equation-d/equation-inline ')]">
    <span class="eqn-inline {@outputclass}"><xsl:apply-templates>
      <xsl:with-param name="blockOrInline" tunnel="yes" select="'inline'"/>
    </xsl:apply-templates></span>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' equation-d/equation-block ')]">
    <div class="eqn-block {@outputclass}">
      <xsl:apply-templates>
        <xsl:with-param name="blockOrInline" tunnel="yes" select="'block'"/>
      </xsl:apply-templates>
    </div>
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
    <div style="display: block">
      <xsl:apply-templates>
        <xsl:with-param name="blockOrInline" tunnel="yes" select="'block'"/>
      </xsl:apply-templates>
    </div>
  </xsl:template>
  
  <xsl:template match="m:math">
    <xsl:param name="blockOrInline" as="xs:string" tunnel="yes" select="'inline'"/>
    <math xmlns="http://www.w3.org/1998/Math/MathML"      
      >
      <xsl:if test="$blockOrInline = 'block'">
        <xsl:attribute name="display" select="'block'"/>
      </xsl:if>
      <xsl:apply-templates mode="math-ml"/>
    </math>
  </xsl:template>
  
  <!-- ==============================================
       MathML 
       
       As of 12/2011, the current Firefox and Safari 5.1+
       browsers support embedded MathML natively.
       
       Chrome does not have it turned on but it's built into
       Webkit (as used by Safari).
       
       Opera does not currently support MathML 
       
       IE Requires the MathPlayer plugin and XHTML with 
       the doctype 
       
       DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 plus MathML 2.0 plus SVG 1.1//EN"
       "http://www.w3.org/Math/DTD/mathml2/xhtml-math11-f.dtd"
       
       And XHTML namespace on the <html> element:
       
       <html xmlns="http://www.w3.org/1999/xhtml"
       
       ============================================== -->
  
  <!-- FIXME: Need to provide both MathML output and alternative plain-text
       output for accessability.
    -->
  
  <xsl:template mode="math-ml" match="*" xmlns="http://www.w3.org/1998/Math/MathML">
    <xsl:element name="{local-name(.)}">
      <xsl:apply-templates select="@*, node()" mode="#current"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template mode="math-ml" match="m:annotation"  xmlns="http://www.w3.org/1998/Math/MathML">
    <xsl:element name="{local-name(.)}">
      <xsl:attribute name="style" select="'display: none;'"/>
      <xsl:apply-templates select="@*, node()" mode="#current"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template mode="math-ml" match="@*">
    <xsl:sequence select="."/>
  </xsl:template>
  
</xsl:stylesheet>
