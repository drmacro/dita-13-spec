
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA MathML Domain - RNG                    -->
<!--  VERSION:   1.3                                               -->
<!--  DATE:      May 2013                                     -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an 
      appropriate system identifier 
PUBLIC "-//OASIS//ELEMENTS DITA MathML Domain - RNG//EN"
      Delivered as file "mathmlDomainMod.mod"                -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Define elements and specialization attributes     -->
<!--             for MathML Domain - RNG                     -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             February 2008                                     -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2008, 2009.              -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--     May 2013: generated from Relax NG implementation      -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->


<!ENTITY % definitions 
  PUBLIC "-//OASIS//ENTITIES DITA MathML Domain - RNG//EN" 
         "mathmlDomainMod.ent" 
>
%definitions;

<!ENTITY % foreign "%mathml-d-foreign; " >

<!ENTITY % mathmlref.content 
"EMPTY" 
>

<!ENTITY % mathmlref.attributes "%xref.attributes; " >

<!ELEMENT  mathmlref    %mathmlref.content; >
<!ATTLIST  mathmlref    %mathmlref.attributes; >

<!ENTITY % mathml.content 
"<!-- 
      The MathML (mathml) element contains inline MathML markup or
        references to MathML elements stored in a separate non-DITA XML
        document.
      The purpose of this element is simply to contain MathML markup. It is
        not intended, by itself, to convey the semantic of "equation". Rather,
        it simply serves to hold one of many possible ways that the content of
        an equation may be represented. The companion equation domain provides
        elements for representing equations semantically, independent of the
        format of the equation content.
      The MathML markup must have a root element of "math" within the MathML
        namespace "http://www.w3.org/1998/Math/MathML".
      This element is part of the DITA MathML domain. Category: Foreign
        elements
     -->
( |
mathmlref |
data |
data-about)*" 
>

<!ENTITY % mathml.attributes 
"%univ-atts; 
outputclass
                       CDATA
                             #IMPLIED
" 
>

<!ELEMENT  mathml    %mathml.content; >
<!ATTLIST  mathml    %mathml.attributes; >

<!ATTLIST  mathml
"%global-atts; 
class
                       CDATA
                             '+ topic/foreign mathml-d/mathml '
"
>
<!ATTLIST  mathmlref
"%global-atts; 
class
                       CDATA
                             '+ topic/xref mathml-d/mathmlref '
"
>
