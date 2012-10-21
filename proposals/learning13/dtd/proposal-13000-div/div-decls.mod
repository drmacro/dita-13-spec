<?xml version="1.0" encoding="UTF-8"?>
<!-- ==============================

 Proposal 13????
 
 DIV element
 
 DIV is the intersection of <bodydiv>
 and <sectiondiv>, that is all elements allowed
 within <body> and <section> except <section>
 or <title>. <div> should be allowed wherever 
 <p> or other block-level elements are allowed.
 
 <div> may nest.
==============================-->

<!-- div also includes div -->
<!ENTITY % div.cnt 
  "#PCDATA | 
   %basic.block; | 
   %basic.ph; | 
   %data.elements.incl; | 
   %foreign.unknown.incl; | 
   %txt.incl;
  "
>
<!ENTITY % div.content
                       "(%div.cnt;)*"
>
<!ENTITY % div.attributes
             "%univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT div    %div.content;>
<!ATTLIST div    %div.attributes;>

<!ATTLIST div    %global-atts;  class CDATA "- topic/div " >

<!-- End of declaration set  -->