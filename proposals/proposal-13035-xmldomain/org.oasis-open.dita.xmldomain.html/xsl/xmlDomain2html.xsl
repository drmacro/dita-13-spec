<?xml version="1.0" encoding="UTF-8" ?>
<!-- ===========================================================
     HTML generation templates for the xmlDomain DITA domain.
     
     Copyright (c) 2012 OASIS Oepn
     
     =========================================================== -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="*[contains(@class, ' xml-d/xmlelement ')]" priority="10">
    <code>
      <xsl:text>&lt;</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>&gt;</xsl:text>
    </code>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' xml-d/xmlatt ')]" priority="10">
    <code>
      <xsl:text>@</xsl:text>
      <xsl:apply-templates/>
    </code>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' xml-d/textentity ')]" priority="10">
    <code>
      <xsl:text>&amp;</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>;</xsl:text>
    </code>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' xml-d/parameterentity ')]" priority="10">
    <code>
      <xsl:text>%</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>;</xsl:text>
    </code>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' xml-d/numcharref ')]" priority="10">
    <code>
      <xsl:text>&amp;#</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>;</xsl:text>
    </code>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' xml-d/rnggroup ')]" priority="10">
    <code>
      <xsl:apply-templates/>
    </code>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' xml-d/xmlnsname ')]" priority="10">
    <code>
      <xsl:apply-templates/>
    </code>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' xml-d/xsdattgroup ')]" priority="10">
    <code>
      <xsl:apply-templates/>
    </code>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' xml-d/xsdcomplextype ')]" priority="10">
    <code>
      <xsl:apply-templates/>
    </code>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' xml-d/xsdgroup ')]" priority="10">
    <code>
      <xsl:apply-templates/>
    </code>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' xml-d/xsdsimpletype ')]" priority="10">
    <code>
      <xsl:apply-templates/>
    </code>
  </xsl:template>
</xsl:stylesheet>
