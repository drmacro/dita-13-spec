<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA LearningGroupMap Type Module                 -->
<!--  VERSION:   1.3a                                              -->
<!--  DATE:      October 2012                                      -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identfier or an 
      appropriate system identifier
      PUBLIC "-//OASIS//ELEMENTS DITA Learning Group Map//EN"
      Delivered as file "learningGroupMap.mod"
      
                                                                   -->
<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for Learning Group Map                 -->
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
<!--   2012.11.13  DRB: Specialization attributes moved to         -->
<!--               separate attlist                                -->
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
            (%reltable;)?)"
>

<!ENTITY % learningGroupMap.attributes
             "title  		  CDATA		#IMPLIED
              id 					ID			#IMPLIED
              anchorref		CDATA		#IMPLIED
              outputclass CDATA		#IMPLIED
							%conref-atts;
              %localization-atts;
              %topicref-atts;
              %select-atts;"
>


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--      LONG NAME: learningGroupMap                             -->
<!ELEMENT learningGroupMap   %learningGroupMap.content; >


<!ATTLIST learningGroupMap    
              %learningGroupMap.attributes;
              %arch-atts;
    					domains CDATA           "&included-domains;"   
>


<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

 <!ATTLIST learningGroupMap  
 						%global-atts;  
 						class CDATA "- map/map learningGroupMap/learningGroupMap "
>
 




