<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
  xmlns:rng="http://relaxng.org/ns/structure/1.0"
  xmlns="http://relaxng.org/ns/structure/1.0"
  xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
  exclude-result-prefixes="xs xd xsd"
  version="2.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Nov 18, 2013</xd:p>
      <xd:p><xd:b>Author:</xd:b> ekimber</xd:p>
      <xd:p></xd:p>
    </xd:desc>
  </xd:doc>
  
  <xsl:output
    indent="yes"
  />
  
  <xsl:template match="/xsd:schema">
    <grammar>
      <start>
        <ref name="cml"/>
      </start>
      
      <xsl:apply-templates/>
      
    </grammar>
  </xsl:template>
  
  <xsl:template match="xsd:attributeGroup">
    <define name="{@name}">
      <attribute name="{@name}"/>
    </define>
  </xsl:template>
  
  <xsl:template match="xsd:element">
    <define name="{@name}.element">
      <element name="{@name}">
        <xsl:apply-templates/>
      </element>
    </define>
  </xsl:template>
  
  <xsl:template match="xsd:simpleType">
    <define name="{@name}.type">
      <xsl:apply-templates select="xsd:annotation"/>
      <value><xsl:apply-templates select="* except xsd:annotation"/></value>
    </define>
  </xsl:template>
  
  <xsl:template match="xsd:restriction/xsd:simpleType">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="xsd:restriction">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="xsd:pattern">
    <xsl:value-of select="."/>
  </xsl:template>
  
  <xsl:template match="/*/*/xsd:annotation" priority="10">
    <a:documentation><xsl:value-of select="."/></a:documentation>
  </xsl:template>
  
  <xsl:template match="xsd:annotation">
    <!--<a:documentation><xsl:value-of select="."/></a:documentation>-->
  </xsl:template>
  
  <xsl:template match="text()"/>
  
  <xsl:template match="xsd:*" priority="-1">
    <xsl:message> + [WARN] Unhandled element <xsl:value-of select="name(.)"/></xsl:message>
  </xsl:template>
  
</xsl:stylesheet>