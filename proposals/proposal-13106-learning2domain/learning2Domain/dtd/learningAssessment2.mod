<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA learningAssessment 2                         -->
<!--  VERSION:   1.3                                               -->
<!--  DATE:      July 2013                                         -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identfier or an 
      appropriate system identifier 
PUBLIC "-//OASIS//ELEMENTS DITA Learning Assessment 2//EN"
      Delivered as file "learningAssessment.mod                    -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for Learning Assessment                -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             July 2013                                          -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2013                     -->
<!--             All Rights Reserved.                              -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                   SPECIALIZATION OF DECLARED ELEMENTS         -->
<!-- ============================================================= -->

<!ENTITY % learningAssessment2     "learningAssessment2">
<!ENTITY % learningAssessment2body "learningAssessment2body">

<!ENTITY % learningAssessment2-info-types "no-topic-nesting">

<!ENTITY included-domains 
  ""
>

<!--                    LONG NAME: Learning Assessment             -->
<!ENTITY % learningAssessment2.content
                        "((%title;),
                          (%titlealts;)?,
                          (%shortdesc; | 
                           %abstract;)?,
                          (%prolog;)?,
                          (%learningAssessment2body;),
                          (%related-links;)?,
                          (%learningAssessment2-info-types;)* )"
>
<!ENTITY % learningAssessment2.attributes
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
<!ELEMENT learningAssessment2    %learningAssessment2.content;>
<!ATTLIST learningAssessment2
              %learningAssessment2.attributes;
              %arch-atts;
              domains 
                        CDATA
                                  "&included-domains;"
>

<!--                    LONG NAME: Learning Assessment Body        -->
<!ENTITY % learningAssessment2body.content
                        "((%lcIntro;)?,
                          (%lcObjectives;)?,
                          (%lcDuration;)?,
                          (%lcInteraction;)*,
                          (%section;)*,
                          (%lcSummary;)?)"
>
<!ENTITY % learningAssessment2body.attributes
             "%univ-atts;
              outputclass
                        CDATA
                                  #IMPLIED"
>
<!ELEMENT learningAssessment2body   %learningAssessment2body.content;>
<!ATTLIST learningAssessment2body   %learningAssessment2body.attributes;>

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->
 
<!ATTLIST learningAssessment2        %global-atts; class CDATA "- topic/topic learningBase/learningBase     learningAssessment2/learningAssessment2 ">
<!ATTLIST learningAssessment2body    %global-atts; class CDATA "- topic/body  learningBase/learningBasebody learningAssessment2/learningAssessment2body ">




