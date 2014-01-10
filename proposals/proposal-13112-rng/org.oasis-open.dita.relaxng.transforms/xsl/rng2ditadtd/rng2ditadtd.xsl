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

  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p>RNG to DITA DTD Converter</xd:p>
      <xd:p><xd:b>Created on:</xd:b> Feb 16, 2013</xd:p>
      <xd:p><xd:b>Authors:</xd:b> ekimber, pleblanc</xd:p>
      <xd:p>This transform takes as input RNG-format DITA document type
        shells and produces from them DTD-syntax vocabulary modules
        that reflect the RNG definitions and conform to the DITA 1.3
        DTD coding requirements.
      </xd:p>
      <xd:p>The direct output is a conversion manifest, which simply
        lists the files generated. Each module and document type shell
        is generated separately using xsl:result-document.
      </xd:p>
    </xd:desc>
  </xd:doc>

  <xsl:include href="../lib/relpath_util.xsl" />
  <xsl:include href="rng2functions.xsl"/>
  <xsl:include href="rng2gatherModules.xsl"/>
  <xsl:include href="rng2preprocess.xsl"/>
  <xsl:include href="rng2ditashelldtd.xsl"/>
  <xsl:include href="rng2ditaent.xsl" />
  <xsl:include href="rng2ditamod.xsl" />
 
  <!-- Output directory to put the generated DTD shell files in. 
      
       If not specified, output is relative to the input shell.
  -->
  <xsl:param name="outdir" as="xs:string" select="''"/>
  <!-- Output directory to put the generated DTD module files in.
       If not specified is the same as the output directory.
       This allows you to have shell DTDs go to one location and
       modules to another.
    -->
  <xsl:param name="moduleOutdir" as="xs:string" select="''"/>
  
  <!-- Set this parameter to "comment-per-line" to get the OASIS module
       style of header comment.
    -->
  <xsl:param name="headerCommentStyle" select="'as-is'" as="xs:string"/>
  <!-- NOTE: The primary output of this transform is an XML 
       manifest file that lists all input files and their
       corresponding outputs.
    -->
  <xsl:output 
    method="xml"
    indent="yes"
  />

  <!-- Output method used to generate the DTD-syntax result files. -->
  <xsl:output name="dtd"
    method="text"
  />

  <xsl:param name="debug" as="xs:string" select="'false'"/>
  
  <xsl:variable name="doDebug" as="xs:boolean" select="$debug = 'true'" />

  <xsl:strip-space elements="*"/>
  
  <xsl:key name="definesByName" match="rng:define" use="@name" />
  <xsl:key name="attlistIndex" match="rng:element" use="rng:ref[ends-with(@name, '.attlist')]/@name" />

  <xsl:template match="/">
    <!-- Construct a sequence of all the input modules so we can
         then process them serially, rather than in tree order.
         We have to do this because in XSLT you can't start a new
         result document while you're in the process of creating
         another result document.
      -->
    <xsl:variable name="dtdOutputDir" as="xs:string"
      select="if ($outdir = '') 
                 then string(base-uri(.)) 
                 else relpath:getAbsolutePath($outdir)"
    />
    <xsl:variable name="moduleOutputDir" as="xs:string"
      select="if ($moduleOutdir = '') 
                 then string(base-uri(.)) 
                 else relpath:getAbsolutePath($moduleOutdir)"
    />
    
    <xsl:message> + [INFO] Shell Output directory is  "<xsl:sequence select="$dtdOutputDir"/>"</xsl:message>
    <xsl:message> + [INFO] Module Output directory is "<xsl:sequence select="$moduleOutputDir"/>"</xsl:message>

    <!-- STEP 1: Figure out the RNG modules to be processed: -->
    <xsl:variable name="modulesToProcess" as="document-node()*">
      <xsl:apply-templates mode="gatherModules" >
        <xsl:with-param name="origModule" select="root(.)"/>
      </xsl:apply-templates>
    </xsl:variable>
    
    <xsl:message> + [DEBUG] Initial process: Found <xsl:sequence select="count($modulesToProcess)" /> modules.</xsl:message>

    <!-- STEP 2: Generate the manifest and process the modules: -->
    <rng2ditadtd:conversionManifest xmlns="http://dita.org/rng2ditadtd">
      <inputDoc><xsl:sequence select="base-uri(root(.))"></xsl:sequence></inputDoc>
    <xsl:choose>
      <xsl:when test="count(rng:grammar/*)=1 and rng:grammar/rng:include">
        <!--  simple redirection, as in technicalContent/glossary.dtd -->
          <redirectedTo>
            <xsl:value-of select="concat(substring-before(rng:grammar/rng:include/@href,'.rng'),'.dtd')" />
          </redirectedTo>
      </xsl:when>
      <xsl:otherwise>
          <generatedModules>
            <xsl:apply-templates select="$modulesToProcess" mode="generate-modules">
              <xsl:with-param name="dtdOutputDir"
                select="$dtdOutputDir"
                tunnel="yes"
                as="xs:string"
              />
              <xsl:with-param name="moduleOutputDir"
                select="$moduleOutputDir"
                tunnel="yes"
                as="xs:string"
              />
            </xsl:apply-templates>
          </generatedModules>
      </xsl:otherwise>
    </xsl:choose>

    <!-- Generate the .dtd file: -->
    <xsl:variable name="rngDtdUrl" as="xs:string"
      select="string(base-uri(root(.)))" />
    <xsl:variable name="dtdFilename" as="xs:string"
      select="concat(relpath:getNamePart($rngDtdUrl), '.dtd')" />
    <xsl:variable name="dtdResultUrl"
      select="relpath:newFile($dtdOutputDir, $dtdFilename)" />
      
    <dtdFile><xsl:sequence select="$dtdResultUrl" /></dtdFile>
    <xsl:result-document href="{$dtdResultUrl}" format="dtd">
      <xsl:apply-templates mode="dtdFile">
        <xsl:with-param name="dtdFilename" select="$dtdFilename" tunnel="yes" as="xs:string" />
        <xsl:with-param name="dtdDir" select="$dtdOutputDir" tunnel="yes" as="xs:string" />
        <xsl:with-param name="moduleOutputDir" select="$moduleOutputDir" tunnel="yes" as="xs:string" />
        <xsl:with-param name="modulesToProcess"  select="$modulesToProcess" tunnel="yes" as="document-node()*" />
      </xsl:apply-templates>
    </xsl:result-document>
    </rng2ditadtd:conversionManifest>

  </xsl:template>

  <xsl:template match="/" mode="generate-modules">
    <xsl:param 
      name="dtdOutputDir"
      tunnel="yes" 
      as="xs:string"
    />
    <xsl:param 
      name="moduleOutputDir"
      tunnel="yes" 
      as="xs:string"
    />
    
    <xsl:variable name="rngModuleUrl" as="xs:string"
      select="string(base-uri(.))"
    />
    <xsl:if test="false() and $doDebug">
      <xsl:message> + [DEBUG] generate-modules: rngModuleUrl="<xsl:sequence
        select="$rngModuleUrl"/>"</xsl:message>
    </xsl:if>
    <!-- Use the RNG module's grandparent directory name to construct output
         dir so the DTD module organization mirrors the RNG organization.
         This should always do the right thing for the OASIS-provided 
         modules.
         
         The general file organization pattern for OASIS-provided vocabulary files 
         is:
         
         doctypes/{groupname}/{typename}/{module file}
         
         e.g.:
         
         doctypes/base/rng/topicMod.rng
         doctypes/base/dtd/topic.mod
         
      -->
    <xsl:variable name="rngParentDirName" as="xs:string"
      select="relpath:getNamePart(relpath:getParent(relpath:getParent($rngModuleUrl)))"
    />

    <!-- Put the DTD files in a directory named "dtd/" -->
    <xsl:variable name="resultDir"
      select="relpath:newFile(relpath:newFile($moduleOutputDir, $rngParentDirName), 'dtd')"
    />
    <xsl:if test="false() and $doDebug">
      <xsl:message> + [DEBUG] generate-modules: resultDir="<xsl:sequence select="$resultDir"/>"</xsl:message>
    </xsl:if>

    <xsl:variable name="rngModuleName" as="xs:string"
      select="relpath:getNamePart($rngModuleUrl)" />
    <xsl:variable name="moduleBaseName" as="xs:string"
      select="if (ends-with($rngModuleName, 'Mod')) 
      then substring-before($rngModuleName, 'Mod') 
      else $rngModuleName"
    />
    <xsl:variable name="entFilename" as="xs:string"
      select="rngfunc:getEntityFilename(./*, 'ent')"
    />
    <xsl:variable name="modFilename" as="xs:string"
      select="rngfunc:getEntityFilename(./*, 'mod')"
    />
    <xsl:variable name="moduleType" as="xs:string"
      select="rngfunc:getModuleType(./*)"
    />
    <xsl:variable name="moduleShortName" as="xs:string"
      select="rngfunc:getModuleShortName(./*)"
    />
    <xsl:variable name="entResultUrl"
      select="relpath:newFile($resultDir, $entFilename)" />
    <xsl:variable name="modResultUrl"
      select="relpath:newFile($resultDir, $modFilename)" />

    <!-- Now generate the .mod and .ent files: -->

    <moduleFiles xmlns="http://dita.org/rng2ditadtd">
      <inputFile><xsl:sequence select="$rngModuleUrl" /></inputFile>
      <entityFile><xsl:sequence select="$entResultUrl" /></entityFile>
      <modFile><xsl:sequence select="$modResultUrl" /></modFile>
    </moduleFiles>
    <!-- Generate the .ent file: -->
    <!-- NOTE: Not all base modules have .ent files -->
    <xsl:if test="
      $moduleShortName != 'tblDecl' and 
      $moduleShortName != 'metaDecl' and 
      $moduleShortName != 'map'"
      >    
      <xsl:result-document href="{$entResultUrl}" format="dtd">
          <xsl:apply-templates mode="entityFile">
            <xsl:with-param name="thisFile" select="$entResultUrl" tunnel="yes" as="xs:string" />
          </xsl:apply-templates>
        </xsl:result-document>
    </xsl:if>
    <!-- Generate the .mod file: NOTE: Attribute modules only have .ent files -->
    <xsl:if test="$moduleType != 'attributedomain'">
      <xsl:result-document href="{$modResultUrl}" format="dtd">
        <xsl:apply-templates mode="moduleFile" >
          <xsl:with-param name="thisFile" select="$modResultUrl" tunnel="yes" as="xs:string" />
        </xsl:apply-templates>
      </xsl:result-document>
    </xsl:if>
    
  </xsl:template>

  <!-- ==============================
       Other modes and functions
       ============================== -->

  <xsl:template match="text()" mode="#all" priority="-1" />

  <xsl:template match="rng:*" priority="-1" mode="entityFile">
    <xsl:message> - [WARN] entityFile: Unhandled RNG element <xsl:sequence select="concat(name(..), '/', name(.))" /></xsl:message>
  </xsl:template>

  <xsl:template match="rng:*" priority="-1" mode="element-decls">
    <xsl:message> - [WARN] element-decls: Unhandled RNG element <xsl:sequence select="concat(name(..), '/', name(.))" /><xsl:copy-of select="." /></xsl:message>
  </xsl:template>
  <xsl:template match="rng:*" priority="-1" mode="element-name-entities">
    <xsl:message> - [WARN] element-name-entities: Unhandled RNG element <xsl:sequence select="concat(name(..), '/', name(.))" /><xsl:copy-of select="." /></xsl:message>
  </xsl:template>
  <xsl:template match="rng:*" priority="-1" mode="class-att-decls">
    <xsl:message> - [WARN] class-att-decls: Unhandled RNG element <xsl:sequence select="concat(name(..), '/', name(.))" /><xsl:copy-of select="." /></xsl:message>
  </xsl:template>
  
  <xsl:template match="rng:div" mode="#all">
    <!-- RNG div elements are "transparent" and have no special meaning
         for DTD output (except possibly in a few special cases) 
         
         Note that this is really here for safety since we filter out
         all the divs before doing any output processing once we have
         gathered the modules to be processed.
      -->
    <xsl:apply-templates mode="#current"/>
  </xsl:template>

</xsl:stylesheet>