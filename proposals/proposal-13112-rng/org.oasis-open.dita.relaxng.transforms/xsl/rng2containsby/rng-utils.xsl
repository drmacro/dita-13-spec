<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:rng="http://relaxng.org/ns/structure/1.0" 
  xmlns:rnga="http://relaxng.org/ns/compatibility/annotations/1.0" 
  xmlns:relpath="http://dita2indesign/functions/relpath" 
  xmlns:str="http://local/stringfunctions" 
  xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/"
  xmlns:rngfunc="http://dita.oasis-open.org/dita/rngfunctions" 
  exclude-result-prefixes="xs xd rng rnga relpath str ditaarch rngfunc" 
  version="2.0">
  <!-- ===================================
        get-element-type-name-for-pattern mode
        
        Processes rng:define and rng:ref elements
        until it finds an rng:element element and
        returns its name or names.
        
        =================================== -->
  <xsl:template match="rng:ref" priority="10"
    mode="
    get-element-type-name-for-pattern 
    construct-content-model
    resolve-refs
    ">
    <xsl:variable name="pattern" as="element()*"
      select="key('patternsByName', @name)"
    />
    <xsl:choose>
      <xsl:when test="not($pattern)">
        <xsl:message> - [WARN] rng:ref - Unable to find pattern "<xsl:value-of select="@name"/>"</xsl:message>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="$pattern" mode="#current"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="rng:element[not(@name)]" mode="resolve-refs">
    <!-- Don't include unnamed element patterns. This is weak, really
         need to be able to detect cycles
    -->
  </xsl:template>
  
  <xsl:template match="*" mode="resolve-refs">
    <xsl:copy>
      <xsl:sequence select="@*"/>
      <xsl:apply-templates mode="#current"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template mode="resolve-refs" match="text()">
    <xsl:sequence select="."/>
  </xsl:template>
  
  <xsl:template mode="get-element-type-name-for-pattern" 
    match="rng:define | 
           rng:optional | 
           rng:choice | 
           rng:oneOrMore | 
           rng:zeroOrMore
           ">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template mode="get-element-type-name-for-pattern" match="rng:element">
    <xsl:choose>
      <xsl:when test="@name">
        <xsl:sequence select="string(@name)"/>
      </xsl:when>
      <xsl:otherwise>
        <!-- Not interested in elements with no names here -->
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
</xsl:stylesheet>