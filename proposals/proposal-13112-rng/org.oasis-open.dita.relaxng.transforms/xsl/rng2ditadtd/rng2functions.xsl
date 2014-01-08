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
    <xsl:param name="rngGrammar" as="element(rng:grammar)"/>
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
    <xsl:param name="rngGrammar" as="element(rng:grammar)"/>
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
    <xsl:param name="rngGrammar" as="element(rng:grammar)"/>
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
    <xsl:param name="rngGrammar" as="element(rng:grammar)"/>
    <xsl:variable name="title" as="xs:string"
      select="if ($rngGrammar/dita:moduleDesc/dita:moduleTitle) 
      then $rngGrammar/dita:moduleDesc/dita:moduleTitle 
      else relpath:getName(document-uri(root($rngGrammar)))"
    />
    <xsl:sequence select="$title"/>
  </xsl:function>
  
  <xsl:function name="rngfunc:isElementDomain" as="xs:boolean">
    <xsl:param name="grammarDoc" as="document-node()"/>
    <xsl:variable name="moduleType" as="xs:string" 
      select="rngfunc:getModuleType($grammarDoc/*)"/>
    <xsl:variable name="result" 
      as="xs:boolean"
      select="$moduleType = 'elementdomain'" 
    />
    <xsl:sequence select="$result"/>
  </xsl:function>
  
  <xsl:function name="rngfunc:isAttributeDomain" as="xs:boolean">
    <xsl:param name="grammarDoc" as="document-node()"/>
    <xsl:variable name="moduleType" as="xs:string" 
      select="rngfunc:getModuleType($grammarDoc/*)"/>
    <xsl:variable name="result" 
      as="xs:boolean"
      select="$moduleType = 'attributedomain'" 
    />
    <xsl:sequence select="$result"/>
  </xsl:function>
  
  <xsl:function name="rngfunc:getEntityFilename" as="xs:string">
    <xsl:param name="rngGrammar" as="element(rng:grammar)"/>
    <xsl:param name="entityType" as="xs:string"/><!-- 'ent' or 'mod' -->
    
    <xsl:variable name="baseRngName" as="xs:string"
      select="if ($entityType = 'ent' and 
                 (rngfunc:getModuleType($rngGrammar) = 'topic' and rngfunc:getModuleShortName($rngGrammar) = 'topic'))
      then 'topicDefn'
      else relpath:getNamePart(document-uri(root($rngGrammar)))"
    />
    <xsl:variable name="entityNamePart" as="xs:string"
         select="
         if (ends-with($baseRngName, 'Mod')) 
            then substring-before($baseRngName, 'Mod') 
            else $baseRngName"
     />
    <xsl:variable name="entFilename" as="xs:string" 
      select="
      concat($entityNamePart, '.', $entityType)" 
    />
    <xsl:sequence select="$entFilename"/>
  </xsl:function>
  
   <!-- ==========================================
        String formatting functions
        ========================================== -->
  
   <!-- See http://markmail.org/message/fhbwfe67amcjoelm?q=xslt+printf+list:com%2Emulberrytech%2Elists%2Exsl-list&page=1 -->
  
 <xsl:function name="str:pad" as="xs:string">
   <!-- Pad a string with len trailing characters -->
   <xsl:param    name="str" as="xs:string"/>
   <xsl:param    name="len" as="xs:integer"/>
   <xsl:variable name="lstr" select="string-length($str)" as="xs:integer"/>
   <xsl:choose>
     <xsl:when test="$lstr lt $len">
       <xsl:variable name="pad"
                     select="string-join((for $i in 1 to $len - $lstr return ' '),'')"/>
       <xsl:sequence select="concat($str,$pad)"/>  
     </xsl:when>
     <xsl:otherwise>
       <xsl:sequence select="$str"/>
     </xsl:otherwise>
   </xsl:choose>
 </xsl:function>

 <xsl:function name="str:indent" as="xs:string">
   <!-- Generate a sequence of blanks of the specified length -->
   <xsl:param    name="len" as="xs:integer"/>
   <xsl:variable name="indent"
                 select="string-join((for $i in 1 to $len return ' '),'')"/>
   <xsl:sequence select="$indent"/>  
 </xsl:function>


</xsl:stylesheet>