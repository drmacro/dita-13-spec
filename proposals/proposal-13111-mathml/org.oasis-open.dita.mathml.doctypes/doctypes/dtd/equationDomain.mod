<?xml version="1.0" encoding="utf-8"?>
<!-- =============================================================
     DITA Equation Domain
     
     Defines element types that represent equations semantically,
     irrespective of the representation of the equation content.
     
     DITA 1.3
     
     Copyright (c) 2013 OASIS Open
     
     ============================================================= -->
     
 <!ENTITY % equation-inline        "equation-inline" >
 <!ENTITY % equation-block         "equation-block" >
 <!ENTITY % equation-figure       "equation-figure" >

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!ENTITY % equation.cnt
          "(#PCDATA | 
           %basic.ph; | 
           %data.elements.incl; | 
           %foreign.unknown.incl; | 
           %image; | 
           %txt.incl;)*
          "
>

<!ENTITY % equation-inline.content
"%equation.cnt;
">
<!ENTITY % equation-inline.attributes
              "%univ-atts;
               outputclass 
                        CDATA 
                                  #IMPLIED"
 > 
<!ELEMENT equation-inline %equation-inline.content; >
<!ATTLIST equation-inline %equation-inline.attributes; >

<!ENTITY % equation-block.content
"%equation.cnt;
">
<!ENTITY % equation-block.attributes
              "
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
 > 
<!ELEMENT equation-block %equation-block.content; >
<!ATTLIST equation-block %equation-block.attributes; >

<!ENTITY % equation-figure.content
                       "((%title;)?, 
                         (%desc;)?, 
                         (%figgroup; | 
                          %fig.cnt;)* )"
>
<!ENTITY % equation-figure.attributes
             "%display-atts;
              spectitle 
                        CDATA 
                                  #IMPLIED
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
 > 
<!ELEMENT equation-figure %equation-figure.content; >
<!ATTLIST equation-figure %equation-figure.attributes; >



<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

<!ATTLIST equation-inline    %global-atts;  class CDATA "+ topic/ph  equation-d/equation-inline ">
<!ATTLIST equation-block     %global-atts;  class CDATA "+ topic/p   equation-d/equation-block ">
<!ATTLIST equation-figure   %global-atts;  class CDATA "+ topic/fig equation-d/equation-figure ">


<!-- ================== End Equation Domain ==================== -->