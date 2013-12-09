<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:rng="http://relaxng.org/ns/structure/1.0"
  xmlns="http://relaxng.org/ns/structure/1.0"
  xmlns:rnga="http://relaxng.org/ns/compatibility/annotations/1.0"
  xmlns:relpath="http://dita2indesign/functions/relpath"
  xmlns:str="http://local/stringfunctions"
  xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/"
  xmlns:rngfunc="http://dita.oasis-open.org/dita/rngfunctions"
  xmlns:sch="http://purl.oclc.org/dsdl/schematron" 
  xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
  exclude-result-prefixes="xs xd rnga relpath str ditaarch rngfunc sch"
  version="2.0">
  <!-- ===============================
       Normalizes the grammar by expanding the
       patterns within <element> elements that
       are direct children of defines that
       are direct children of <grammar>,
       meaning that the process does not 
       recurse down through child elements
       of elements.
       
       There result is a set of top-level defines
       where each <element> refects its content
       groups and allowed direct-child elements.       
       
       This then makes the content models easy to 
       process.
       =============================== -->
  
  <xsl:template match="rng:grammar" mode="normalize-grammar" priority="10">
    <xsl:param name="origDoc" as="document-node()" tunnel="yes"/>
    <!-- First, normalize all the references so each top-level <element> 
         declaration contains stub versions of each child element along
         with the groups.
      -->
    <xsl:variable name="grammarResolved" as="document-node()">
      <xsl:document>
        <xsl:apply-templates select="." mode="normalize-refs"/>
      </xsl:document>
    </xsl:variable>
    <xsl:if test="$doDebug">
      <xsl:variable name="resolvedUri" as="xs:string"
        select="relpath:newFile(relpath:getParent(document-uri($origDoc)), concat(relpath:getName(document-uri($origDoc)), '-resolved.rng'))"
      />
      <xsl:message> + [DEBUG] Writing ref-resolved grammar to "<xsl:value-of select="$resolvedUri"/>"</xsl:message>
      <xsl:result-document href="{$resolvedUri}" format="grammar">
        <xsl:sequence select="$grammarResolved"/>
      </xsl:result-document>

    </xsl:if>
    <!-- Now process the result to filter out unnecessary groups -->
    <xsl:document>
      <xsl:for-each select="$grammarResolved/rng:grammar">
        <xsl:copy>
          <xsl:attribute name="datatypeLibrary" select="'http://www.w3.org/2001/XMLSchema-datatypes'"/>
          <xsl:apply-templates mode="#current" select="@*,*"/>
        </xsl:copy>
      </xsl:for-each>
    </xsl:document>
  </xsl:template>
  
  <xsl:template match="text()" mode="normalize-grammar">
    <xsl:sequence select="."/>
  </xsl:template>
  
  <xsl:template mode="normalize-refs" match="rng:ref" priority="20">
    
    <xsl:variable name="pattern" as="element()*"
        select="key('patternsByName', @name, root(.))"
    />
    <xsl:apply-templates select="$pattern/*" mode="#current"/>        
  </xsl:template>
  
  <xsl:template mode="normalize-refs" match="rng:element" priority="20">
    <xsl:param name="recurse" as="xs:boolean" select="true()" tunnel="yes"/>
    <!-- Only process top-level <element> elements. -->
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="#current"/>
      <xsl:choose>      
        <xsl:when test="$recurse">
          <xsl:apply-templates mode="#current">
            <xsl:with-param name="recurse" as="xs:boolean" select="false()" tunnel="yes"/>
          </xsl:apply-templates>
        </xsl:when>
        <xsl:otherwise>
            <xsl:if test="not(@name)">
              <anyName/><!-- Must be an "any" pattern -->
            </xsl:if>
            <empty/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template mode="normalize-refs" match="rng:element" priority="10">
    <!-- Elements that are not direct children of patterns are just copied
         to the output.
      -->
    <xsl:sequence select="."/>
  </xsl:template>
  
  <xsl:template mode="normalize-grammar" match="rng:choice/rng:choice" priority="10">
    <xsl:apply-templates mode="#current"/>    
  </xsl:template>
  
  <xsl:template mode="normalize-grammar" match="rng:define[not(rng:element)]" priority="20">
    <!-- We don't care about defines that are not directly defining element patterns. -->
  </xsl:template>

  <xsl:template mode="normalize-grammar" match="rng:define[preceding::rng:define[rng:element/@name = current()/rng:element/@name]]" priority="20">
    <!-- Only process the first definition of a given element type -->
  </xsl:template>

  <!-- Ignore things that contain only attributes and attributes -->
  <xsl:template mode="normalize-grammar" match="rng:optional[rng:attribute]"/>
  <xsl:template mode="normalize-grammar" match="rng:attribute"/>
  
  <xsl:template match="a:* | @a:*" mode="normalize-grammar" priority="10"/><!-- Don't care about annotations -->
  
  <xsl:template match="*" mode="normalize-grammar normalize-refs">
    <xsl:copy>
      <xsl:apply-templates mode="#current" select="@*,node()"/>
    </xsl:copy>
  </xsl:template>
    
  <xsl:template match="@*" mode="normalize-grammar normalize-refs">
   <xsl:sequence select="."/>
  </xsl:template>
  
</xsl:stylesheet>