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
  exclude-result-prefixes="xs xd rng rnga relpath a str dita rngfunc local rng2ditadtd"
  version="2.0">

  <!-- DITA RNG to XSD document type shell schema 
  
       Copyright (c) ???        
  -->
  
  
  <xsl:template match="rng:grammar" mode="xsdFile">
    <xsl:param name="xsdFilename" tunnel="yes" as="xs:string" />
    <xsl:param name="xsdDir" tunnel="yes" as="xs:string" />
    <xsl:param name="modulesToProcess" tunnel="yes" as="document-node()*" />
    
    <xsl:variable name="rootElement" 
      select="substring-before(/*/rng:start/rng:ref/@name,'.element')" 
      as="xs:string" />
    
    <xsl:message> + [INFO] === Generating DTD shell <xsl:value-of select="$xsdFilename" />...</xsl:message>
    
    <xsl:variable name="shellType" select="rngfunc:getModuleType(.)" as="xs:string"/>
    
    <xsl:if test="$shellType != 'topicshell' and $shellType != 'mapshell'">
      <xsl:message terminate="yes"> - [ERROR] mode xsdFile: Expected module type 'topicshell' or 'mapshell', got "<xsl:sequence select="$shellType"/>".</xsl:message>
    </xsl:if>
    
    <!-- Generate the header comment -->
    <xsl:apply-templates select="dita:moduleDesc" mode="header-comment"/>
    
    <xs:schema 
      xmlns:xs="http://www.w3.org/2001/XMLSchema" 
      elementFormDefault="qualified" 
      attributeFormDefault="unqualified" 
      xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/">
      
      <xsl:if test="rngfunc:getModuleType(.) = 'topicshell'">      
        <xsl:text>&#x0a;</xsl:text>
        <xsl:comment> ================ TOPIC DOMAINS ===================== </xsl:comment>
        <xsl:text>&#x0a;</xsl:text>
      </xsl:if>      
      <xsl:apply-templates 
        mode="generateIncludes"
        select="$modulesToProcess[rngfunc:isAttributeDomain(.) or rngfunc:isElementDomain(.)]"
        >
        <xsl:with-param name="fileType" select="'mod'" as="xs:string" tunnel="yes"/>
      </xsl:apply-templates>
      
      <xsl:text>&#x0a;</xsl:text>
      <xsl:comment> ================ GROUP DEFINITIONS ===================== </xsl:comment>
      <xsl:text>&#x0a;</xsl:text>
      
      <!-- The tbl and metaDecl group modules are included before the the topic ones. --> 
      <xsl:apply-templates 
        mode="generateIncludes"
        select="$modulesToProcess[rngfunc:getModuleShortName(./*) = 'metaDecl']" 
        >
        <xsl:with-param name="fileType" select="'grp'" as="xs:string" tunnel="yes"/>
      </xsl:apply-templates>
      <xsl:apply-templates 
        mode="generateIncludes"
        select="$modulesToProcess[rngfunc:getModuleShortName(./*) = 'tblDecl']" 
        >
        <xsl:with-param name="fileType" select="'grp'" as="xs:string" tunnel="yes"/>
      </xsl:apply-templates>
      <xsl:apply-templates 
        mode="generateIncludes"
        select="$modulesToProcess[rngfunc:getModuleType(./*) = ('topic', 'map')]" 
        >
        <xsl:with-param name="fileType" select="'grp'" as="xs:string" tunnel="yes"/>
      </xsl:apply-templates>
      
      <xsl:text>&#x0a;</xsl:text>
      <xsl:comment> =================  MODULE INCLUDE DEFINITION  ================== </xsl:comment>
      <xsl:text>&#x0a;</xsl:text>

      <xsl:apply-templates 
        mode="generateIncludes"
        select="$modulesToProcess[rngfunc:getModuleShortName(./*) = 'commonElements']" 
        >
        <xsl:with-param name="fileType" select="'mod'" as="xs:string" tunnel="yes"/>
      </xsl:apply-templates>

      <xsl:text>&#x0a;</xsl:text>
      <xsl:comment> ======== Table elements ======== </xsl:comment>
      <xsl:text>&#x0a;</xsl:text>

      <xsl:apply-templates select="$modulesToProcess[rngfunc:getModuleShortName(./*) = 'tblDecl']" mode="generateIncludes">
        <xsl:with-param name="fileType" select="'mod'" as="xs:string" tunnel="yes"/>
      </xsl:apply-templates>
      
      <xsl:text>&#x0a;</xsl:text>
      <xsl:comment> ======= MetaData elements, plus keyword and indexterm ======= </xsl:comment>
      <xsl:text>&#x0a;</xsl:text>

      <xsl:apply-templates select="$modulesToProcess[rngfunc:getModuleShortName(./*) = 'metaDecl']" mode="generateIncludes">
        <xsl:with-param name="fileType" select="'mod'" as="xs:string" tunnel="yes"/>
      </xsl:apply-templates>
  
  
  <!-- FIXME: This hard-coded reference will work for all OASIS shells but not for non-OASIS shells -->
  <xsl:text>&#x0a;</xsl:text>
  <xs:redefine>
    <xsl:choose>
      <xsl:when test="$useURNsInShellBoolean">
        <xsl:attribute name="schemaLocation"
          select="concat('urn:oasis:names:tc:dita:xsd:mapGrp.xsd:', $ditaVersion)"
        />
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="schemaLocation"
          select="'../../base/xsd/commonElementGrp.xsd'"
        />

      </xsl:otherwise>
    </xsl:choose>
    <xsl:call-template name="generateRedefines">
      <xsl:with-param name="modulesToProcess" select="$modulesToProcess" as="document-node()*"/>
    </xsl:call-template>
  </xs:redefine>
  <xsl:text>&#x0a;</xsl:text>
  <xsl:text>&#x0a;</xsl:text>
  
   <xsl:choose>
    <xsl:when test="$shellType = 'topicshell'">
      
      <xsl:apply-templates 
        select="$modulesToProcess[rngfunc:getModuleType(./*) = 'topic']"
        mode="generateIncludes">
        <xsl:with-param name="fileType" select="'mod'" as="xs:string" tunnel="yes"/>
      </xsl:apply-templates>
      <xsl:text>&#x0a;</xsl:text>

      <xs:group name="info-types">
        <xs:sequence/>    
      </xs:group>
      <xsl:text>&#x0a;</xsl:text>
    </xsl:when>
    <xsl:when test="$shellType = 'mapshell'">
      <xsl:apply-templates 
        select="$modulesToProcess[rngfunc:getModuleType(./*) = 'map']"
        mode="generateIncludes">
        <xsl:with-param name="fileType" select="'mod'" as="xs:string" tunnel="yes"/>
      </xsl:apply-templates>
      <xsl:text>&#x0a;</xsl:text>
    </xsl:when>
     <xsl:otherwise>
        <!-- Already reported this problem -->
     </xsl:otherwise>
   </xsl:choose>
      
  <!-- Maps and topics both declare the @domains attribute: -->
      <xsl:text>&#x0a;</xsl:text>
      <xs:attributeGroup name="domains-att">
        <!-- FIXME: Generate the @domains value -->
        <xs:attribute name="domains" type="xs:string" 
                                default="{normalize-space(rngfunc:getDomainsAttValue(.))}"/>
      </xs:attributeGroup>
    
    </xs:schema>
  </xsl:template>  
  
  <xsl:template name="generateRedefines">
    <xsl:param name="modulesToProcess" as="document-node()*"/>
    
  <!-- Get the set of element domain modules then get the set of 
       domain extension patterns from all of them then process
       that set to generate one redefine group for each unique
       element type being extended.
    -->
        <xsl:message> + [INFO] Generating domain extension redefines... </xsl:message>
        <xsl:variable name="domainModules" as="element()*"
          select="$modulesToProcess[rngfunc:isElementDomain(.)]/*" 
        />
        <xsl:message> + [INFO] Domain modules to integrate: <xsl:sequence select="for $mod in $domainModules return rngfunc:getModuleShortName($mod)"/></xsl:message>
    
        <xsl:variable name="domainExtensionPatterns" as="element()*"
          select="$domainModules//rng:define[starts-with(@name, rngfunc:getModuleShortName(root(.)/*))]"
        />
        
        <xsl:for-each-group select="$domainExtensionPatterns" 
          group-by="substring-after(@name, concat(rngfunc:getModuleShortName(root(.)/*), '-'))">
