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
  
  <xsl:template match="/" mode="make-tables">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>

  <xsl:template mode="make-tables" match="rng:grammar">
    <xsl:variable name="rootElements">
      <xsl:apply-templates select="rng:start" mode="make-tables"/>
    </xsl:variable>
    <xsl:apply-templates select="//rng:element[@name]" mode="#current">
      <xsl:sort select="@name"/>
      <xsl:with-param name="rootElements" select="$rootElements"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="rng:element[@name]" mode="make-tables">
    <!-- For each unique elemen type, we generate a reference topic
         that contains just the contains and contained-by tables.
      -->
    
    <xsl:param name="rootElements"/>
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
              <stentry><xsl:sequence select="$rootElements"/></stentry>
              <stentry>
                <xsl:apply-templates select="." mode="generate-contains-entry"/>
              </stentry>
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
              <stentry><xsl:apply-templates select="/rng:grammar/rng:start" mode="#current"/></stentry>
              <stentry>{list of xrefs to element types here}
              </stentry>
            </strow>
          </simpletable>
        </section>
      </refbody>
    </reference>

  </xsl:template>
  
  <xsl:template mode="make-tables" match="rng:start">
    <xsl:apply-templates mode="get-element-type-name-for-pattern"/>
  </xsl:template>
  
  <xsl:template mode="generate-contains-entry" match="rng:element">
    <xsl:message> + [DEBUG] generate-contains-entry: element="<xsl:value-of select="@name"/>"</xsl:message>
    <xsl:variable name="resolvedPattern" as="element()">
      <rng:element>
        <xsl:sequence select="@*"/>
        <xsl:apply-templates mode="resolve-refs"/>
      </rng:element>
    </xsl:variable>
    <xsl:message> + [DEBUG] resolvedPattern: <xsl:sequence select="$resolvedPattern"/></xsl:message>
    <xsl:apply-templates mode="construct-content-model" 
      select="$resolvedPattern">
    </xsl:apply-templates>
  </xsl:template>
  
  <xsl:template mode="make-tables" match="text()"/>

  <!-- ============ 
    Mode construct-content-model
    
    Process references. For each <element>, generate an <xref keyref="$tagname">$tagname</tagname>.
    ===================== -->
  
  <xsl:template mode="construct-content-model" match="rng:element[@name]">
    <xsl:param name="sep" as="xs:string" tunnel="yes" select="' or '"/>
    <xsl:variable name="tagname" select="@name" as="xs:string"/>
    <xsl:message> + [DEBUG] construct-content-model: tagname="<xsl:sequence select="$tagname"/>"</xsl:message>
    <xref keyref="{$tagname}"><xsl:sequence select="$tagname"/></xref>
    <xsl:sequence select="$sep"/>
  </xsl:template>
  
  <xsl:template mode="construct-content-model" match="text()"/>

  <xsl:template mode="construct-content-model" 
    match="rng:define">
    <!-- Define (<group>) is a sequence -->
    <xsl:apply-templates mode="#current">
      <xsl:with-param name="sep" select="' then '"/>
    </xsl:apply-templates>
  </xsl:template>
  
  <xsl:template match="rng:ref[@name = 'any']" mode="construct-content-model resolve-refs">
    <xsl:text> any element</xsl:text>
  </xsl:template>

  <xsl:template match="rng:text" mode="construct-content-model">
    <xsl:param name="sep" as="xs:string" tunnel="yes" select="' or '"/>
    <xsl:text> text data</xsl:text>
    <xsl:sequence select="$sep"/><!-- Should always be " or " -->
  </xsl:template>

  <xsl:template mode="construct-content-model" 
    match="rng:optional">
    <xsl:apply-templates mode="#current"/>
    <xsl:if test="count(* except (rng:ref, rng:text)) = 0">
      <xsl:text> (optional)</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template mode="construct-content-model" 
    match="rng:zeroOrMore">
    <xsl:apply-templates mode="#current"/>
    <xsl:text> (any number)</xsl:text>
  </xsl:template>

  <xsl:template mode="construct-content-model" 
    match="rng:choice">
    <xsl:if test="count(* except (rng:ref, rng:text)) = 0">
      <xsl:text>(</xsl:text>
    </xsl:if>
    <xsl:apply-templates mode="#current">
      <xsl:with-param name="sep" select="' or '"/>
    </xsl:apply-templates>
    <xsl:if test="count(* except (rng:ref, rng:text)) = 0">
      <xsl:text>)</xsl:text>
    </xsl:if>
  </xsl:template>
  
  <xsl:template mode="construct-content-model" 
    match="rng:oneOrMore
           ">
    <xsl:apply-templates mode="#current"/>
    <xsl:text> (one or more)</xsl:text>
  </xsl:template>

</xsl:stylesheet>