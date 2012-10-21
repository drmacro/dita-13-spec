<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Learning Interaction Base Domain             -->
<!--  VERSION:   1.3                                               -->
<!--  DATE:      April 2012                                        -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identfier or an 
      appropriate system identifier 
PUBLIC "-//OASIS//ELEMENTS DITA Learning Domain//EN"
      Delivered as file "learningDomain.mod"                      -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for Learning Domain                    -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             Sept 2009                                         -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2009.                    -->
<!--             All Rights Reserved.                              -->
<!-- CHANGE LOG:                                                   -->
<!-- April 2012: WEK:  
     - Added (%lcInteractionlabel;)* where title was allowed
       in interactions
     - Made @id implied on interactions
-->
<!-- ============================================================= -->

 

<!-- =====================================================================
     ENTITY DECLARATIONS FOR DOMAIN SUBSTITUTION
     ===================================================================== -->

<!ENTITY % lcInteractionBase        "lcInteractionBase">
<!ENTITY % lcQuestionBase           "lcQuestionBase">
<!ENTITY % lcInteractionLabel       "lcInteractionLabel">

<!-- =====================================================================
     INTERACTION BASE DEFINITIONS
     ===================================================================== -->
<!ENTITY % lcInteractionBase.content
                       "(((%title;)? |
                          (%lcInteractionLabel;)*),
                         (%lcQuestionBase;), 
                         (%fig.cnt;)*)"
>
<!-- WEK: made @id implied rather than required per L&T SC decision -->
<!ENTITY % lcInteractionBase.attributes
             "id
                        NMTOKEN
                                  #IMPLIED
              %conref-atts;
              %select-atts;
              %localization-atts;
              outputclass
                        CDATA
                                  #IMPLIED"
>
<!ELEMENT lcInteractionBase    %lcInteractionBase.content;>
<!ATTLIST lcInteractionBase    %lcInteractionBase.attributes;>

<!ENTITY % lcInteractionLabel.content
 "(%title.cnt;)*"
>
<!ENTITY % lcInteractionLabel.attributes
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
<!ELEMENT lcInteractionLabel    %lcInteractionLabel.content;>
<!ATTLIST lcInteractionLabel    %lcInteractionLabel.attributes;>

<!ENTITY % lcQuestionBase.content
                       "(%div.cnt;)*"
>
<!ENTITY % lcQuestionBase.attributes
             "%univ-atts;
              outputclass
                        CDATA
                                  #IMPLIED"
>
<!ELEMENT lcQuestionBase    %lcQuestionBase.content;>
<!ATTLIST lcQuestionBase    %lcQuestionBase.attributes;>

<!-- =====================================================================
     CLASS ATTRIBUTES FOR ANCESTRY DECLARATION
     ===================================================================== -->
<!ATTLIST lcInteractionBase %global-atts;
    class CDATA "+ topic/fig learningInteractionBase-d/lcInteractionBase ">
<!-- WEK: Note: This changed from topic/p to topic/div for DITA 1.3 per TC
          decision.
  -->
<!ATTLIST lcQuestionBase %global-atts;
    class CDATA "+ topic/div   learningInteractionBase-d/lcQuestionBase ">
<!ATTLIST lcInteractionLabel %global-atts;
    class CDATA "+ topic/p learningInteractionBase2-d/lcInteractionLabel ">

<!--============ End of learning interaction base module ==================-->