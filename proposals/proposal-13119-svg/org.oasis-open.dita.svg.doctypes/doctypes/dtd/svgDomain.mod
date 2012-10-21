<?xml version="1.0" encoding="utf-8"?>
<!-- =============================================================
     DITA SVG Domain
     
     Defines a specialization of <foreign> that contains 
     SVG markup.
     
     DITA 1.3
     
     Copyright (c) 2012 OASIS Open
     
     ============================================================= -->
     
 <!ENTITY % svg_container        "svg_container" >

<!ENTITY % svg11.dtd 
  SYSTEM "svg11/svg11.dtd"
>%svg11.dtd;

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!ENTITY % svg_container.content
"
  (%data; |
   %data-about; |
   %SVG.pfx;svg)*
"
>
<!ENTITY % svg_container.attributes
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
<!ELEMENT svg_container %svg_container.content; >
<!ATTLIST svg_container %svg_container.attributes; >

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

<!ATTLIST svg_container           %global-atts;  class CDATA "+ topic/foreign svg-d/svg_container ">

<!-- ================== End SVG Domain ==================== -->