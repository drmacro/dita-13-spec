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
  <!-- Generates the alphabetical element type navigation topics -->
  
  <xsl:template mode="make-alpha-nav-topics" match="/">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template match="rng:grammar" mode="make-alpha-nav-topics">
    
    <topic id="all-elements-a-z">
      <title>All Elements A-Z</title>
      <body>
        <ul>
        <xsl:apply-templates select="//rng:element[@name]" mode="#current">
          <xsl:sort select="@name"/>
        </xsl:apply-templates>
        </ul>
      </body>
    </topic>
  </xsl:template>

  <xsl:template match="rng:element[@name]" mode="make-alpha-nav-topics">
    <!-- For each unique element type, we generate a reference topic
         that contains just the contains and contained-by tables.
      -->
    <xsl:variable name="tagname" as="xs:string" select="@name"/>
   
    <li id="{$tagname}"><xsl:comment>[<xsl:sequence select="position()"/>"]</xsl:comment><xref keyref="{$tagname}"><xsl:sequence select="$tagname"/></xref></li>

  </xsl:template>
  
  <xsl:template mode="make-alpha-nav-topics" match="text()"/>
  
</xsl:stylesheet>