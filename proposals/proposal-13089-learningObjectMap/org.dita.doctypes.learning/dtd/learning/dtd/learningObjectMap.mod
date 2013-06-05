<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Learning Object Map Type Module              -->
<!--  VERSION:   1.3a                                               -->
<!--  DATE:      October 2012                                      -->
<!--                                                               -->
<!-- ============================================================= -->
<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for the Learning Object Map            -->
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
<!-- ============================================================= -->
<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identfier or an 
      appropriate system identifier:
      PUBLIC "-//OASIS//ELEMENTS DITA Learning Object Map//EN"
      Delivered as file "learningObjectMap.mod"                          
                                                                   -->
<!-- ============================================================= -->
<!--                   SPECIALIZATION OF DECLARED ELEMENTS         -->
<!-- ============================================================= -->

<!ENTITY % learningObjectMap           "learningObjectMap" >
<!ENTITY % learningObject              "learningObject">

<!-- ============================================================= -->
<!--                    COMMON ATTLIST SETS                        -->
<!-- ============================================================= -->

<!ENTITY % learningObjectMap.content
                       "((%title;)?, 
                       (%topicmeta;)?, 
                       (%topicref;)*, 
                       (%learningObject;),
                       (%reltable;)?)"
>

<!ENTITY % learningObjectMap.attributes
             "title  		  CDATA		#IMPLIED            
              id 				  ID 			#IMPLIED
             	anchorref   CDATA 	#IMPLIED             
             	outputclass CDATA 	#IMPLIED                
             	%conref-atts;                        
             	%localization-atts;
							%topicref-atts;              
              %select-atts;              
">


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--      LONG NAME: learningObjectMap                             -->
<!ELEMENT learningObjectMap   %learningObjectMap.content;>


<!ATTLIST learningObjectMap    
              %learningObjectMap.attributes;              
              %arch-atts;    					
    					domains CDATA  "&included-domains;"   
>


<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

 <!ATTLIST learningObjectMap  
 						%global-atts;  
 						class CDATA "- map/map learningObjectMap/learningObjectMap "
>
