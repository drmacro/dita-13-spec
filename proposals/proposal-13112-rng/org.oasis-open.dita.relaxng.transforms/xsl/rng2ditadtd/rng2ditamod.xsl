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
  exclude-result-prefixes="xs xd rng rnga relpath a str ditaarch dita rngfunc local rng2ditadtd"
  version="2.0"  >

  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p>RNG to DITA DTD Converter</xd:p>
      <xd:p><xd:b>Created on:</xd:b> Feb 16, 2013</xd:p>
      <xd:p><xd:b>Authors:</xd:b> ekimber, pleblanc</xd:p>
      <xd:p>This transform takes as input RNG-format DITA document type
      shells and produces from them vocabulary module file
        that reflect the RNG definitions and conform to the DITA 1.3
        DTD coding requirements.
      </xd:p>
    </xd:desc>
  </xd:doc>


  <!-- ==============================
       .mod file generation mode
       ============================== -->

  <xsl:template match="/" mode="moduleFile">
    <xsl:param name="thisFile" tunnel="yes" as="xs:string" />
    <xsl:apply-templates mode="#current" >
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="rng:grammar" mode="moduleFile">
    <xsl:param name="thisFile" tunnel="yes" as="xs:string" />

    <xsl:variable name="moduleTitle" 
      select="rngfunc:getModuleTitle(.)" 
      as="xs:string"/>
    <xsl:variable name="moduleShortName" as="xs:string"
      select="rngfunc:getModuleShortName(.)"
    />
    <xsl:variable name="domainPrefix" 
      as="xs:string"
      select="rngfunc:getModuleShortName(.)"
    /> 

    <xsl:text>&lt;?xml version="1.0" encoding="UTF-8"?>&#x0a;</xsl:text>
    
    <xsl:apply-templates select="dita:moduleDesc" mode="header-comment"/>
    <xsl:if test="$moduleShortName = 'topic'">
    <xsl:text><![CDATA[
<!-- ============================================================= -->
<!--                   ARCHITECTURE ENTITIES                       -->
<!-- ============================================================= -->

<!-- default namespace prefix for DITAArchVersion attribute can be
     overridden through predefinition in the document type shell   -->
<!ENTITY % DITAArchNSPrefix
  "ditaarch"
>

<!-- must be instanced on each topic type                          -->
<!ENTITY % arch-atts 
             "xmlns:%DITAArchNSPrefix; 
                        CDATA
                                  #FIXED 'http://dita.oasis-open.org/architecture/2005/'
              %DITAArchNSPrefix;:DITAArchVersion
                         CDATA
                                  ']]></xsl:text><xsl:value-of select="$ditaVersion"/><xsl:text><![CDATA['
  "
>


]]></xsl:text>
    </xsl:if>
    <xsl:if test="not($moduleShortName = ('metaDecl', 'tblDecl'))">
      <xsl:text>
&lt;!-- ============================================================= -->
&lt;!--                   ELEMENT NAME ENTITIES                       -->
&lt;!-- ============================================================= -->

</xsl:text>
    </xsl:if>
    <!-- Special Case: the commonElements.mod file references commonElements.ent,
         which contains the element type name entities for the 
         common elements. This organization isn't required by DTD processing
         rules but is just how it was done.
         
      -->
   <xsl:choose>
    <xsl:when test="$moduleShortName = 'commonElements'">
      <xsl:text>
&lt;!ENTITY % commonDefns</xsl:text>
      <xsl:choose>
        <xsl:when test="$usePublicIDsInShellBoolean">
<xsl:text>
  PUBLIC "-//OASIS//ENTITIES DITA </xsl:text>          
<xsl:value-of select="$ditaVersion"/><xsl:text> Common Elements//EN" </xsl:text>
        </xsl:when>
        <xsl:otherwise>
<xsl:text>
  SYSTEM </xsl:text>          
        </xsl:otherwise>
      </xsl:choose>
<xsl:text>         "commonElements.ent" 
>%commonDefns;
</xsl:text>
    </xsl:when>
     <xsl:when test="$moduleShortName = 'topic'">
