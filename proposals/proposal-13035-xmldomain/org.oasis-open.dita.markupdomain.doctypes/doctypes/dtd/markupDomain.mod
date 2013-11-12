<!-- =============================================================

     Markup domain

     Provides a generic, phrase-level element for identifying
     mentions of markup constructs: element types, attributes,
     etc.

     Copyright (c) 2013 OASIS Open

     ============================================================= -->

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % markupname
  "markupname"
>

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Markup Name                     -->
<!ENTITY % markupname.content
"
  (#PCDATA |
   %keyword; |
   %text;)*
">
<!ENTITY % markupname.attributes
"
  %univ-atts;
  keyref
    CDATA
    #IMPLIED
  outputclass
    CDATA
    #IMPLIED
">
<!ELEMENT markupname %markupname.content; >
<!ATTLIST markupname %markupname.attributes; >

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

<!ATTLIST markupname  %global-atts;  class CDATA "+ topic/keyword markup-d/markupname "  >

<!-- ================== DITA Markup Domain ==================== -->