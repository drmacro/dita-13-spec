<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA MathML Domain - RNG                    -->
<!--  VERSION:   1.3                                               -->
<!--  DATE:      May 2013                                     -->
<!--                                                               -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % foreign "%mathml-d-foreign; " >

<!ENTITY % mathmlref.content 
"EMPTY" 
>

<!ENTITY % mathmlref.attributes 
"href
                       CDATA
                             #IMPLIED

keyref
                       CDATA
                             #IMPLIED

type
                       CDATA
                             #IMPLIED

format
                       CDATA
                             'xml'

scope
                       (external |
local |
peer |
-dita-use-conref-target)
                             #IMPLIED
%univ-atts; 

outputclass
                       CDATA
                             #IMPLIED
" 
>

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
