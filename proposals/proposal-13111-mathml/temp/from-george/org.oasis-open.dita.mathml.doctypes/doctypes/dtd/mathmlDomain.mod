<?xml version="1.0" encoding="utf-8"?>
<!-- =============================================================
     DITA MathML Domain
     
     Defines a specialization of <foreign> that contains 
     MathML markup.
     
     DITA 1.3
     
     Copyright (c) 2012 OASIS Open
     
     ============================================================= -->
     
 <!ENTITY % mathml_container        "mathml_container" >

<!ENTITY % MATHML.prefixed "INCLUDE">

<!ENTITY % mathml3.dtd 
  SYSTEM "mathml3/dtd/mathml3.dtd"
>%mathml3.dtd;

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!ENTITY % mathml_container.content
"
  (%MATHML.pfx;math |
   %data; |
   %data-about;)*
"
>
<!ENTITY % mathml_container.attributes
 "
   %id-atts;
  %localization-atts;
  base       
    CDATA                            
    #IMPLIED
  %base-attribute-extensions;
  outputclass 
    CDATA                            
    #IMPLIED    

 "
> 
<!ELEMENT mathml_container %mathml_container.content; >
<!ATTLIST mathml_container %mathml_container.attributes; >



<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

<!ATTLIST mathml_container           %global-atts;  class CDATA "+ topic/foreign mathml-d/mathml_container ">


<!-- ================== End MathML Domain ==================== -->