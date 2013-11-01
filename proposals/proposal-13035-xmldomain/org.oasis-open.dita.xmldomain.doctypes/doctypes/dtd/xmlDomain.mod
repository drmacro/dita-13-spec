<!-- =============================================================

     XML construct domain
     
     Provides phrase-level elements for identifying mentions of
     XML constructs: element types, attributes, etc., as well as
     named constructs used in the main XML document grammar and
     constraint languages (DTD, XSD, and RelaxNG).
     
     Copyright (c) 2013 OASIS Open
     
     ============================================================= -->

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % numcharref
  "numcharref"
>   
<!ENTITY % parameterentity          
  "parameterentity"                                          
>
<!ENTITY % rngpattern          
  "rngpattern"                                          
>
<!ENTITY % textentity           
  "textentity"                                           
>     
<!ENTITY % xmlatt      
  "xmlatt"
>
<!ENTITY % xmlelement           
  "xmlelement"                                           
>
<!ENTITY % xmlnsname           
  "xmlnsname"                                           
>
<!ENTITY % xmlpi           
  "xmlpi"                                          
>
<!ENTITY % xsdattgroup           
  "xsdattgroup"                                           
>
<!ENTITY % xsdcomplextype           
  "xsdcomplextype"                                           
>
<!ENTITY % xsdgroup           
  "xsdgroup"                                           
>
<!ENTITY % xsdsimpletype           
  "xsdsimpletype"                                           
>

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: XML Element                            -->
<!ENTITY % xmlelement.content
"
  (#PCDATA |
   %keyword; |
   %text;)*
">
<!ENTITY % xmlelement.attributes
"
  %univ-atts;                                  
  keyref
    CDATA
    #IMPLIED                                 
  outputclass 
    CDATA
    #IMPLIED    
">
<!ELEMENT xmlelement %xmlelement.content; >
<!ATTLIST xmlelement %xmlelement.attributes; >

<!--                    LONG NAME: XML Attribute                            -->
<!ENTITY % xmlatt.content
"
  (#PCDATA |
   %keyword; |
   %text;)*
">
<!ENTITY % xmlatt.attributes
"
  %univ-atts;                                  
  keyref
    CDATA
    #IMPLIED                                 
  outputclass 
    CDATA
    #IMPLIED    
">
<!ELEMENT xmlatt %xmlatt.content; >
<!ATTLIST xmlatt %xmlatt.attributes; >

<!--                    LONG NAME: Text entity -->
<!ENTITY % textentity.content
"
  (#PCDATA |
   %keyword; |
   %text;)*
">
<!ENTITY % textentity.attributes
"
  %univ-atts;                                  
  keyref
    CDATA
    #IMPLIED                                 
  outputclass 
    CDATA
    #IMPLIED    
">
<!ELEMENT textentity %textentity.content; >
<!ATTLIST textentity %textentity.attributes; >

<!--                    LONG NAME: Parameter entity -->
<!ENTITY % parameterentity.content
"
  (#PCDATA |
   %keyword; |
   %text;)*
">
<!ENTITY % parameterentity.attributes
"
  %univ-atts;                                  
  keyref
    CDATA
    #IMPLIED                                 
  outputclass 
    CDATA
    #IMPLIED    
">
<!ELEMENT parameterentity %parameterentity.content; >
<!ATTLIST parameterentity %parameterentity.attributes; >

<!--                    LONG NAME: Numeric character reference -->
<!ENTITY % numcharref.content
"
  (#PCDATA |
   %keyword; |
   %text;)*
">
<!ENTITY % numcharref.attributes
"
  %univ-atts;                                  
  keyref
    CDATA
    #IMPLIED                                 
  outputclass 
    CDATA
    #IMPLIED    
">
<!ELEMENT numcharref %numcharref.content; >
<!ATTLIST numcharref %numcharref.attributes; >

<!--                    LONG NAME: RelaxNG Named Pattern -->
<!ENTITY % rngpattern.content
"
  (#PCDATA |
   %keyword; |
   %text;)*
">
<!ENTITY % rngpattern.attributes
"
  %univ-atts;                                  
  keyref
    CDATA
    #IMPLIED                                 
  outputclass 
    CDATA
    #IMPLIED    
">
<!ELEMENT rngpattern %rngpattern.content; >
<!ATTLIST rngpattern %rngpattern.attributes; >

<!--                    LONG NAME: XML Namespace name ("Namespace URI") -->
<!ENTITY % xmlnsname.content
"
  (#PCDATA |
   %keyword; |
   %text;)*