<!--
     <xs:group name="ph">
      <xs:choice>
        <xs:group ref="ph"/>
        <xs:group ref="hi-d-ph" />
      </xs:choice>
    </xs:group>
            
-->
          
            <xsl:variable name="groupName" as="xs:string"
              select="current-grouping-key()"
            />
            <xs:group name="{$groupName}">
              <xs:choice>
                <xs:group ref="{$groupName}"/>
                <xsl:for-each select="current-group()">
                  <xs:group ref="{@name}"/>
                </xsl:for-each>
              </xs:choice>
            </xs:group>
        </xsl:for-each-group>

  </xsl:template>
  
  <xsl:template match="rng:grammar" mode="generateIncludes">
    <xsl:param 
      name="fileType" 
      as="xs:string" 
      tunnel="yes"
    /><!-- One of "mod" or "grp"  
      
    -->
    <xsl:param name="xsdDir" tunnel="yes" as="xs:string" />
    <xsl:param name="rngShellUrl" tunnel="yes" as="xs:string"/>
    
    <xsl:variable name="rngShellParent" as="xs:string"
      select="relpath:getParent($rngShellUrl)"
    />
    
    <xsl:variable name="rngModuleUrl" as="xs:string"
      select="rngfunc:getGrammarUri(.)"
    />
    <xsl:variable name="rngModuleName" as="xs:string"
      select="relpath:getNamePart($rngModuleUrl)" />
    <xsl:variable name="moduleBaseName" as="xs:string"
      select="local:getModuleBaseFilename($rngModuleName)"
    />
    <xsl:variable name="targetFilename" as="xs:string"
      select="
      if ($fileType = 'grp') 
        then concat($moduleBaseName, 'Grp.xsd') 
        else concat($moduleBaseName, 'Mod.xsd')"
    />
    <xsl:variable name="moduleUrl" as="xs:string"
      select="rngfunc:getGrammarUri(.)"
    />
    <xsl:variable name="relpathFromShell" as="xs:string"
      select="relpath:getParent(relpath:getRelativePath($rngShellParent, $moduleUrl))"
      />
    <xsl:variable name="pubidTagname" as="xs:string"
      select="concat('xsd', if ($fileType = 'gro') then 'Grp' else 'Mod')"
    />
    <xsl:variable name="publicId" 
      select="rngfunc:getPublicId(., $pubidTagname)" 
    />
    <!-- FIXME: The replace is a short-term hack to avoid figuring out how to
                generalize the code for getting the result URI for a module
                so we can construct the relative output path properly.
                This hack will work for OASIS files but not necessarily 
                any other organization pattern.
      -->
    <xsl:variable name="moduleSystemID" as="xs:string"
      select="replace(relpath:newFile($relpathFromShell, $targetFilename), '/rng/', '/xsd/')"
    />
    <xs:include>
      <xsl:attribute name="schemaLocation">
        <xsl:choose>
          <xsl:when test="$useURNsInShellBoolean">
            <xsl:value-of select="$publicId"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$moduleSystemID"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
    </xs:include>
    <xsl:text>&#x0a;</xsl:text>
  </xsl:template>

</xsl:stylesheet>