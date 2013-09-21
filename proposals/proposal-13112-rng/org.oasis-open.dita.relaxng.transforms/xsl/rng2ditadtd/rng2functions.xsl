<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:rng="http://relaxng.org/ns/structure/1.0"
  xmlns:rnga="http://relaxng.org/ns/compatibility/annotations/1.0"
  xmlns:rng2ditadtd="http://dita.org/rng2ditadtd"
  xmlns:relpath="http://dita2indesign/functions/relpath"
  xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
  xmlns:str="http://local/stringfunctions"
  xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/"
  xmlns:dita="http://dita.oasis-open.org/architecture/2005/"
  xmlns:rngfunc="http://dita.oasis-open.org/dita/rngfunctions"
  exclude-result-prefixes="xs xd rng rnga relpath a str ditaarch dita rngfunc"
  version="2.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Sep 21, 2013</xd:p>
      <xd:p><xd:b>Author:</xd:b> ekimber</xd:p>
      <xd:p>Defines utility functions for working with RNG-syntax DITA shells and modules.</xd:p>
    </xd:desc>
  </xd:doc>
  
  <xsl:function name="rngfunc:getModuleType" as="xs:string">
    <!-- Returns the declared module type of the module -->
    <xsl:param name="rngGrammar" as="element()"/>
    <xsl:variable name="type" as="xs:string?"
      select="$rngGrammar/dita:moduleDesc/dita:moduleMetadata/dita:moduleType"
    />
    <xsl:choose>
      <xsl:when test="$type">
        <xsl:sequence select="$type"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message> + [ERROR] No moduleType element in module description for module "<xsl:sequence select="rngfunc:getModuleTitle($rngGrammar)"/>"</xsl:message>
        <xsl:sequence select="'no module type'"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>
  
  <xsl:function name="rngfunc:getPublicId" as="xs:string">
    <!-- Returns the public ID of the specified type -->
    <xsl:param name="rngGrammar" as="element()"/>
    <xsl:param name="idType" as="xs:string"/>
    <xsl:variable name="pubId" as="xs:string?"
      select="$rngGrammar/dita:moduleDesc/dita:moduleMetadata/*/*[local-name(.) = $idType]"
    />
    <xsl:choose>
      <xsl:when test="$pubId">
        <xsl:sequence select="$pubId"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message> + [ERROR] No public ID element "<xsl:sequence select="$idType"/>" in module description for module "<xsl:sequence select="rngfunc:getModuleTitle($rngGrammar)"/>"</xsl:message>
        <xsl:sequence select="concat('noPublicId type ', $idType)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>
  
  <xsl:function name="rngfunc:getModuleShortName" as="xs:string">
    <!-- Returns the short name of the specified type -->
    <xsl:param name="rngGrammar" as="element()"/>
    <xsl:variable name="shortName" as="xs:string?"
      select="$rngGrammar/dita:moduleDesc/dita:moduleMetadata/dita:moduleShortName"
    />
    <xsl:choose>
      <xsl:when test="$shortName">
        <xsl:sequence select="$shortName"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message> + [ERROR] No moduleShortName element in module description for module "<xsl:sequence select="rngfunc:getModuleTitle($rngGrammar)"/>"</xsl:message>
        <xsl:sequence select="'noShortName'"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>
  
  <xsl:function name="rngfunc:getModuleTitle" as="xs:string">
    <!-- Returns the title of the module -->
    <xsl:param name="rngGrammar" as="element()"/>
    <xsl:variable name="title" as="xs:string"
      select="$rngGrammar/dita:moduleDesc/dita:moduleTitle"
    />
    <xsl:sequence select="$title"/>
  </xsl:function>
  
</xsl:stylesheet>