">
<!ENTITY % xmlnsname.attributes
"
  %univ-atts;                                  
  keyref
    CDATA
    #IMPLIED                                 
  outputclass 
    CDATA
    #IMPLIED    
">
<!ELEMENT xmlnsname %xmlnsname.content; >
<!ATTLIST xmlnsname %xmlnsname.attributes; >

<!--                    LONG NAME: XML processing instruction (PI) -->
<!ENTITY % xmlpi.content
"
  (#PCDATA |
   %keyword; |
   %text;)*
">
<!ENTITY % xmlpi.attributes
"
  %univ-atts;                                  
  keyref
    CDATA
    #IMPLIED                                 
  outputclass 
    CDATA
    #IMPLIED    
">
<!ELEMENT xmlpi %xmlpi.content; >
<!ATTLIST xmlpi %xmlpi.attributes; >

<!--                    LONG NAME: XSD Attribute Group -->
<!ENTITY % xsdattgroup.content
"
  (#PCDATA |
   %keyword; |
   %text;)*
">
<!ENTITY % xsdattgroup.attributes
"
  %univ-atts;                                  
  keyref
    CDATA
    #IMPLIED                                 
  outputclass 
    CDATA
    #IMPLIED    
">
<!ELEMENT xsdattgroup %xsdattgroup.content; >
<!ATTLIST xsdattgroup %xsdattgroup.attributes; >


<!--                    LONG NAME: XSD Complex Type-->
<!ENTITY % xsdcomplextype.content
"
  (#PCDATA |
   %keyword; |
   %text;)*
">
<!ENTITY % xsdcomplextype.attributes
"
  %univ-atts;                                  
  keyref
    CDATA
    #IMPLIED                                 
  outputclass 
    CDATA
    #IMPLIED    
">
<!ELEMENT xsdcomplextype %xsdcomplextype.content; >
<!ATTLIST xsdcomplextype %xsdcomplextype.attributes; >

<!--                    LONG NAME: XSD Group -->
<!ENTITY % xsdgroup.content
"
  (#PCDATA |
   %keyword; |
   %text;)*
">
<!ENTITY % xsdgroup.attributes
"
  %univ-atts;                                  
  keyref
    CDATA
    #IMPLIED                                 
  outputclass 
    CDATA
    #IMPLIED    
">
<!ELEMENT xsdgroup %xsdgroup.content; >
<!ATTLIST xsdgroup %xsdgroup.attributes; >

<!--                    LONG NAME: XSD Simple Type-->
<!ENTITY % xsdsimpletype.content
"
  (#PCDATA |
   %keyword; |
   %text;)*
">
<!ENTITY % xsdsimpletype.attributes
"
  %univ-atts;                                  
  keyref
    CDATA
    #IMPLIED                                 
  outputclass 
    CDATA
    #IMPLIED    
">
<!ELEMENT xsdsimpletype %xsdsimpletype.content; >
<!ATTLIST xsdsimpletype %xsdsimpletype.attributes; >


<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->


  <!ATTLIST numcharref  %global-atts;  class CDATA "+ topic/keyword xml-d/numcharref "  >
  <!ATTLIST parameterentity %global-atts;  class CDATA "+ topic/keyword xml-d/parameterentity "  >
  <!ATTLIST rngpattern  %global-atts;  class CDATA "+ topic/keyword xml-d/rngpattern "  >
  <!ATTLIST textentity  %global-atts;  class CDATA "+ topic/keyword xml-d/textentity "  >
  <!ATTLIST xmlnsname   %global-atts;  class CDATA "+ topic/keyword xml-d/xmlnsname "  >
  <!ATTLIST xmlpi       %global-atts;  class CDATA "+ topic/keyword xml-d/xmlpi "  >
  <!ATTLIST xmlatt      %global-atts;  class CDATA "+ topic/keyword xml-d/xmlatt "  >
  <!ATTLIST xmlelement  %global-atts;  class CDATA "+ topic/keyword xml-d/xmlelement "  >
  <!ATTLIST xsdattgroup %global-atts;  class CDATA "+ topic/keyword xml-d/xsdattgroup "  >
  <!ATTLIST xsdcomplextype %global-atts;  class CDATA "+ topic/keyword xml-d/xsdcomplextype "  >
  <!ATTLIST xsdgroup    %global-atts;  class CDATA "+ topic/keyword xml-d/xsdgroup "  >
  <!ATTLIST xsdsimpletype %global-atts;  class CDATA "+ topic/keyword xml-d/xsdsimpletype "  >


<!-- ================== DITA Highlight Domain ==================== -->