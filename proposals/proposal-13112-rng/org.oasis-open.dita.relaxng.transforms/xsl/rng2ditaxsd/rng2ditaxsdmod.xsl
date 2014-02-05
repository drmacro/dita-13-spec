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
      <xsl:if test="rngfunc:getModuleShortName(.) = 'topic'">
          <xsl:comment> ==================== Import Section ======================= </xsl:comment>
          <xsl:text>&#x0a;</xsl:text>
          <xs:import namespace="http://dita.oasis-open.org/architecture/2005/" schemaLocation="../../base/xsd/ditaarch.xsd"/>
          <xsl:text>&#x0a;</xsl:text>
          <xsl:text>&#x0a;</xsl:text>
      </xsl:if>
      
      
      <xs:annotation>
        <xs:appinfo>
          <dita:domainsModule xmlns:dita="http://dita.oasis-open.org/architecture/2005/"
            ><xsl:value-of select="rngfunc:getDomainsContribution(.)"/></dita:domainsModule>
        </xs:appinfo>
      </xs:annotation>
      <xsl:text>&#x0a;</xsl:text>
      
      <xsl:choose>
        <xsl:when test="rngfunc:getModuleShortName(.) = ('commonElements', 'tblDecl', 'metaDecl') or rngfunc:getModuleType(.) = ('topic', 'map')">
          <!-- No groups in the Mod.xsd file -->
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates mode="groupFile" select="rng:define/rng:element"/>
        </xsl:otherwise>
      </xsl:choose>
      
      <xsl:text>&#x0a;</xsl:text>
      <xsl:variable name="domainPrefix" 
        as="xs:string"
        select="rngfunc:getModuleShortName(.)"
      /> 

      <xsl:apply-templates mode="element-decls" 
        select="(rng:define | rng:include) except 
                    (rng:define[.//rng:attribute[@name='class']])"
        >
        <xsl:with-param name="domainPfx" select="$domainPrefix" tunnel="yes" as="xs:string" />
      </xsl:apply-templates>
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
       Mode element-decls
       Mode attribute-decls
       Mode generate-group-decl-from-defines
       ==================== -->

  <!-- Class attributes are handled in a separate mode -->
  <xsl:template match="rng:define[.//rng:attribute[@name='class']]" mode="element-decls" priority="10"/>
  

  <xsl:template match="rng:define[starts-with(@name, concat(rngfunc:getModuleShortName(ancestor::rng:grammar), '-'))]" 
    mode="element-decls" priority="30"
  >
  </xsl:template>
  
  <xsl:template match="rng:define[@combine = 'choice']" mode="element-decls" priority="20">
      <!-- Domain integration pattern. Not output in the XSD. -->
  </xsl:template>


  <xsl:template match="rng:define[ends-with(@name, '.content') or ends-with(@name, '.attributes')]" 
    mode="element-decls" priority="15">
    <xsl:param name="tagname" tunnel="yes" as="xs:string" select="'unset'"/>
      <!-- content and attlist declarations are handled from within the rng:element processing 
      
      -->
    
    <xsl:if test="ends-with(@name, '.attributes')">
      <xsl:variable name="attsDefName" as="xs:string" select="concat($tagname, '.attributes')"/>
      <xsl:if test="@name != $attsDefName">
        <xsl:next-match/><!-- Handle cases like "dita.table.attributes" -->
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <xsl:template match="rng:define[count(rng:*)=1 and rng:ref and key('attlistIndex',@name)]" 
                mode="element-decls" priority="10">
      <!-- .attlist pointing to .attributes, ignore -->
  </xsl:template>

  <xsl:template match="rng:define[count(rng:*)=1 and rng:ref and key('definesByName',rng:ref/@name)/rng:element]" 
                mode="element-decls" priority="10">
      <!-- reference to element name in this module, will be in the group file -->
  </xsl:template>
  
  <xsl:template match="rng:define[count(rng:*)=1 and rng:ref and not(key('definesByName',rng:ref/@name)) and ends-with(rng:ref/@name, '.element')]" 
                mode="element-decls" priority="20">
      <!-- reference to element name in another module, will be in group file -->
  </xsl:template>

  <xsl:template match="rng:define[not(.//rng:attribute[@name='class'])]" mode="element-decls" priority="8">
    <!-- Main template for generating group declarations from defines. 
    
         Note that the .content and .attributes handling is driven from within the rng:element
    -->
    <xsl:param name="domainPfx" tunnel="yes" as="xs:string" />
<!--    <xsl:message> + [DEBUG] mode: element-decls: rng:define name="<xsl:value-of select="@name"/>"</xsl:message>-->
    <xsl:choose>
      <xsl:when test="$domainPfx and not($domainPfx='') and starts-with(@name, $domainPfx)">
        <!-- Should never get here so this is belt to go with suspenders -->
        <!--  Domain extension pattern, not output in the .mod file (goes in shell DTDs) -->
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates mode="generate-group-decl-from-define" select="."/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template mode="element-decls" match="rng:include">
    <!-- Suppress, at least in the topicMod.xsd -->
  </xsl:template>
  
  <xsl:template mode="generate-group-decl-from-define" match="rng:define[@name = 'arch-atts']" priority="10">
    <!-- arch-atts declaration is hard-coded -->
  </xsl:template>
  
  <xsl:template mode="generate-group-decl-from-define" match="rng:define">
    
    <!-- FIXME: The following is a hack that depends on a consistent naming convention
         for attribute sets.
         
         The more complete solution I think requires producing a single-document resolved
         grammar (e.g., RNG simplification) and then examining the define in that 
         grammar to see if it has any attribute declarations.
      -->
    <xsl:variable name="isAttSet" as="xs:boolean"
      select="matches(@name, '-atts|attribute|\.att') or .//rng:attribute"
    />
    
<!--    <xsl:message> + [DEBUG] generate-group-decl-from-define: name="<xsl:value-of select="@name"/>"</xsl:message>
-->
    <xsl:variable name="tagname" select="if ($isAttSet) then 'attributeGroup' else 'group'" as="xs:string"/>
    <xsl:choose>
      <xsl:when test="$isAttSet">
        <xs:attributeGroup name="{@name}">
          <xsl:apply-templates mode="attribute-decls"/>
        </xs:attributeGroup>
      </xsl:when>
      <xsl:otherwise>
        <xs:group name="{@name}">         
          <xs:sequence>
            <xsl:apply-templates mode="element-decls">
              <xsl:with-param name="isAttSet" as="xs:boolean" select="$isAttSet" tunnel="yes"/>      
            </xsl:apply-templates>
          </xs:sequence>
        </xs:group>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template mode="element-decls" match="rng:choice">
    <xs:choice>
      <xsl:apply-templates mode="#current"/>
    </xs:choice>
  </xsl:template>
  
  <xsl:template mode="attribute-decls" match="rng:choice">
    <xs:simpleType>
      <xs:restriction base="xs:string">
        <!-- Have to exclude annotation elements because you can't
             have annotation directly within xs:restriction 
          -->
        <xsl:apply-templates mode="#current" select="rng:value"/>
      </xs:restriction>
    </xs:simpleType>
  </xsl:template>
  
  <xsl:template mode="attribute-decls" match="rng:value">
    <xs:enumeration value="{normalize-space(.)}">
      <xsl:apply-templates select="following-sibling::*[1][self::a:documentation]" mode="#current"/>
    </xs:enumeration>    
  </xsl:template>
    
  <xsl:template mode="element-decls" match="rng:ref">
    <xs:group ref="{@name}"/>
  </xsl:template>
  
  <xsl:template mode="attribute-decls" match="rng:ref">
    <xs:attributeGroup ref="{@name}"/>
  </xsl:template>
  
  <xsl:template mode="element-decls attribute-decls" match="a:documentation">
    <xs:annotation>
      <xs:documentation>
        <xsl:apply-templates select="." mode="documentation"/>
      </xs:documentation>
    </xs:annotation>
  </xsl:template>
  
  <xsl:template mode="element-decls" match="rng:element">
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
      <xsl:apply-templates 
        select="rng:ref[@name = $contentPatternName]" 
        mode="generateXsdContentModel"/>
    </xs:group>
    
    <xs:attributeGroup name="{@name}.attributes">
      <xs:attributeGroup ref="global-atts"/>
      <xsl:variable name="attributesPatternName" as="xs:string"
        select="concat(@name, '.attributes')"
      />
      <xsl:apply-templates 
        select="../../rng:define[@name = $attributesPatternName]" 
        mode="doAttributeListGeneration"/>      
    </xs:attributeGroup>
    <!-- 
  
  
    
    -->
  </xsl:template>
  
  <xsl:template match="*" mode="element-decls" priority="-1">
    <xsl:message> - [WARN] Mode element-decls: Unhandled element <xsl:value-of select="name(..), '/', name(.)"/></xsl:message>
  </xsl:template>

  <xsl:template match="*" mode="attribute-decls" priority="-1">
    <xsl:message> - [WARN] Mode attribute-decls: Unhandled element <xsl:value-of select="name(..), '/', name(.)"/></xsl:message>
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
  
  <xsl:template mode="generateXsdContentModel attribute-decls element-decls" match="a:*">
    <!-- Ignore -->
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel attribute-decls element-decls" match="rng:define">
    <xs:sequence>
      <xsl:apply-templates mode="#current"/>
    </xs:sequence>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel element-decls attribute-decls" match="rng:zeroOrMore">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel element-decls attribute-decls" match="rng:oneOrMore">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel element-decls attribute-decls" match="rng:optional">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel element-decls" match="rng:zeroOrMore/rng:choice">
    <xs:choice minOccurs="0" maxOccurs="unbounded">
      <xsl:apply-templates mode="#current"/>
    </xs:choice>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel element-decls" match="rng:oneOrMore/rng:choice">
    <xs:choice minOccurs="1" maxOccurs="unbounded">
      <xsl:apply-templates mode="#current"/>
    </xs:choice>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel element-decls" match="rng:optional/rng:choice">
    <xs:choice minOccurs="0">
      <xsl:apply-templates mode="#current"/>
    </xs:choice>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModels" match="rng:ref">
     <xs:group ref="{@name}"/>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel" match="rng:optional/rng:ref">
     <xs:group ref="{@name}" minOccurs="0"/>
  </xsl:template>
  
  <xsl:template mode="generateXsdContentModel element-decls" match="rng:text">
    <!-- Becomes mixed="true" -->
  </xsl:template>

  <xsl:template mode="generateXsdContentModel element-decls" match="rng:empty">
    <!-- Empty sequence in XSD -->
  </xsl:template>

  
  <xsl:template mode="generateXsdContentModel" match="*" priority="-1">
    <xsl:message> - [WARN] generateXsdContentModel: Unhandled element <xsl:value-of select="concat(name(..), '/', name(.))"/></xsl:message>
  </xsl:template>
  
  <!-- ==============================
       Mode generateXsdAttributeDecls
       ============================== -->
 
 
  <xsl:template mode="doAttributeListGeneration" match="rng:ref" priority="10">
    <!--<xsl:message> + [DEBUG] generateXsdAttributeDecls: rng:ref name="<xsl:value-of select="@name"/>"</xsl:message>-->
    <xsl:variable name="pattern" select="key('definesByName', string(@name))"
      as="element(rng:define)*"
    />
    <xsl:apply-templates mode="generateXsdAttributeDecls" select="$pattern"/>
  </xsl:template>

  <xsl:template mode="generateXsdAttributeDecls" match="rng:ref">
    <xs:attributeGroup ref="{@name}"/>
  </xsl:template>

  <xsl:template mode="generateXsdAttributeDecls" match="rng:define">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>

  <xsl:template mode="generateXsdAttributeDecls" match="rng:optional">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>

  <xsl:template mode="generateXsdAttributeDecls attribute-decls" match="rng:attribute[matches(@name,'^xml:.+')]"
    priority="100">
    <!-- XML namespace attributes are handled through the xml.xsd module -->
  </xsl:template>

  <xsl:template mode="generateXsdAttributeDecls element-decls" match="rng:define/rng:attribute ">
    <!-- NOTE: attributes not declared within rng:optional are required -->
    <!-- FIXME: Handle enumerated attributes correctly -->
    <xs:attribute name="{@name}" use="required">
      <xsl:if test="not(rng:choice)">
        <xsl:attribute name="type" select="'xs:string'"/>
      </xsl:if>
      <xsl:apply-templates mode="#current"/>
    </xs:attribute>
  </xsl:template>
  
  <xsl:template mode="generateXsdAttributeDecls attribute-decls" match="rng:optional/rng:attribute" priority="10">
    <!-- FIXME: Handle enumerated attributes correctly -->
    <xs:attribute name="{@name}">
      <xsl:if test="not(rng:choice)">
        <xsl:attribute name="type" select="'xs:string'"/>
      </xsl:if>
      <xsl:apply-templates mode="#current"/>
    </xs:attribute>
  </xsl:template>
  
  <xsl:template mode="generateXsdAttributeDecls" match="*" priority="-1">
    <xsl:message> - [WARN] generateXsdAttributeDecls: Unhandled element <xsl:value-of select="concat(name(..), '/', name(.))"/></xsl:message>
  </xsl:template>
  
  <xsl:template match="a:*" mode="generateXsdAttributeDecls">
    <!-- Ignore annotations -->
  </xsl:template>
  
  
  <!-- ==============================
       Mode documentation
       ============================== -->
  
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