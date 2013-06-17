<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:                        -->
<!--  VERSION:                                                  -->
<!--  DATE:                                           -->
<!--                                                               -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

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