<xsl:text>
&lt;!--                    Definitions of declared elements           -->
&lt;!ENTITY % topicDefns</xsl:text>
       <xsl:choose>
       <xsl:when test="$usePublicIDsInShellBoolean">
  <xsl:text>
    PUBLIC "-//OASIS//ENTITIES DITA </xsl:text><xsl:value-of select="$ditaVersion"/><xsl:text> Topic Definitions//EN"</xsl:text>          
       </xsl:when>
         <xsl:otherwise>
           <xsl:text>
    SYSTEM</xsl:text>
         </xsl:otherwise>
       </xsl:choose>
        <xsl:text> "topicDefn.ent" 
>%topicDefns;

&lt;!--                      Content elements common to map and topic -->
&lt;!ENTITY % commonElements
</xsl:text>
       <xsl:choose>
       <xsl:when test="$usePublicIDsInShellBoolean">
  <xsl:text>
  PUBLIC "-//OASIS//ELEMENTS DITA </xsl:text><xsl:value-of select="$ditaVersion"/><xsl:text> Common Elements//EN"</xsl:text> 
       </xsl:when>
         <xsl:otherwise>
           <xsl:text>
  SYSTEM
</xsl:text>
         </xsl:otherwise>
       </xsl:choose><xsl:text>
         "commonElements.mod" 
>%commonElements;

&lt;!--                       MetaData Elements, plus indexterm       -->
&lt;!ENTITY % metaXML 
</xsl:text>
       <xsl:choose>
       <xsl:when test="$usePublicIDsInShellBoolean">
  <xsl:text>  PUBLIC "-//OASIS//ELEMENTS DITA </xsl:text><xsl:value-of select="$ditaVersion"/><xsl:text> Metadata//EN"</xsl:text> 
       </xsl:when>
         <xsl:otherwise>
           <xsl:text>
    SYSTEM</xsl:text>
         </xsl:otherwise>
       </xsl:choose><xsl:text>
         "metaDecl.mod" 
>%metaXML;
</xsl:text>       
     </xsl:when>
     <xsl:when test="$moduleShortName = ('metaDecl')">
       <!-- metaDecl.mod does not include it's element name entities but tblDecl does -->
     </xsl:when>
     <xsl:otherwise>
        <xsl:apply-templates mode="element-name-entities" select="rng:define"/>       
     </xsl:otherwise>
   </xsl:choose>
    
    <xsl:if test="$moduleShortName = 'topic'">
<xsl:text><![CDATA[
<!-- ============================================================= -->
<!--                COMMON ENTITY DECLARATIONS                     -->
<!-- ============================================================= -->

<!-- Use of this entity is deprecated; the nbsp entity will be 
     removed in DITA 2.0.                                          -->
<!ENTITY nbsp                   "&#xA0;"                             >


<!-- ============================================================= -->
<!--                    NOTATION DECLARATIONS                      -->
<!-- ============================================================= -->
<!--                    DITA uses the direct reference model; 
                        notations may be added later as required   -->


<!-- ============================================================= -->
<!--                    STRUCTURAL MEMBERS                         -->
<!-- ============================================================= -->


<!ENTITY % info-types 
  "topic
  "
> 

<!-- ============================================================= -->
<!--                    COMMON ATTLIST SETS                        -->
<!-- ============================================================= -->

]]></xsl:text>
      
<!-- FIXME: The common attribute lists (relational-atts, rel-atts)
            should go here to exactly match 1.2 organization
            but they are processed in the 
            element declaration processing below.
  -->

<xsl:text><![CDATA[
<!-- ============================================================= -->
<!--                    SPECIALIZATION OF DECLARED ELEMENTS        -->
<!-- ============================================================= -->

<!ENTITY % topic-info-types 
  "%info-types;
  "
>

<!-- ============================================================= -->
<!--                    DOMAINS ATTRIBUTE OVERRIDE                 -->
<!-- ============================================================= -->

<!ENTITY included-domains 
  ""
>

]]></xsl:text>      
    </xsl:if>

    <xsl:text>
&lt;!-- ============================================================= -->
&lt;!--                    ELEMENT DECLARATIONS                       -->
&lt;!-- ============================================================= -->

