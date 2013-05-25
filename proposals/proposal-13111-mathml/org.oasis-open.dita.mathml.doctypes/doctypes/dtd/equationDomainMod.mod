
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:                        -->
<!--  VERSION:                                                  -->
<!--  DATE:                                           -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an 
      appropriate system identifier 
PUBLIC "-//OASIS//ELEMENTS //EN"
      Delivered as file "equationDomainMod.mod"                -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Define elements and specialization attributes     -->
<!--             for                      -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             February 2008                                     -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2008, 2009.              -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--     : generated from Relax NG implementation      -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->


<!ENTITY % definitions 
  PUBLIC "-//OASIS//ENTITIES //EN" 
         "equationDomainMod.ent" 
>
%definitions;

<!ENTITY % ph "%equation-d-ph; " >

<!ENTITY % p "%equation-d-p; " >

<!ENTITY % fig "%equation-d-fig; " >

<!ENTITY % equation.cnt 
"(%ph.cnt;  |
%text; )*" 
>

<!ENTITY % equation-inline.content 
"(%equation.cnt; )*" 
>

<!ENTITY % equation-inline.attributes 
"%univ-atts; 
outputclass
                       CDATA
                             #IMPLIED
" 
>

<!-- 
The Inline Equation element (equation-inline) represents an
equation that is intended to be rendered inline with its surrounding
content.

The equation content may be represented in any number of ways,
including embedded MathML using the mathml specialization of
foreign, a reference to an image, inline TeX markup,
or any other way that an equation might be defined.

The equation may include alternative forms, such as both a MathML
version and an image.
     -->
<!ELEMENT  equation-inline    %equation-inline.content; >
<!ATTLIST  equation-inline    %equation-inline.attributes; >

<!ENTITY % equation-block.content 
"(#PCDATA%equation.cnt; )*" 
>

<!ENTITY % equation-block.attributes 
"%univ-atts; 
outputclass
                       CDATA
                             #IMPLIED
" 
>

<!-- 
The Block Equation element (equation-block) represents an
equation that is intended to be rendered as a block element. Block
equations are not intended to be numbered (see
equation-display).

The equation content may be represented in any number of ways,
including embedded MathML using the mathml specialization of
foreign, a reference to an image, inline TeX markup,
or any other way that an equation might be defined.

The equation may include alternative forms, such as both a MathML
version and an image.
     -->
<!ELEMENT  equation-block    %equation-block.content; >
<!ATTLIST  equation-block    %equation-block.attributes; >

<!ENTITY % equation-display.content 
"((%title; )?,(%desc; )?,(%figgroup;  |
%fig.cnt; )*)" 
>

<!ENTITY % equation-display.attributes 
"%display-atts; 
spectitle
                       CDATA
                             #IMPLIED
%univ-atts; 

outputclass
                       CDATA
                             #IMPLIED
" 
>

<!-- The Display Equation element (equation-display) represents an
        equation that may have a title or a description and that may be
        numbered. When equations are numbered they are often numbered separately
        from figures.Display equations that are simply a single equation plus, optionally, a
        title or description, may use the mathml element directly. When
        the display equation content is more complicated, it should use
        equation-inline or equation-block to clearly distinguish
        the equation content from non-equation content, such as paragraphs that
        provide commentary on the equations within the display equation.The equation content may be represented in any number of ways,
        including embedded MathML using the mathml specialization of
        foreign, a reference to an image, inline TeX markup,
        or any other way that an equation might be defined.The equation may include alternative forms, such as both a MathML
        version and an image. -->
<!ELEMENT  equation-display    %equation-display.content; >
<!ATTLIST  equation-display    %equation-display.attributes; >

<!ATTLIST  equation-inline
"%global-atts; 
class
                       CDATA
                             '+ topic/ph equation-d/equation-inline '
"
>
<!ATTLIST  equation-block
"%global-atts; 
class
                       CDATA
                             '+ topic/p equation-d/equation-block '
"
>
<!ATTLIST  equation-display
"%global-atts; 
class
                       CDATA
                             '+ topic/fig equation-d/equation-display '
"
>
