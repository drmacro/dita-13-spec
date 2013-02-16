<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Learning Object Map Type Module              -->
<!--  VERSION:   0.9                                               -->
<!--  DATE:      October 2012                                      -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identfier or an 
      appropriate system identifier
      TBD                                              -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for Learning Map Domain                -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             October 2012                                      -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2012.                    -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    2012.10.18 DRB: Original creation                          -->
<!--               Located with other learningObjectMap and        -->
<!--               learningMapDomain components within the DITA-OT -->
<!--               test plugin org.dita.doctypes.learning.         -->
<!--                                                               -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                   SPECIALIZATION OF DECLARED ELEMENTS         -->
<!-- ============================================================= -->

<!ENTITY % learningGroupMap           "learningGroupMap">
<!ENTITY % learningGroup              "learningGroup">

<!-- ============================================================= -->
<!--                    COMMON ATTLIST SETS                        -->
<!-- ============================================================= -->

<!ENTITY % learningGroupMap.content
           "((%title;)?,
            (%topicmeta;)?, 
            (%topicref;)*,
            (%learningGroup;),
            (%reltable;)*)"
>

<!ENTITY % learningGroupMap.attributes
             "title 
                        CDATA 
                                  #IMPLIED
              id 
                        ID 
                                  #IMPLIED
              %conref-atts;
              anchorref 
                        CDATA 
                                  #IMPLIED
              outputclass 
                        CDATA 
                                  #IMPLIED
              %localization-atts;
              %topicref-atts;
              %select-atts;"
>


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--      LONG NAME: learningGroupMap                             -->
<!ELEMENT learningGroupMap   %learningGroupMap.content;>

<!ATTLIST learningGroupMap    
              %learningGroupMap.attributes;
              %arch-atts;
              %global-atts;
    domains CDATA           "(&included-domains;)"
    class CDATA "- map/map learningGroupMap/learningGroupMap "    
>

 