</xsl:text>    

    <!-- Process all defines in the order they occur, except
         those that define @class attributes, which come at the
         end of the module file.
         
      -->
    <xsl:choose>
      <xsl:when test="$moduleShortName = 'topic'">
        <!-- All the includes for the topic module are hard coded above -->
        <xsl:apply-templates mode="element-decls" 
          select="(rng:define) except 
                      (rng:define[.//rng:attribute[@name='class']])"
          >
          <xsl:with-param name="domainPfx" select="$domainPrefix" tunnel="yes" as="xs:string" />
        </xsl:apply-templates>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates mode="element-decls" 
          select="(rng:define | rng:include) except 
                      (rng:define[.//rng:attribute[@name='class']])"
          >
          <xsl:with-param name="domainPfx" select="$domainPrefix" tunnel="yes" as="xs:string" />
        </xsl:apply-templates>
      </xsl:otherwise>
    </xsl:choose>

<xsl:text>
&lt;!-- ============================================================= -->
&lt;!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
&lt;!-- ============================================================= -->
  
</xsl:text>    

    <xsl:apply-templates mode="class-att-decls" 
      select="rng:define[.//rng:attribute[@name='class']]"/>

<xsl:text>
&lt;!-- ================== </xsl:text><xsl:value-of select="$moduleTitle"/><xsl:text> ==================== -->&#x0a; </xsl:text>    
  </xsl:template>
  
  <!--================================
      Mode element-name-entities
      ================================ -->
  
  <xsl:template mode="element-name-entities" match="rng:define">
    <xsl:apply-templates mode="#current" select="rng:element"/>
  </xsl:template>

  <xsl:template mode="element-name-entities" match="rng:element">    
    <!-- Generate an element name entity declaration 
    
    <!ENTITY % b           "b"                                           >

    -->
    <xsl:variable name="tagname" select="string(@name)" as="xs:string"/>    
    <xsl:text>&lt;!ENTITY % </xsl:text>
    <xsl:variable name="paddedName" as="xs:string"
      select="str:pad($tagname, 12)"
    />
    <xsl:value-of select="$paddedName"/>
    <xsl:if test="not(ends-with($paddedName, ' '))">
      <xsl:text>&#x0a;</xsl:text>
      <xsl:value-of select="str:indent(23)"/>
    </xsl:if>    
    <xsl:value-of select="str:pad(concat('&quot;', $tagname, '&quot;'), 46)"/>
    <xsl:text>&gt;&#x0a;</xsl:text>    
  </xsl:template>

  <!--================================
      Mode element-decls
      
      This mode is the general mode for handling defines
      ================================ -->

  <!-- ================================
       Handle defines that do not directly
       generate any output in .mod files.
       ================================ -->
  
  <!-- Class attributes are handled in a separate mode -->
  <xsl:template match="rng:define[.//rng:attribute[@name='class']]" mode="element-decls" priority="10"/>
  

  <xsl:template match="rng:define[starts-with(@name, concat(rngfunc:getModuleShortName(ancestor::rng:grammar), '-'))]" 
    mode="element-decls" priority="30"
  >
  </xsl:template>

  <xsl:template match="rng:define[@combine = 'choice']" mode="element-decls" priority="20">
      <!-- Domain integration entity. Not output in the DTD. -->
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
      <!-- reference to element name in this module, will be in the entity file -->
  </xsl:template>

  <xsl:template match="rng:define[count(rng:*)=1 and rng:ref and not(key('definesByName',rng:ref/@name)) and ends-with(rng:ref/@name, '.element')]" 
                mode="element-decls" priority="20">
      <!-- reference to element name in another module, will be in entity file -->
  </xsl:template>
  
  <!-- ================================
       Process defines that result in 
       DTD declarations.
       ================================ -->

  <xsl:template match="rng:define[rng:element]" mode="element-decls" priority="15">
<!--    <xsl:message> + [DEBUG] mode: element-decls: element-defining define, name="<xsl:value-of select="@name"/>"</xsl:message>-->
    <xsl:apply-templates mode="#current" select="rng:element"/>
  </xsl:template>

  <xsl:template match="rng:define[not(.//rng:attribute[@name='class'])]" mode="element-decls" priority="8">
    <!-- Main template for generating parameter entity declarations from defines. 
    
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
        <xsl:apply-templates mode="generate-parment-decl-from-define" select="."/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template mode="generate-parment-decl-from-define" match="rng:define[@name = 'arch-atts']" priority="10">
    <!-- arch-atts declaration is hard-coded -->
  </xsl:template>
  
  <xsl:template mode="generate-parment-decl-from-define" match="rng:define">
    <xsl:param name="indent" as="xs:integer" select="14"/>
    <xsl:param name="nlBeforeClosingQuote" as="xs:boolean" select="false()"/>
    
    <!-- FIXME: The following is a hack that depends on a consistent naming convention
         for attribute sets.
         
         The more complete solution I think requires producing a single-document resolved
         grammar (e.g., RNG simplification) and then examining the define in that 
         grammar to see if it has any attribute declarations.
      -->
    <xsl:variable name="isAttSet" as="xs:boolean"
      select="matches(@name, '-atts|attribute|\.att') or .//rng:attribute"
    />
    
<!--    <xsl:message> + [DEBUG] generate-parment-decl-from-define: name="<xsl:value-of select="@name"/>"</xsl:message>
-->
    <xsl:text>&lt;!ENTITY % </xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text>&#x0a;</xsl:text>
    <xsl:value-of select="str:indent($indent)"/>        
    <xsl:text>&quot;</xsl:text>
    <xsl:variable name="addparen" as="xs:boolean"
      select="not($isAttSet) and count(rng:*) &gt; 1"/>
    <xsl:if test="$addparen">
      <xsl:text>(</xsl:text>
    </xsl:if>
    <xsl:apply-templates mode="element-decls">
      <xsl:with-param name="indent" 
        select="if ($addparen) then $indent + 2 else $indent + 1" 
        as="xs:integer" 
        tunnel="yes"
      />
      <xsl:with-param name="isAttSet" as="xs:boolean" select="$isAttSet" tunnel="yes"/>      
    </xsl:apply-templates>
    <xsl:if test="$addparen">
      <xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:if test="$nlBeforeClosingQuote">
      <xsl:text>&#x0a;</xsl:text>
      <xsl:value-of select="str:indent(2)"/>
    </xsl:if>
    <xsl:text>&quot;</xsl:text>
    <xsl:text>&#x0a;</xsl:text>
    <xsl:text>&gt;&#x0a;</xsl:text>
  </xsl:template>
  
  <xsl:template match="rng:zeroOrMore" mode="element-decls" priority="10">
    <xsl:param name="indent" as="xs:integer" tunnel="yes"/>
    <xsl:if test="not(parent::rng:define) or preceding-sibling::rng:*">
      <xsl:value-of select="str:indent($indent)"/>
    </xsl:if>
    <xsl:text>(</xsl:text>
    <xsl:apply-templates mode="#current" >
      <xsl:with-param name="indent" as="xs:integer" tunnel="yes" 
        select="$indent + 1"/>
    </xsl:apply-templates>
    <xsl:text>)*</xsl:text>
    <xsl:if test="not(position()=last())">
      <xsl:text>,&#x0a;</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="rng:oneOrMore" mode="element-decls" priority="10">
    <xsl:param name="indent" as="xs:integer" tunnel="yes"/>
    <xsl:if test="preceding-sibling::rng:*">
      <xsl:value-of select="str:indent($indent)"/>
    </xsl:if>
    <xsl:text>(</xsl:text>
    <xsl:apply-templates mode="#current" >
      <xsl:with-param name="indent" as="xs:integer" tunnel="yes" 
        select="$indent + 1"/>
    </xsl:apply-templates>
    <xsl:text>)+</xsl:text>
    <xsl:if test="not(position()=last())">
      <xsl:text>,&#x0a;</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="rng:group" mode="element-decls">
    <xsl:param name="indent" as="xs:integer" tunnel="yes"/>
    <xsl:if test="preceding-sibling::rng:*">
      <xsl:value-of select="str:indent($indent)"/>
    </xsl:if>
    <xsl:text>(</xsl:text>
    <xsl:apply-templates mode="#current" >
      <xsl:with-param name="indent" as="xs:integer" tunnel="yes" 
        select="$indent + 1"/>
    </xsl:apply-templates>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="rng:attribute/rng:choice" mode="element-decls" priority="15">
    <xsl:param name="indent" as="xs:integer" tunnel="yes"/>
    <xsl:if test="preceding-sibling::rng:* or 
      parent::rng:*[not(self::rng:define)]/preceding-sibling::rng:*">
      <xsl:value-of select="str:indent($indent)"/>
    </xsl:if>
    <xsl:text>(</xsl:text>
    <xsl:for-each select="rng:*">
      <xsl:if test="not(position()=1)">
        <xsl:text> |&#x0a;</xsl:text>
      </xsl:if>
      <xsl:apply-templates select="." mode="#current" >
        <xsl:with-param name="indent" as="xs:integer" tunnel="yes" 
          select="$indent"/>
      </xsl:apply-templates>
    </xsl:for-each>
    <xsl:text>)</xsl:text>
  </xsl:template>
  
  <!-- Choice for content models, not attribute decls -->
  <xsl:template match="rng:choice" mode="element-decls" priority="10">
    <xsl:param name="indent" as="xs:integer" tunnel="yes"/>
    <xsl:for-each select="rng:*">
      <xsl:if test="not(position()=1)">
        <xsl:text> |&#x0a;</xsl:text>
      </xsl:if>
      <xsl:apply-templates select="." mode="#current" />      
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="rng:ref" mode="element-decls" priority="10">
    <xsl:param name="indent" as="xs:integer" tunnel="yes"/>
    <xsl:param name="isAttSet" as="xs:boolean" tunnel="yes"/>
    <xsl:if test="preceding-sibling::rng:*">
      <!-- NOTE: It is up to the processor of the group
                 this ref must be part of to emit
                 a newline after whatever precedes this ref. 
      -->
      <xsl:value-of select="str:indent($indent)"/>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="@name='any'">
        <xsl:text>ANY </xsl:text>
      </xsl:when>
      <xsl:when test="not(node()) and key('definesByName',@name)/rng:element" >
        <!-- reference to element name -->
        <xsl:value-of select="key('definesByName',@name)/rng:element/@name" />
      </xsl:when>
      <xsl:when test="not(node()) and not(key('definesByName',@name)) and ends-with(@name, '.element')" >
        <!-- reference to element name in another module -->
        <xsl:value-of select="substring-before(@name,'.element')" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="entRef" as="node()*">
          <xsl:text>%</xsl:text><xsl:value-of select="@name" /><xsl:text>;</xsl:text>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="not($isAttSet) and parent::rng:define and count(../rng:*) > 1">
            <xsl:text>(</xsl:text>
            <xsl:sequence select="$entRef"/>
            <xsl:text>)</xsl:text>
            <xsl:if test="not(position() = last())">
              <xsl:text>,</xsl:text>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="$entRef"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="not(position() = last())">
      <xsl:text>&#x0a;</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="rng:text" mode="element-decls" priority="10">
    <!-- NOTE: #PCDATA must always be the first token in a repeating OR
         group so it will never be indented. -->
    <xsl:text>#PCDATA</xsl:text>
  </xsl:template>

  <xsl:template match="rng:value" mode="element-decls" priority="10">
    <xsl:param name="indent" as="xs:integer" tunnel="yes"/>
    <xsl:if test="preceding-sibling::rng:*">
      <xsl:value-of select="str:indent($indent)"/>
    </xsl:if>
    <xsl:value-of select="." />
  </xsl:template>

  <xsl:template match="rng:data" mode="element-decls" priority="10">
    <xsl:choose>
      <xsl:when test="@type='string'">
        <xsl:value-of select="'CDATA'" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="@type" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="rng:optional" mode="element-decls" priority="10">
    <xsl:param name="indent" as="xs:integer" tunnel="yes"/>
    <xsl:param name="isAttSet" as="xs:boolean" tunnel="yes"/>
    <xsl:choose>
      <xsl:when test="not($isAttSet)">
        <!-- optional element content -->
        <xsl:if test="preceding-sibling::rng:*">
          <xsl:value-of select="str:indent($indent)"/>
        </xsl:if>
        <xsl:text>(</xsl:text>
        <xsl:apply-templates mode="#current" >
          <xsl:with-param name="indent" select="$indent + 1" as="xs:integer" tunnel="yes"/>
        </xsl:apply-templates>
        <xsl:text>)?</xsl:text>
        <xsl:if test="not(position()=last())">
          <xsl:text>,&#x0a;</xsl:text>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <!-- optional attribute value -->
        <xsl:apply-templates mode="#current" />
        <xsl:if test="not(position()=last())">
          <xsl:text>&#x0a;</xsl:text>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="rng:empty" mode="element-decls" priority="10">
    <xsl:choose>
      <xsl:when test="ancestor::rng:element">
        <!-- empty element content -->
        <xsl:text>EMPTY</xsl:text>
      </xsl:when>
      <xsl:when test="ends-with(ancestor::rng:define/@name, '.content')">
        <!-- empty element content in parameter entity -->
        <xsl:text>EMPTY</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <!-- empty attribute value -->
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="rng:attribute" mode="element-decls" priority="10">
    <!--
      <!ENTITY % data-element-atts
             '%univ-atts;
              name 
                        CDATA 
                                  #IMPLIED
              scope 
                        (external | 
                         local | 
                         peer | 
                         -dita-use-conref-target) 
                                  #IMPLIED'
      >

      -->
    <xsl:variable name="attributePos">
      <xsl:number level="any" from="rng:define"        
        count="rng:define/rng:attribute | 
               rng:optional | 
               rng:define/rng:ref"/>
    </xsl:variable>
    <xsl:if test="$attributePos > 1">
      <!-- The generator of the attlist decl or parameter entity
           has to ensure a newline before the attribute
        -->
      <xsl:value-of select="str:indent(15)"/>
    </xsl:if>
    <xsl:value-of select="@name" />
    <xsl:text>&#x0a;</xsl:text>
    <xsl:value-of select="str:indent(26)"/>
    <xsl:choose>
      <xsl:when test="not(node())">
        <xsl:text>CDATA</xsl:text>
      </xsl:when>
      <xsl:when test="count(node())=1 and rng:value">
        <xsl:text>(</xsl:text>
        <xsl:apply-templates mode="#current" >
          <xsl:with-param name="indent" select="26" as="xs:integer" tunnel="yes"/>
        </xsl:apply-templates>
        <xsl:text>)</xsl:text>
        <xsl:if test="@rnga:defaultValue">
          <xsl:text>&#x0a;</xsl:text>
          <xsl:value-of select="str:indent(36)"/>
          <xsl:text>#FIXED </xsl:text>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates mode="#current" >
          <xsl:with-param name="indent" select="27" as="xs:integer" tunnel="yes"/>
        </xsl:apply-templates>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@rnga:defaultValue">
        <xsl:text>&#x0a;</xsl:text>
        <xsl:value-of select="str:indent(36)"/>
        <xsl:text>'</xsl:text>
        <xsl:value-of select="@rnga:defaultValue" />
        <xsl:text>'</xsl:text>
      </xsl:when>
      <xsl:when test="local-name(..)='optional'">
        <xsl:text>&#x0a;</xsl:text>
        <xsl:value-of select="str:indent(36)"/>
        <xsl:text>#IMPLIED</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>&#x0a;</xsl:text>
        <xsl:value-of select="str:indent(36)"/>
        <xsl:text>#REQUIRED</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="position() != last()">
      <xsl:text>&#x0a;</xsl:text>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="rng:include" mode="element-decls">
    <xsl:variable name="thisModuleURI" as="xs:string"
      select="rngfunc:getGrammarUri(root(.)/*)"
    />
    <xsl:variable name="targetUri" as="xs:string"
      select="relpath:newFile(relpath:getParent($thisModuleURI), @href)"
    />
    <xsl:variable name="module" select="document($targetUri)"/>
    <xsl:choose>
      <xsl:when test="$module">
          <xsl:apply-templates select="$module" mode="entityDeclaration">
                <xsl:with-param 
                  name="entityType" 
                  as="xs:string" 
                  tunnel="yes"
                  select="'mod'"
                />
          </xsl:apply-templates>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message> - [ERROR] Failed to resolve grammar reference <xsl:value-of select="@href"/> using full URL "<xsl:value-of select="$targetUri"/>"</xsl:message>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- ================================
       Element declaration generation
       ================================ -->
  <xsl:template match="rng:element" mode="element-decls" priority="10">
    <!-- Generate the content and attribute list parameter entities: -->
    <!-- Generate the element type and attribute list declarations -->
<!--    <xsl:message> + [DEBUG] element-decls: rng:element, name="<xsl:value-of select="@name"/>" </xsl:message>-->
    <xsl:variable name="longName" as="xs:string"
      select="if (@ditaarch:longName) 
                 then @ditaarch:longName
                 else concat(upper-case(substring(@name, 1, 1)), substring(@name, 2))"
    />
    <xsl:text>&lt;!--</xsl:text>
    <xsl:value-of select="str:indent(20)"/>
    <xsl:text>LONG NAME: </xsl:text>
    <xsl:value-of select="str:pad($longName, 31)"/>
    <xsl:text> --&gt;&#x0a;</xsl:text>
    
    <!-- .content and .attributes parameter entity declarations: -->
    <xsl:apply-templates mode="generate-element-type-parameter-entities" 
      select="rng:ref[ends-with(@name, '.content')], 
              rng:ref[ends-with(@name, '.attlist')]">
      <xsl:with-param name="tagname" tunnel="yes" as="xs:string" select="@name"/>
    </xsl:apply-templates>
    
    <!-- Element type and attribute list declarations. -->
    <xsl:apply-templates select="rng:ref[ends-with(@name, '.content')]" mode="generate-element-decl">
      <xsl:with-param name="tagname" tunnel="yes" as="xs:string" select="@name"/>
    </xsl:apply-templates>
    <!-- NOTE: in the RNG, the reference in the element decl is to .attlist, not .attributes. -->
    <xsl:apply-templates select="rng:ref[ends-with(@name, '.attlist')]" mode="generate-attlist-decl">
      <xsl:with-param name="tagname" tunnel="yes" as="xs:string" select="@name"/>
    </xsl:apply-templates>
    <xsl:text>&#x0a;&#x0a;</xsl:text>
  </xsl:template>
  
  <xsl:template mode="generate-element-type-parameter-entities" match="rng:ref">
    <xsl:variable name="define" as="element()?" 
      select="key('definesByName', @name)[1]"
    />
    <xsl:if test="count($define) = 0">
      <xsl:message> - [WARN] No rng:define element for referenced name "<xsl:value-of select="@name"/>".</xsl:message>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="ends-with($define/@name, '.attlist')">
        <!-- .attlist define is always a reference to the .attributes definition -->
        <xsl:apply-templates select="$define/rng:ref" mode="#current"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="indent" as="xs:integer"
          select="if (ends-with(@name, '.content')) then 23 else 14"
        />
        <xsl:apply-templates select="$define" mode="generate-parment-decl-from-define">        
           <xsl:with-param name="indent" as="xs:integer" select="$indent"/>
        </xsl:apply-templates>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template mode="generate-attlist-decl" match="rng:ref[ends-with(@name, '.attlist')]">
    <xsl:variable name="define" as="element()?" 
      select="key('definesByName', @name)[1]"
    />
    <xsl:if test="count($define) = 0">
      <xsl:message> - [WARN] No rng:define element for referenced name "<xsl:value-of select="@name"/>".</xsl:message>
    </xsl:if>
    <xsl:apply-templates select="$define/rng:ref" mode="#current"/>
  </xsl:template>
  

  <xsl:template mode="generate-element-decl" match="rng:ref">
    <xsl:param name="tagname" tunnel="yes" as="xs:string"/>
    <xsl:text>&lt;!ELEMENT  </xsl:text>
    <xsl:value-of select="$tagname" />
    <xsl:text> </xsl:text>
    <xsl:value-of select="concat('%', @name, ';')"/>
    <xsl:text>&gt;&#x0a;</xsl:text>
  </xsl:template>
  
  <xsl:template mode="generate-attlist-decl" match="rng:ref[ends-with(@name, '.attributes')]">
    <xsl:param name="tagname" tunnel="yes" as="xs:string"/>
    
    <xsl:variable name="moduleShortName" as="xs:string"
      select="rngfunc:getModuleShortName(root(.)/*)"
    />

    <xsl:text>&lt;!ATTLIST  </xsl:text>
    <xsl:value-of select="$tagname" />
    <xsl:text> </xsl:text>
    <xsl:value-of select="concat('%', @name, ';')"/>
    <xsl:if test="rngfunc:getModuleType(ancestor-or-self::rng:grammar) = ('topic', 'map')">
<xsl:text>
                 %arch-atts;
                 domains 
                        CDATA
                                  "&amp;included-domains;"
</xsl:text>      
    </xsl:if>
    <xsl:text>&gt;&#x0a;</xsl:text>
  </xsl:template>
  
  <xsl:template mode="generate-attlist-decl" match="rng:ref" priority="-1">
    
  </xsl:template>
  

<!-- others -->
<!--  <xsl:template match="rng:include" mode="moduleFile">
    <!-\- FIXME: Use the public ID data from the module documentation -\->
    <xsl:variable name="includedDoc" select="document(@href)" />
    <xsl:if test="$includedDoc/rng:grammar">
      <xsl:variable name="includedDomain" select="normalize-space(substring-before(substring-after($includedDoc/comment()[1],'MODULE:'),'VERSION:'))" />
      <!-\- FIXME: Need to parameterize the public ID. See Issue 8. -\->
      <xsl:text>
  &lt;!ENTITY % </xsl:text><xsl:value-of select="substring-before(@href,'.')" /><xsl:text>
     PUBLIC "-//OASIS//ELEMENTS </xsl:text><xsl:value-of select="$includedDomain" /><xsl:text>//EN"
     "</xsl:text><xsl:value-of select="substring-before(@href,'.rng')" /><xsl:text>" 
&gt;%</xsl:text><xsl:value-of select="substring-before(@href,'.')" /><xsl:text>;

</xsl:text>
    </xsl:if>
  </xsl:template>
-->  

  <xsl:template match="comment()" mode="moduleFile" >
    <!-- FIXME: I don't think we want to echo comments from the RNG to the DTD -->
    <xsl:choose>
      <xsl:when test="not(following::rng:grammar)">
        <xsl:text>&lt;!-- </xsl:text><xsl:value-of select="translate(.,'&lt;&gt;','')"/><xsl:text> -->&#x0a;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <!-- Suppress comments in moduleFile mode -->
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="rng:attribute//rnga:documentation" mode="element-decls" />
  
  <!-- ====================
       Mode class-att-decls
       ==================== -->
  
  <xsl:template match="rng:define[.//rng:attribute[@name='class']]" mode="class-att-decls">
    <!-- specialization attribute declaration 
    
    <!ATTLIST b           %global-atts;  class CDATA "+ topic/ph hi-d/b "  >

    -->
    <xsl:variable name="tagnameLookupKey" select="@name" as="xs:string"/>
    <xsl:variable name="elementDec" as="element()?" select="key('attlistIndex',$tagnameLookupKey)"/>
    <xsl:variable name="tagname" select="if ($elementDec) then $elementDec/@name else '{unknown}'" as="xs:string?"/>
    <xsl:text>&lt;!ATTLIST  </xsl:text>
    <xsl:value-of select="str:pad($tagname, 12)"/>
    <xsl:text> %global-atts;  class CDATA </xsl:text>
    <xsl:value-of select="str:pad(concat('&quot;', string(./rng:optional/rng:attribute/@a:defaultValue), '&quot;'), 22)"/>
    <xsl:text>&gt;&#x0a;</xsl:text>
    
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
            <xsl:text>&lt;!-- </xsl:text>
            <xsl:value-of select="str:pad(., 61)"/>
            <xsl:text> -->&#x0a;</xsl:text>
          </xsl:matching-substring>
          <xsl:non-matching-substring>
            <xsl:value-of select="if (normalize-space(.) != '') then concat('&lt;-- ', ., ' -->') else ''"/>             
          </xsl:non-matching-substring>
        </xsl:analyze-string>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>&lt;!-- </xsl:text>
        <!-- FIXME: Escape anything that needs escaping -->
        <xsl:value-of select="string(.)"/>
        <xsl:text> -->&#x0a;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>