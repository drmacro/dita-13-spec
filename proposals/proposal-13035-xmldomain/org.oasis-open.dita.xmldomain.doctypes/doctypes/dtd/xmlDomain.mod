<!-- =============================================================

     XML construct domain

     Provides phrase-level elements for identifying mentions of
     XML constructs: element types, attributes, etc.

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

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: XML Element                            -->
<!ENTITY % xmlelement.content
"
  (#PCDATA |
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

<!--                    LONG NAME: XML Namespace name ("Namespace URI") -->
<!ENTITY % xmlnsname.content
"
  (#PCDATA |
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


<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->


  <!ATTLIST numcharref  %global-atts;  class CDATA "+ topic/keyword markup-d/markupname xml-d/numcharref "  >
  <!ATTLIST parameterentity %global-atts;  class CDATA "+ topic/keyword markup-d/markupname xml-d/parameterentity "  >
  <!ATTLIST textentity  %global-atts;  class CDATA "+ topic/keyword markup-d/markupname xml-d/textentity "  >
  <!ATTLIST xmlnsname   %global-atts;  class CDATA "+ topic/keyword markup-d/markupname xml-d/xmlnsname "  >
  <!ATTLIST xmlpi       %global-atts;  class CDATA "+ topic/keyword markup-d/markupname xml-d/xmlpi "  >
  <!ATTLIST xmlatt      %global-atts;  class CDATA "+ topic/keyword markup-d/markupname xml-d/xmlatt "  >
  <!ATTLIST xmlelement  %global-atts;  class CDATA "+ topic/keyword markup-d/markupname xml-d/xmlelement "  >

<!-- ================== DITA XML Mention Domain ==================== -->