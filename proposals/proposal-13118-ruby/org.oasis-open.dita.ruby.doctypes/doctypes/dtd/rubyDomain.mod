<?xml version="1.0" encoding="utf-8"?>
<!-- =============================================================
     DITA Ruby Domain
     
     Defines equivalent of HTML ruby elements for marking up
     Japanese language documents.
     
     Copyright (c) 2012 OASIS Open
     
     ============================================================= -->
     
 <!ENTITY % ruby           "ruby" >

 <!ENTITY % rp             "rp" >
 <!ENTITY % rt             "rt" >


<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->


<!-- In order to support HTML5, which allows a mix of PCDATA, other phrase-
     level elements, and <rt> and <rp>, the content model must allow
     %ph;, which means that the DTD allows <ruby> within <ruby>. However,
     <ruby> should *not* be used within <ruby>, per the HTML 
     constraints on <ruby>. Likewise, if <rp> is used, it should be
     used as <rp>(</rp><rt>...</rt><rp>)</rp> per the HTML5 spec.
  -->
<!ENTITY % ruby.content
"
  (#PCDATA |
   %ruby; |
   %text; |
   %rp; |
   %rt;)*
  " 
>
<!ENTITY % ruby.attributes
 "
   %id-atts;
  %localization-atts;
  base       
    CDATA                            
    #IMPLIED
  %base-attribute-extensions;
  outputclass 
    CDATA                            
    'ruby'    
 "
> 
<!ELEMENT ruby %ruby.content; >
<!ATTLIST ruby %ruby.attributes; >


<!-- LONG NAME: Ruby parenthesis -->
<!ENTITY % rp.content
"
  (#PCDATA 
  )*
  " 
>
<!ENTITY % rp.attributes
 "
   %id-atts;
  %localization-atts;
  base       
    CDATA                            
    #IMPLIED
  %base-attribute-extensions;
  outputclass 
    CDATA                            
    'rp'    
 "
> 
<!ELEMENT rp %rp.content; >
<!ATTLIST rp %rp.attributes; >

<!-- LONG NAME: Ruby Text -->

<!ENTITY % rt.content
"
  (#PCDATA |
   %text; 
  )*
  " 
>
<!ENTITY % rt.attributes
 "
   %id-atts;
  %localization-atts;
  base       
    CDATA                            
    #IMPLIED
  %base-attribute-extensions;
  outputclass 
    CDATA                            
    'rt'    
 "
> 
<!ELEMENT rt %rt.content; >
<!ATTLIST rt %rt.attributes; >



<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

<!ATTLIST ruby              %global-atts;  class CDATA "+ topic/ph    ruby-d/ruby ">
<!ATTLIST rp                %global-atts;  class CDATA "+ topic/ph    ruby-d/rp ">
<!ATTLIST rt                %global-atts;  class CDATA "+ topic/ph    ruby-d/rt ">


<!-- ================== End Ruby Domain ==================== -->