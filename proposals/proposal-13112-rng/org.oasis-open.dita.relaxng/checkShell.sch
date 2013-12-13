<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns uri="http://relaxng.org/ns/structure/1.0" prefix="rng"/>
    <ns uri="http://relaxng.org/ns/compatibility/annotations/1.0" prefix="a"/>
    <ns uri="http://dita.oasis-open.org/architecture/2005/" prefix="ditaarch"/>
  
    <let name="domains" value="/rng:grammar/rng:define[@name='domains-atts']/rng:optional/rng:attribute[@name='domains']/@a:defaultValue"/>
    <let name="moduleType"
      value="/rng:grammar/ditaarch:moduleDesc/ditaarch:moduleMetadata/ditaarch:moduleType"
    />
    <let name="isShell"
      value="ends-with($moduleType, 'shell')"
    />
    <let name="isDomain"
      value="ends-with($moduleType, 'domain')"
    />
    <let name="isBase"
      value="ends-with($moduleType, 'base')"
    />
    <let name="isModule"
      value="$moduleType = 'topic' or $moduleType = 'map'"
    />
    <!-- Checks for document type shells: -->
    <pattern id="checkDomainsDefault">
        <rule context="/rng:grammar[ends-with(/rng:grammar/ditaarch:moduleDesc/ditaarch:moduleMetadata/ditaarch:moduleType, 'shell')]">
            <assert test="rng:define[@name='domains-att']">
                The domains-att pattern should de defined.
            </assert>            
        </rule>
        <rule context="rng:define[ends-with(/rng:grammar/ditaarch:moduleDesc/ditaarch:moduleMetadata/ditaarch:moduleType, 'shell')][@name='domains-att']">
            <assert test="/rng:grammar/rng:define[@name='domains-atts']/rng:optional/rng:attribute[@name='domains']/@a:defaultValue = ''">
                The domains-att pattern should define an optional @domains attribute with a default value.
            </assert>            
        </rule>
    </pattern>
   
    <pattern id="checkIncludedDomains">
        <rule context="rng:include">
            <assert test="document(@href)/rng:grammar[
              ends-with(ditaarch:moduleDesc/ditaarch:moduleMetadata/ditaarch:moduleType, 'domain') or
              ditaarch:moduleDesc/ditaarch:moduleMetadata/ditaarch:moduleType = 'topic' or
              ditaarch:moduleDesc/ditaarch:moduleMetadata/ditaarch:moduleType = 'map'
              ]/rng:define[@name='domains-att-value']">
                The domain module should define a domains attribute contribution through a domains-att-value pattern.
            </assert>
            
            <assert test="min(document(@href)/rng:grammar[ends-with(ditaarch:moduleDesc/ditaarch:moduleMetadata/ditaarch:moduleType, 'domain')]/rng:define[@name='domains-att-value']/rng:value/contains($domains, .))">
                The domain values defined in an included domain file should be present in the domains attribute default value.
            </assert>            
        </rule>        
    </pattern>
    <pattern id="checkLongName">
        <rule context="rng:element[not($isShell)]">
            <assert test="@ditaarch:longName != ''">
                The element element should specify the element type long name using @ditaarch:longName.
            </assert>            
        </rule>        
    </pattern>
</schema>