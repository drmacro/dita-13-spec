<?xml version="1.0" encoding="UTF-8"?>

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % numcharref  "numcharref"                                  >
<!ENTITY % parameterentity "parameterentity"                             >
<!ENTITY % rngpattern  "rngpattern"                                  >
<!ENTITY % textentity  "textentity"                                  >
<!ENTITY % xmlatt      "xmlatt"                                      >
<!ENTITY % xmlelement  "xmlelement"                                  >
<!ENTITY % xmlnsname   "xmlnsname"                                   >
<!ENTITY % xsdattgroup "xsdattgroup"                                 >
<!ENTITY % xsdcomplextype "xsdcomplextype"                              >
<!ENTITY % xsdgroup    "xsdgroup"                                    >
<!ENTITY % xsdsimpletype "xsdsimpletype"                               >

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->
  
<!ENTITY % xml-d-keyword
              "numcharref |
               parameterentity |
               rngpattern |
               textentity |
               xmlatt |
               xmlelement |
               xmlnsname |
               xsdattgroup |
               xsdcomplextype |
               xsdgroup |
               xsdsimpletype" 
>
<!--                    LONG NAME: Numcharref                      -->
<!ENTITY % numcharref.content
              "(#PCDATA |
                %text; |
                %tm;)*" 
>
<!ENTITY % numcharref.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  numcharref %numcharref.content;>
<!ATTLIST  numcharref %numcharref.attributes;>


<!--                    LONG NAME: Parameterentity                 -->
<!ENTITY % parameterentity.content
              "(#PCDATA |
                %text; |
                %tm;)*" 
>
<!ENTITY % parameterentity.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  parameterentity %parameterentity.content;>
<!ATTLIST  parameterentity %parameterentity.attributes;>


<!--                    LONG NAME: Rngpattern                      -->
<!ENTITY % rngpattern.content
              "(#PCDATA |
                %text; |
                %tm;)*" 
>
<!ENTITY % rngpattern.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  rngpattern %rngpattern.content;>
<!ATTLIST  rngpattern %rngpattern.attributes;>


<!--                    LONG NAME: Textentity                      -->
<!ENTITY % textentity.content
              "(#PCDATA |
                %text; |
                %tm;)*" 
>
<!ENTITY % textentity.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  textentity %textentity.content;>
<!ATTLIST  textentity %textentity.attributes;>


<!--                    LONG NAME: Xmlatt                          -->
<!ENTITY % xmlatt.content
              "(#PCDATA |
                %text; |
                %tm;)*" 
>
<!ENTITY % xmlatt.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  xmlatt %xmlatt.content;>
<!ATTLIST  xmlatt %xmlatt.attributes;>


<!--                    LONG NAME: Xmlelement                      -->
<!ENTITY % xmlelement.content
              "(#PCDATA |
                %text; |
                %tm;)*" 
>
<!ENTITY % xmlelement.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  xmlelement %xmlelement.content;>
<!ATTLIST  xmlelement %xmlelement.attributes;>


<!--                    LONG NAME: Xmlnsname                       -->
<!ENTITY % xmlnsname.content
              "(#PCDATA |
                %text; |
                %tm;)*" 
>
<!ENTITY % xmlnsname.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  xmlnsname %xmlnsname.content;>
<!ATTLIST  xmlnsname %xmlnsname.attributes;>


<!--                    LONG NAME: Xsdattgroup                     -->
<!ENTITY % xsdattgroup.content
              "(#PCDATA |
                %text; |
                %tm;)*" 
>
<!ENTITY % xsdattgroup.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  xsdattgroup %xsdattgroup.content;>
<!ATTLIST  xsdattgroup %xsdattgroup.attributes;>


<!--                    LONG NAME: Xsdcomplextype                  -->
<!ENTITY % xsdcomplextype.content
              "(#PCDATA |
                %text; |
                %tm;)*" 
>
<!ENTITY % xsdcomplextype.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  xsdcomplextype %xsdcomplextype.content;>
<!ATTLIST  xsdcomplextype %xsdcomplextype.attributes;>


<!--                    LONG NAME: Xsdgroup                        -->
<!ENTITY % xsdgroup.content
              "(#PCDATA |
                %text; |
                %tm;)*" 
>
<!ENTITY % xsdgroup.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  xsdgroup %xsdgroup.content;>
<!ATTLIST  xsdgroup %xsdgroup.attributes;>


<!--                    LONG NAME: Xsdsimpletype                   -->
<!ENTITY % xsdsimpletype.content
              "(#PCDATA |
                %text; |
                %tm;)*" 
>
<!ENTITY % xsdsimpletype.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  xsdsimpletype %xsdsimpletype.content;>
<!ATTLIST  xsdsimpletype %xsdsimpletype.attributes;>



<!-- ============================================================= -->
<!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
<!-- ============================================================= -->
  
<!ATTLIST  numcharref   %global-atts;  class CDATA "+ topic/ph xml-d/numcharref ">
<!ATTLIST  parameterentity %global-atts;  class CDATA "+ topic/ph xml-d/parameterentity ">
<!ATTLIST  rngpattern   %global-atts;  class CDATA "+ topic/ph xml-d/rngpattern ">
<!ATTLIST  textentity   %global-atts;  class CDATA "+ topic/ph xml-d/textentity ">
<!ATTLIST  xmlatt       %global-atts;  class CDATA "+ topic/ph xml-d/xmlatt ">
<!ATTLIST  xmlelement   %global-atts;  class CDATA "+ topic/ph xml-d/xmlelement ">
<!ATTLIST  xmlnsname    %global-atts;  class CDATA "+ topic/ph xml-d/xmlnsname ">
<!ATTLIST  xsdattgroup  %global-atts;  class CDATA "+ topic/ph xml-d/xsdattgroup ">
<!ATTLIST  xsdcomplextype %global-atts;  class CDATA "+ topic/ph xml-d/xsdcomplextype ">
<!ATTLIST  xsdgroup     %global-atts;  class CDATA "+ topic/ph xml-d/xsdgroup ">
<!ATTLIST  xsdsimpletype %global-atts;  class CDATA "+ topic/ph xml-d/xsdsimpletype ">

<!-- ================== xmlDomainMod ==================== -->
 