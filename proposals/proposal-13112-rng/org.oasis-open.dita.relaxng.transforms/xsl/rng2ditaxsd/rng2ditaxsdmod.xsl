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
  xmlns:local="http://local-functions"
  exclude-result-prefixes="xs xd rng rnga relpath a str ditaarch dita rngfunc local"
  version="2.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Jan 31, 2014</xd:p>
      <xd:p><xd:b>Author:</xd:b> ekimber</xd:p>
      <xd:p>Handles generation of the *Mod.xsd and *Grp.xsd files from
      their corresponding RelaxNG module.</xd:p>
      <xd:p>Structural modules and the base modules separate the 
      per-element-type groups from the element type declarations
      into separate files. Domains put both in one file.</xd:p>
    </xd:desc>
  </xd:doc>
  
  <xsl:template match="/" mode="groupFile moduleFile">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template mode="groupFile" match="rng:include">
   <!-- Nothing to do -->
  </xsl:template>
  
  <xsl:template mode="moduleFile" match="rng:include">
   <!-- What to do ??? -->
  </xsl:template>
  
  <xsl:template mode="groupFile" match="rng:grammar">
    <xsl:message> + [INFO] === <xsl:value-of select="rngfunc:getModuleShortName(.)"/>: Generating Grp.xsd file...</xsl:message>
    <xsl:apply-templates mode="header-comment" select="."/>
    <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
      <xsl:apply-templates mode="#current"/>
    </xs:schema>
  </xsl:template>
  
  <xsl:template mode="moduleFile" match="rng:grammar">
    
    <xsl:message> + [INFO] === <xsl:value-of select="rngfunc:getModuleShortName(.)"/>: Generating Mod.xsd file...</xsl:message>
    
    <xsl:apply-templates mode="header-comment" select="."/>
    <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
      <xs:annotation>
        <xs:appinfo>
          <dita:domainsModule xmlns:dita="http://dita.oasis-open.org/architecture/2005/"
            ><xsl:value-of select="rngfunc:getDomainsContribution(.)"/></dita:domainsModule>
        </xs:appinfo>
      </xs:annotation>
      <xsl:text>&#x0a;</xsl:text>
      
      <xsl:apply-templates mode="groupFile" select="rng:define/rng:element"/>
      
      <xsl:text>&#x0a;</xsl:text>
      <xsl:apply-templates mode="#current" select="rng:define/rng:element"/>
    </xs:schema>
  </xsl:template>
  
  <!-- ====================
       Mode groupFile
       
       The groups are equivalent to the element-type-name 
       entities in the DTDs. There is one per unique element
       types.
       
   <xs:group name="tt">
      <xs:sequence>
         <xs:choice>
            <xs:element ref="tt"/>
         </xs:choice>
      </xs:sequence>
   </xs:group>

       ==================== -->
  <xsl:template mode="groupFile" match="rng:define">
    <xsl:apply-templates select="rng:element" mode="#current"/>
  </xsl:template>

  <xsl:template mode="groupFile" match="rng:element">
     <xs:group name="{@name}">
        <xs:sequence>
           <xs:choice>
              <xs:element ref="{@name}"/>
           </xs:choice>
        </xs:sequence>
     </xs:group>
    <xsl:text>&#x0a;</xsl:text>
  </xsl:template>

  <xsl:template mode="groupFile" match="a:* | dita:moduleDesc">
    <!-- Ignore documentation -->
  </xsl:template>

  <xsl:template mode="groupFile" match="*" priority="-1">
    <xsl:message> + [WARN] groupFile: Unhandled element <xsl:value-of select="concat(name(..), '/', name(.))"/></xsl:message>
  </xsl:template>
  
  <!-- ====================
       Mode moduleFile
       ==================== -->

  <xsl:template mode="moduleFile" match="rng:define">
    <!-- FIXME: Do something -->
  </xsl:template>
  
  <xsl:template mode="moduleFile" match="rng:element">
    <xs:element name="{@name}">
      <xs:annotation>
        <xs:documentation>
          <xsl:apply-templates select="a:documentation" mode="documentation"/>
        </xs:documentation>
      </xs:annotation>
      <xs:complexType>
        <xs:complexContent>
          <xs:extension base="{@name}.class">
            <xs:attribute ref="class" default="{local:getElementClassValue(.)}"/>
          </xs:extension>
        </xs:complexContent>
      </xs:complexType>
      <xs:complexType name="{@name}.class">
        <xsl:if test="rngfunc:isMixedContent(.)">
          <xsl:attribute name="mixed" select="'true'"/>
        </xsl:if>
        <xs:sequence>
          <xs:group ref="{@name}.content"/>
        </xs:sequence>
        <xs:attributeGroup ref="{@name}.attributes"/>
      </xs:complexType>
    </xs:element>
    
    <xs:group name="{@name}.content">
      <xsl:variable name="contentPatternName" as="xs:string"
        select="concat(@name, '.content')"
      />
      <!--<xsl:message> + [DEBUG] rng:element: contentPatternName="<xsl:value-of select="$contentPatternName"/>"</xsl:message>-->
      <!--<xsl:message> + [DEBUG] rng:element: ref=<xsl:sequence select="rng:ref[@name = $contentPatternName]"/></xsl:message>-->
      <xsl:apply-templates 
        select="rng:ref[@name = $contentPatternName]" 
        mode="generateXsdContentModel"/>
    </xs:group>
    <!-- 
  
  
  <xs:attributeGroup name="sup.attributes">
    <xs:attributeGroup ref="global-atts"/>
    <xs:attributeGroup ref="univ-atts"/>
    <xs:attribute name="outputclass" type="xs:string"/>
  </xs:attributeGroup>
    
    -->
  </xsl:template>
  
  <!-- ============================
       Mode generateXsdContentModel
       ============================ -->
  
  <xsl:template mode="generateXsdContentModel" match="rng:element/rng:ref" priority="10">
    <!--<xsl:message> + [DEBUG] generateXsdContentModel: rng:ref name="<xsl:value-of select="@name"/>"</xsl:message>-->
    <xsl:variable name="contentPattern" select="key('definesByName', string(@name))"
      as="element(rng:define)*"
    />
    <xsl:apply-templates mode="#current" select="$contentPattern"/>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel" match="a:*">
    <!-- Ignore -->
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel" match="rng:define">
    <xs:sequence>
      <xsl:apply-templates mode="#current"/>
    </xs:sequence>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel" match="rng:zeroOrMore">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel" match="rng:oneOrMore">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel" match="rng:optional">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel" match="rng:zeroOrMore/rng:choice">
    <xs:choice minOccurs="0" maxOccurs="unbounded">
      <xsl:apply-templates mode="#current"/>
    </xs:choice>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel" match="rng:oneOrMore/rng:choice">
    <xs:choice minOccurs="1" maxOccurs="unbounded">
      <xsl:apply-templates mode="#current"/>
    </xs:choice>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel" match="rng:optional/rng:choice">
    <xs:choice minOccurs="0">
      <xsl:apply-templates mode="#current"/>
    </xs:choice>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel" match="rng:ref">
     <xs:group ref="{@name}"/>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel" match="rng:optional/rng:ref">
     <xs:group ref="{@name}" minOccurs="0"/>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel" match="rng:text">
    <!-- Becomes mixed="true" -->
  </xsl:template>

  <xsl:template mode="generateXsdContentModel" match="rng:empty">
    <!-- Empty sequence in XSD -->
  </xsl:template>

  
  <xsl:template mode="generateXsdContentModel" match="*" priority="-1">
    <xsl:message> - [WARN] generateXsdContentModel: Unhandled element <xsl:value-of select="concat(name(..), '/', name(.))"/></xsl:message>
  </xsl:template>
  
  <xsl:template match="a:documentation" mode="documentation">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template  mode="documentation" match="text()">
    <xsl:sequence select="."/>
  </xsl:template>
  
  <xsl:template match="a:documentation//*" mode="documentation" priority="-1">
    <xsl:message> - [WARN] Unhandled element <xsl:value-of select="concat(name(..), '/', name(.))"/> within a:documentation element.</xsl:message>
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <!-- ====================
       Mode header-comment
       ==================== -->

  <xsl:template match="dita:moduleDesc" mode="header-comment">
    <xsl:apply-templates select="dita:headerComment" mode="#current"/>
  </xsl:template>
  
  <xsl:template match="dita:headerComment" mode="header-comment">
    <!-- Note that the header comment is a single string with
         space preserved.
      -->
    <xsl:choose>
      <xsl:when test="$headerCommentStyle = 'comment-per-line'">
        <xsl:analyze-string select="." regex="^.+$" flags="m">
          <xsl:matching-substring>
            <xsl:comment><xsl:value-of select="str:pad(., 61)"/></xsl:comment>
            <xsl:text>&#x0a;</xsl:text>
          </xsl:matching-substring>
          <xsl:non-matching-substring>
            <xsl:if test="normalize-space(.) != ''">
              <xsl:comment><xsl:value-of 
                select="str:pad(., 61)"/></xsl:comment>
              <xsl:text>&#x0a;</xsl:text>
            </xsl:if>
          </xsl:non-matching-substring>
        </xsl:analyze-string>
      </xsl:when>
      <xsl:otherwise>
        <xsl:comment><xsl:value-of select="string(.)"/></xsl:comment>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:function name="local:getElementClassValue" as="xs:string">
    <xsl:param name="elementElem" as="element(rng:element)"/>
    
    <xsl:variable name="classValue" as="xs:string" select="'????'"/>
    <xsl:sequence select="$classValue"/>
  </xsl:function>
  
</xsl:stylesheet>