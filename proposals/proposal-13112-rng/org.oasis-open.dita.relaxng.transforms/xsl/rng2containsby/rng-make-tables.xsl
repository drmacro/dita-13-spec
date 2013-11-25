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
  
  <xsl:template match="/" mode="make-tables">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>

  <xsl:template mode="make-tables" match="rng:grammar">
    <xsl:apply-templates select="//rng:element[@name]" mode="#current">
      <xsl:sort select="@name"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="rng:element[@name]" mode="make-tables">
    <!-- For each unique elemen type, we generate a reference topic
         that contains just the contains and contained-by tables.
      -->
    <xsl:variable name="tagname" as="xs:string" select="@name"/>


    <reference id="contentmodel-{$tagname}">
      <title>
        <xsl:sequence select="$tagname"/>
      </title>
      <refbody>
        <section id="contains">
          <title>Contains</title>
          <note conref="#models/disclaimer"/>
          <simpletable relcolwidth="6* 21*" keycol="1">
            <sthead>
              <stentry>Doctype</stentry>
              <stentry>Content model</stentry>
            </sthead>
            <strow>
              <stentry>{List of doctypes goes here}</stentry>
              <stentry>{content model goes here}</stentry>
            </strow>
          </simpletable>
        </section>
        <section id="containedby">
          <title>Contained by</title>
          <simpletable relcolwidth="6* 21*" keycol="1">
            <sthead>
              <stentry>Doctype</stentry>
              <stentry>Content model</stentry>
            </sthead>
            <strow>
              <stentry>{List of doctypes goes here}</stentry>
              <stentry>{list of xrefs to element types here}
              </stentry>
            </strow>
          </simpletable>
        </section>
      </refbody>
    </reference>


  </xsl:template>

  <xsl:template mode="make-tables" match="text()"/>
</xsl:stylesheet>
