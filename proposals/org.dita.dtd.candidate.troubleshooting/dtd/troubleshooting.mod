<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Troubleshooting                              -->
<!--  VERSION:   1.2                                               -->
<!--  DATE:      March 2012                                        -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an 
      appropriate system identifier 
PUBLIC "-//OASIS//ELEMENTS DITA Troubleshooting//EN"
      Delivered as file "troubleshooting.mod"                      -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Define elements and specialization atttributes    -->
<!--             for troubleshooting and other resolution          -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             March 2012                                        -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2009.              -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                   ARCHITECTURE ENTITIES                       -->
<!-- ============================================================= -->

<!-- default namespace prefix for DITAArchVersion attribute can be
     overridden through predefinition in the document type shell   -->
<!ENTITY % DITAArchNSPrefix
  "ditaarch"
>

<!-- must be instanced on each topic type                          -->
<!ENTITY % arch-atts 
             "xmlns:%DITAArchNSPrefix; 
                        CDATA
                                  #FIXED 'http://dita.oasis-open.org/architecture/2005/'
              %DITAArchNSPrefix;:DITAArchVersion
                        CDATA
                                  '1.2'
"
>


<!-- ============================================================= -->
<!--                   SPECIALIZATION OF DECLARED ELEMENTS         -->
<!-- ============================================================= -->


<!ENTITY % troubleshooting-info-types 
  "%info-types;
  "
>


<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->
 

<!ENTITY % cause           "cause"                                   >
<!ENTITY % condition       "condition"                               >
<!ENTITY % remedy          "remedy"                                  >
<!ENTITY % troubleshooting "troubleshooting"                         >
<!ENTITY % troublebody     "troublebody"                             >
<!ENTITY % troublebodydiv  "troublebodydiv"                          >


<!-- ============================================================= -->
<!--                    DOMAINS ATTRIBUTE OVERRIDE                 -->
<!-- ============================================================= -->


<!ENTITY included-domains 
  ""
>


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->


<!--                    LONG NAME: Troubleshooting                 -->
<!ENTITY % troubleshooting.content
                       "((%title;), 
                         (%titlealts;)?,
                         (%abstract; | 
                          %shortdesc;)?, 
                         (%prolog;)?, 
                         (%troublebody;)?, 
                         (%related-links;)?,
                         (%troubleshooting-info-types;)* )"
>
<!ENTITY % troubleshooting.attributes
             "id 
                        ID 
                                  #REQUIRED
              %conref-atts;
              %select-atts;
              %localization-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT troubleshooting    %troubleshooting.content;>
<!ATTLIST troubleshooting    
              %troubleshooting.attributes;
              %arch-atts;
              domains 
                        CDATA 
                                  "&included-domains;">



<!--                    LONG NAME: Troubleshooting Body            -->
<!ENTITY % troublebody.content
                       "((%body.cnt;)*, 
                         (%cause;|
                         %condition;|
                         %remedy;|
                          %troublebodydiv;)* )"
>
<!ENTITY % troublebody.attributes
             "%id-atts;
              %localization-atts;
              base 
                        CDATA 
                                  #IMPLIED
              %base-attribute-extensions;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT troublebody    %troublebody.content;>
<!ATTLIST troublebody    %troublebody.attributes;>

<!--                    LONG NAME: Cause                           -->
<!ENTITY % cause.content
                       "(%section.cnt;)*"
>
<!ENTITY % cause.attributes
             "spectitle 
                        CDATA 
                                  #IMPLIED
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT cause    %cause.content;>
<!ATTLIST cause    %cause.attributes;>

<!--                    LONG NAME: Condition                       -->
<!ENTITY % condition.content
                       "(%section.cnt;)*"
>
<!ENTITY % condition.attributes
             "spectitle 
                        CDATA 
                                  #IMPLIED
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT condition    %condition.content;>
<!ATTLIST condition    %condition.attributes;>

<!--                    LONG NAME: Remedy                          -->
<!ENTITY % remedy.content
                    "((%title;)?, (%body.cnt;)*,
                    (%steps; | %steps-unordered;)?, (%body.cnt;)*)" 
>
<!ENTITY % remedy.attributes
             "spectitle 
                        CDATA 
                                  #IMPLIED
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT remedy    %remedy.content;>
<!ATTLIST remedy    %remedy.attributes;>

<!--                    LONG NAME: Troubleshooting Body division   -->
<!ENTITY % troublebodydiv.content
                       "(%cause;|
                       %condition;|
                       %remedy;)*"
>
<!ENTITY % troublebodydiv.attributes
             "%univ-atts;
              outputclass 
                        CDATA
                                  #IMPLIED"
>
<!ELEMENT troublebodydiv    %troublebodydiv.content;>
<!ATTLIST troublebodydiv    %troublebodydiv.attributes;>
 
<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

<!ATTLIST troubleshooting     %global-atts;  class CDATA "- topic/topic troubleshooting/troubleshooting ">
<!ATTLIST troublebody     %global-atts;  class CDATA "- topic/body  troubleshooting/troublebody ">
<!ATTLIST troublebodydiv  %global-atts;  class CDATA "- topic/bodydiv troubleshooting/troublebodydiv ">
<!ATTLIST cause      %global-atts;  class  CDATA "- topic/section troubleshooting/cause ">
<!ATTLIST condition      %global-atts;  class  CDATA "- topic/section troubleshooting/condition ">
<!ATTLIST remedy      %global-atts;  class  CDATA "- topic/section troubleshooting/remedy ">

<!-- ================== End DITA Troubleshooting  ======================== -->




