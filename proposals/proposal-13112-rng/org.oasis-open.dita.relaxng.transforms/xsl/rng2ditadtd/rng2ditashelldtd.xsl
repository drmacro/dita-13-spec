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
      <xd:p>RNG to DITA DTD Converter</xd:p>
      <xd:p><xd:b>Created on:</xd:b> Feb 16, 2013</xd:p>
      <xd:p><xd:b>Authors:</xd:b> ekimber, pleblanc</xd:p>
      <xd:p>This transform takes as input RNG-format DITA document type
      shells and produces from them the DTD shell that
        that reflects the RNG definitions and conforms to the DITA 1.3
        DTD coding requirements.
      </xd:p>
    </xd:desc>
  </xd:doc>

  <!-- ==============================
       .dtd file generation mode
       ============================== -->

  <xsl:template match="rng:grammar" mode="dtdFile">
    <xsl:param name="dtdFilename" tunnel="yes" as="xs:string" />
    <xsl:param name="dtdDir" tunnel="yes" as="xs:string" />
    <xsl:param name="modulesToProcess" tunnel="yes" as="document-node()*" />
    
    <xsl:variable name="rootElement" 
      select="substring-before(/*/rng:start/rng:ref/@name,'.element')" 
      as="xs:string" />
    
    <xsl:message> + [INFO] === Generating DTD shell <xsl:value-of select="$dtdFilename" />...</xsl:message>
    
    <xsl:variable name="rootClass"  as="xs:string">
      <xsl:choose>
        <xsl:when test="count(*)=1 and rng:include">
            <xsl:value-of select="''" />
        </xsl:when>
        <xsl:when test="rng:define[@name=concat($rootElement,'.attlist')]">
          <xsl:value-of          select="/rng:define[@name=concat($rootElement,'.attlist')]//rng:attribute[@name='class']/@rnga:defaultValue" />
        </xsl:when>
        <xsl:when test="count($modulesToProcess) &gt; 0">
            <xsl:for-each select="$modulesToProcess">
              <xsl:if test="/*/rng:define[@name=concat($rootElement,'.attlist')][.//rng:attribute/@name='class']">
                <xsl:value-of
                  select="./*/rng:define[@name=concat($rootElement,'.attlist')]//rng:attribute[@name='class']/@rnga:defaultValue" 
                />
              </xsl:if>
            </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="''" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="shellType" select="substring-before(tokenize($rootClass,' ')[2],'/')" />
    
    <xsl:if test="$shellType != 'topic' and $shellType != 'map'">
      <xsl:message terminate="yes"> + [ERROR] Root element type <xsl:value-of select="$rootElement"/> is not of class topic/* or map/*, found "<xsl:value-of select="$shellType"/>" in @class value "<xsl:value-of select="$rootClass"/>"</xsl:message>
    </xsl:if>
    
    <!-- ====================================
         Start generating the shell DTD file:
         ==================================== -->
    
    <xsl:text>&lt;?xml version="1.0" encoding="UTF-8"?>&#x0a;</xsl:text>

    <xsl:apply-templates select="a:documentation[position() = 1]" mode="header-comment"/>

    <xsl:choose>
      <xsl:when test="$shellType='map'">
<xsl:text>
&lt;!-- ============================================================= -->
&lt;!--                MAP ENTITY DECLARATIONS                        -->
&lt;!-- ============================================================= -->
</xsl:text>
      </xsl:when>
      <xsl:when test="$shellType='topic'">
<xsl:text>
&lt;!-- ============================================================= -->
&lt;!--              TOPIC ENTITY DECLARATIONS                        -->
&lt;!-- ============================================================= -->
</xsl:text>
      </xsl:when>
    </xsl:choose>
    <xsl:choose>
      <!-- The base topic module is a special case in that it has no
           corresponding .ent file.
        -->
      <xsl:when test="count(*)=1 and rng:include">
        <!--  simple redirection, as in technicalContent\glossary.dtd -->
        <xsl:apply-templates mode="dtdRedirect" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates 
          select="$modulesToProcess[rngfunc:getModuleType(*) = 'topic']" 
          mode="entityDeclaration" >
          <xsl:with-param 
            name="entityType" 
            select="'ent'" 
            as="xs:string" 
            tunnel="yes"
          />
        </xsl:apply-templates>

<xsl:text>
&lt;!-- ============================================================= -->
&lt;!--             DOMAIN ENTITY DECLARATIONS                        -->
&lt;!-- ============================================================= -->
</xsl:text>
        
        <xsl:apply-templates 
          select="$modulesToProcess[ends-with(rngfunc:getModuleType(*), 'Domain')]" 
          mode="entityDeclaration" 
        />

<xsl:text>
&lt;!-- ============================================================= -->
&lt;!--             DOMAIN ATTRIBUTES DECLARATIONS                    -->
&lt;!-- ============================================================= -->
</xsl:text>
        <!-- @TODO -->

<xsl:text>
&lt;!-- ============================================================= -->
&lt;!--                    DOMAIN EXTENSIONS                          -->
&lt;!-- ============================================================= -->
</xsl:text>
        <xsl:for-each select="$modulesToProcess[ends-with(/*/dita:moduleDesc/dita:moduleType, 'Domain')]/*/dita:moduleDesc" >
            <!--  element with domain extensions -->
            <xsl:text>&#x0a;&lt;!ENTITY % </xsl:text><xsl:value-of select="current-grouping-key()" /><xsl:text>    "</xsl:text>
            <xsl:apply-templates select="current-group()" mode="domainExtension" />
            <xsl:text>">&#x0a;</xsl:text>
        </xsl:for-each>

<xsl:text>
&lt;!-- ============================================================= -->
&lt;!--                    DOMAIN ATTRIBUTE EXTENSIONS                -->
&lt;!-- ============================================================= -->
</xsl:text>
        <xsl:apply-templates 
          select="$modulesToProcess" 
          mode="attributeExtension" 
        />

<xsl:text>
&lt;!-- ============================================================= -->
&lt;!--                    TOPIC NESTING OVERRIDE                     -->
&lt;!-- ============================================================= -->
</xsl:text>
        
    <xsl:apply-templates select="$modulesToProcess" mode="generateExternalEntityDecls"/>

        <!-- Only the ditabase doctype has a locally-defined containment
             section.
          -->
        <xsl:if test="$rootElement = 'ditabase'">
<xsl:text>
&lt;!-- ============================================================= -->
&lt;!--                    LOCALLY DEFINED CONTAINMENT                -->
&lt;!-- ============================================================= -->
</xsl:text>
          <xsl:apply-templates select="rng:define/rng:element" mode="localDefinition" />
        </xsl:if>

<xsl:text>
&lt;!-- ============================================================= -->
&lt;!--                    DOMAINS ATTRIBUTE OVERRIDE                 -->
&lt;!-- ============================================================= -->
</xsl:text>
        <xsl:text>&#x0a;&lt;!ENTITY included-domains&#x0a;    "</xsl:text>
        <xsl:apply-templates select="$modulesToProcess" mode="attributeOverride" />
        <xsl:text>">&#x0a;</xsl:text>

<xsl:text>
&lt;!-- ============================================================= -->
&lt;!--                    CONTENT CONSTRAINT INTEGRATION             -->
&lt;!-- ============================================================= -->
</xsl:text>
        <!-- @TODO -->

    <xsl:choose>
      <xsl:when test="$shellType='map'">
<xsl:text>
&lt;!-- ============================================================= -->
&lt;!--                      MAP ELEMENT INTEGRATION                  -->
&lt;!-- ============================================================= -->
</xsl:text>
      </xsl:when>
      <xsl:when test="$shellType='topic'">
<xsl:text>
&lt;!-- ============================================================= -->
&lt;!--                    TOPIC ELEMENT INTEGRATION                  -->
&lt;!-- ============================================================= -->
</xsl:text>
      </xsl:when>
      <xsl:otherwise>
<xsl:text>
&lt;!-- ============================================================= -->
&lt;!--                       ELEMENT INTEGRATION                     -->
&lt;!-- ============================================================= -->
</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
        <xsl:if test="starts-with($rootClass, '-')">
          <!-- This is a structural module -->
          <xsl:for-each select="tokenize($rootClass,' ')">
            <xsl:variable name="mainElement" select="substring-before(.,'/')" />
            <xsl:if test="not($mainElement='')">
              <xsl:apply-templates select="$modulesToProcess" mode="mainDeclaration">
                <xsl:with-param name="mainElement" select="$mainElement" as="xs:string" />
              </xsl:apply-templates>
            </xsl:if>
          </xsl:for-each>
        </xsl:if>

<xsl:text>
&lt;!-- ============================================================= -->
&lt;!--                    DOMAIN ELEMENT INTEGRATION                 -->
&lt;!-- ============================================================= -->
</xsl:text>
        <xsl:apply-templates select="$modulesToProcess" mode="domainElementDeclaration" />

      </xsl:otherwise>
    </xsl:choose>
    
    <xsl:message> + [INFO] === DTD shell <xsl:value-of select="$dtdFilename" /> generated.</xsl:message>

  </xsl:template>

  <xsl:template match="rng:include" mode="dtdRedirect">
    <xsl:variable name="dtdRedirect" select="substring-before(@href,'.rng')" />
    <xsl:variable name="dtdDoc" select="document(@href)" as="document-node()" />
    <xsl:variable name="dtdPublicId" select="normalize-space(substring-before(substring-after($dtdDoc/comment()[1],'MODULE:'),'VERSION:'))" />
    <xsl:text>&#x0a;&lt;!ENTITY % </xsl:text><xsl:value-of select="concat($dtdRedirect,'Dtd')" /> 
    <xsl:text>&#x0a;  PUBLIC "-//OASIS//DTD </xsl:text><xsl:value-of select="$dtdPublicId" /><xsl:text>//EN" &#x0a;         "</xsl:text>
    <xsl:value-of select="concat($dtdRedirect,'.dtd')" />
    <xsl:text>"&#x0a;>&#x0a;%</xsl:text>
    <xsl:value-of select="concat($dtdRedirect,'Dtd')" /> 
    <xsl:text>;&#x0a;</xsl:text>
    
  </xsl:template>



  <xsl:template match="*" mode="entityDeclaration">
    <xsl:apply-templates mode="#current" select="node()" />
  </xsl:template>

  <xsl:template match="rng:grammar" mode="entityDeclaration">
    <xsl:param 
      name="entityType" 
      as="xs:string" 
      tunnel="yes"
    /><!-- One of "ent" or "mod" -->
    
    <!-- Have to special case the base topic module as its .ent file is named "topicDefn.ent"
         rather than topic.ent.
      -->
    <xsl:variable name="entityNamePart" as="xs:string"
      select="if ($entityType = 'ent' and 
                 (rngfunc:getModuleType(.) = 'topic' and rngfunc:getModuleShortName(.) = 'topic'))
      then 'topicDefn'
      else relpath:getNamePart(document-uri(root(.)))"
    />
    <xsl:variable name="entFilename" as="xs:string" 
      select="
      concat($entityNamePart, '.ent')" 
    />
    <xsl:variable name="shortName" as="xs:string"
      select="rngfunc:getModuleShortName(.)"
    />
    <xsl:variable name="pubidTagname" as="xs:string"
      select="concat('dtd', if ($entityType = 'ent') then 'Ent' else 'Mod')"
    />
    <xsl:variable name="publicId" 
      select="rngfunc:getPublicId(., $pubidTagname)" 
    />
    <xsl:variable name="entityName" as="xs:string"
      select="
      if ($entityType = '.ent')
         then concat($shortName, '-dec')
         else concat($shortName, '-def')
      "
    />
        
    <xsl:text>&#x0a;&lt;!ENTITY % </xsl:text><xsl:value-of select="$entityName" /><xsl:text>&#x0a;</xsl:text> 
    <xsl:sequence select="str:indent(3)"/>
    <xsl:text>PUBLIC "</xsl:text><xsl:value-of select="$publicId" /><xsl:text>"&#x0a;</xsl:text>
    <xsl:sequence select="str:indent(9)"/>
    <xsl:sequence select="concat('&quot;', $entFilename, '&quot;')"/><xsl:text>&#x0a;</xsl:text>
    <xsl:text>&gt;</xsl:text><xsl:sequence select="concat('%', $entityName, ';')"/><xsl:text>&#x0a;</xsl:text>
  </xsl:template>

  <xsl:template match="*" mode="domainExtension">
    <xsl:apply-templates mode="#current" select="node()" />
  </xsl:template>

  <xsl:template match="*" mode="nestingOverride">
    <xsl:apply-templates mode="#current" select="node()" />
  </xsl:template>

  <xsl:template match="rng:zeroOrMore" mode="nestingOverride">
    <xsl:text>(</xsl:text>
    <xsl:apply-templates mode="#current" />
    <xsl:text>)*</xsl:text>
    <xsl:if test="not(position()=last())"><xsl:text>,</xsl:text></xsl:if>
  </xsl:template>

  <xsl:template match="rng:oneOrMore" mode="nestingOverride">
    <xsl:text>(</xsl:text>
    <xsl:apply-templates mode="#current" />
    <xsl:text>)+</xsl:text>
    <xsl:if test="not(position()=last())"><xsl:text>,</xsl:text></xsl:if>
  </xsl:template>

  <xsl:template match="rng:choice" mode="nestingOverride">
    <xsl:for-each select="rng:*">
        <xsl:apply-templates select="." mode="#current" />
        <xsl:if test="not(position()=last())"><xsl:text> |&#x0a;</xsl:text></xsl:if>
    </xsl:for-each>
    <xsl:if test="not(position()=last())"><xsl:text>,</xsl:text></xsl:if>
  </xsl:template>
  
  <xsl:template match="rng:optional" mode="nestingOverride">
    <xsl:text>(</xsl:text>
    <xsl:apply-templates mode="#current" />
    <xsl:text>)?</xsl:text>
    <xsl:if test="not(position()=last())"><xsl:text>,</xsl:text></xsl:if>
  </xsl:template>

  <xsl:template match="rng:define" mode="nestingOverride">
    <xsl:apply-templates mode="#current" />
  </xsl:template>

  <xsl:template match="rng:ref[@name='info-types']" mode="nestingOverride">
    <xsl:variable name="refTarget" select="key('definesByName',@name)" />
    <xsl:if test="$refTarget">
       <xsl:apply-templates select="$refTarget/rng:*" mode="#current" />
    </xsl:if>
  </xsl:template>

  <xsl:template match="rng:ref[ends-with(@name,'.element')]" mode="nestingOverride">
    <xsl:value-of select="substring-before(@name,'.element')" />
  </xsl:template>

  <xsl:template match="*" mode="attributeOverride">
    <xsl:apply-templates mode="#current" select="node()" />
  </xsl:template>

  <xsl:template match="rng:grammar" mode="attributeOverride">
    <xsl:variable name="domainValue" select="rng:define[@name='domains-atts-value']/rng:value[1]"/>
    <xsl:if test="$domainValue and not($domainValue='')">
      <xsl:variable name="domain" select="substring-before(tokenize($domainValue, ' ')[last()],')')"/>  
      <xsl:variable name="domainAtt">
        <xsl:choose>
          <xsl:when test="contains($domain,'+')">
            <xsl:value-of select="concat(substring-before($domain,'+'),'-att')" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat($domain,'-att')" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:text>&amp;</xsl:text><xsl:value-of select="$domainAtt" /><xsl:text>;&#x0a;</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="rng:ref" mode="dtdExtension domainExtension">
    <xsl:text>%</xsl:text><xsl:value-of select="@name" /><xsl:text>; </xsl:text>
    <xsl:if test="not(position()=last())">
      <xsl:text>|</xsl:text>
    </xsl:if>
    <xsl:text>&#x0a;</xsl:text>
  </xsl:template>

  <xsl:template match="rng:empty" mode="dtdExtension">
    <xsl:comment> empty </xsl:comment>
  </xsl:template>

  <xsl:template match="*" mode="localDefinition">
    <xsl:apply-templates mode="#current" select="node()" />
  </xsl:template>

  <xsl:template match="rng:element" mode="localDefinition">
    <xsl:apply-templates select="../rnga:documentation | rnga:documentation" />
    <!-- Element declaration -->
    <xsl:text>&lt;!ELEMENT  </xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text>    </xsl:text>
    <xsl:variable name="subElements" select="rng:*[not(ends-with(@name, '.attlist'))]"/>
    <xsl:if test="count($subElements) &gt; 1 or local-name($subElements[1])='text'">
      <xsl:text>(</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="$subElements" mode="moduleFile" />
    <xsl:if test="count($subElements) &gt; 1 or local-name($subElements[1])='text'">
      <xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:text> &gt;&#x0a;</xsl:text>

    <xsl:if test="rng:ref[ends-with(@name, '.attlist')]">
      <xsl:variable name="refPointer" select="rng:ref[ends-with(@name, '.attlist')]" />
      <xsl:variable name="refTarget" select="key('definesByName',$refPointer/@name)" />
      <xsl:choose>
        <xsl:when test="not($refTarget)">
          <xsl:text>&lt;!ATTLIST  </xsl:text>
          <xsl:value-of select="@name" />
          <xsl:text>&#x0a;  </xsl:text>
          <xsl:apply-templates select="$refPointer" mode="moduleFile" />
          <xsl:text>&gt;&#x0a;&#x0a;</xsl:text>
        </xsl:when>
        <xsl:when test="$refTarget/rng:empty">
          <xsl:text>&#x0a;</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="$refTarget/rnga:*" mode="moduleFile" />
          <xsl:text>&lt;!ATTLIST  </xsl:text>
          <xsl:value-of select="@name" />
          <xsl:text>&#x0a;  </xsl:text>
          <xsl:apply-templates select="$refTarget/rng:*" mode="moduleFile" />
          <xsl:text>&gt;&#x0a;&#x0a;</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

  <xsl:template match="*" mode="dtdFile">
    <!-- Most stuff we don't care about -->
  </xsl:template>

  <xsl:template match="rnga:documentation" mode="dtdFile" />

  <xsl:template match="comment()" mode="dtdFile">
    <!-- Suppress comments in dtdFile mode -->
  </xsl:template>
  

</xsl:stylesheet>