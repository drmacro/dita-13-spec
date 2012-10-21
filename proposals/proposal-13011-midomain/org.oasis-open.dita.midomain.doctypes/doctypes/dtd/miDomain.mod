<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    Machine Industry Domain                          -->
<!--  VERSION:   1.3                                               -->
<!--  DATE:      March 2009                                    -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identfier or an 
      appropriate system identifier 
PUBLIC "-//OASIS//ELEMENTS DITA Machine Industry Domain//EN"
      Delivered as file "MIDomain.mod"                        -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Define elements and specialization atttributes    -->
<!--             for the Task Requirements Domain                  -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             March 2009                                    -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2007, 2008.              -->
<!--             All Rights Reserved.                              -->
<!--  UPDATES:                                                     -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                    ELEMENT NAME ENTITIES                      -->
<!-- ============================================================= -->


<!ENTITY % miTechDataList   "miTechDataList"                                  >
<!ENTITY % miTechData       "miTechData"                                 >
<!ENTITY % miDataType       "miDataType"                                  >
<!ENTITY % miQuantity       "miQuantity"                                  >
<!ENTITY % miQuantityGroup  "miQuantityGroup"                                  >
<!ENTITY % miQuantityValue  "miQuantityValue"                                  >
<!ENTITY % miSystemOfMeasurement  "miSystemOfMeasurement"                                  >
<!ENTITY % miUnitOfMeasure  "miUnitOfMeasure"                                  >
<!ENTITY % miMeasuredValue  "miMeasuredValue"                                  >
<!ENTITY % miQualityTolerance  "miQualityTolerance"                                  >
<!ENTITY % miQualityToleranceType  "miQualityToleranceType"                                  >

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->
 
<!--                    LONG NAME: Technical Data List                     -->
<!ENTITY % miTechDataList.content
                       "(%miTechData;)+"
>
<!ENTITY % miTechDataList.attributes
             "compact 
                        (no | 
                         yes | 
                         -dita-use-conref-target) 
                                  #IMPLIED
              spectitle 
                        CDATA 
                                  #IMPLIED
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT miTechDataList    %miTechDataList.content;>
<!ATTLIST miTechDataList    %miTechDataList.attributes;>


<!--                    LONG NAME: Technical Data List Item                -->
<!ENTITY % miTechData.content
                       "((%miDataType;, 
                          %miQuantity;) | 
                         (%basic.ph;)*)"
>
<!ENTITY % miTechData.attributes
             "%univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT miTechData    %miTechData.content;>
<!ATTLIST miTechData    %miTechData.attributes;>





<!--                    LONG NAME: Datatype                          -->
<!ENTITY % miDataType.content
                       "(%ph.cnt; |
                         %text;)*"
>
<!ENTITY % miDataType.attributes
             "keyref 
                        CDATA 
                                  #IMPLIED
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT miDataType    %miDataType.content;>
<!ATTLIST miDataType    %miDataType.attributes;>

<!--                    LONG NAME: Quantity                          -->
<!ENTITY % miQuantity.content
                       "(%miQuantityGroup;)*"
>
<!ENTITY % miQuantity.attributes
             "keyref 
                        CDATA 
                                  #IMPLIED
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT miQuantity    %miQuantity.content;>
<!ATTLIST miQuantity    %miQuantity.attributes;>

<!--                    LONG NAME: Quantity Group                          -->
<!ENTITY % miQuantityGroup.content
                       "((%miQuantityValue;)*,
                         (%miQualityTolerance;)*)"
>
<!ENTITY % miQuantityGroup.attributes
             "keyref 
                        CDATA 
                                  #IMPLIED
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT miQuantityGroup    %miQuantityGroup.content;>
<!ATTLIST miQuantityGroup    %miQuantityGroup.attributes;>

<!--                    LONG NAME: Quantity Value                          -->
<!-- WEK: Quantity value could potentially be modeled as a simple table row of three values -->
<!ENTITY % miQuantityValue.content
                       "((%miSystemOfMeasurement;),
                         (%miUnitOfMeasure;),
                         (%miMeasuredValue;))"
>
<!ENTITY % miQuantityValue.attributes
             "keyref 
                        CDATA 
                                  #IMPLIED
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT miQuantityValue    %miQuantityValue.content;>
<!ATTLIST miQuantityValue    %miQuantityValue.attributes;>

<!--                    LONG NAME: System Of Measurement:  -->
<!ENTITY % miSystemOfMeasurement.content
                       "EMPTY"
>
<!ENTITY % miSystemOfMeasurement.attributes
             "name CDATA 'miSystemOfMeasurement'
              value (SI | US) 'SI'
             "
>
<!ELEMENT miSystemOfMeasurement    %miSystemOfMeasurement.content;>
<!ATTLIST miSystemOfMeasurement    %miSystemOfMeasurement.attributes;>

<!--                    LONG NAME: Unit Of Measure:  -->
<!ENTITY % miUnitOfMeasure.content
                       "EMPTY"
>
<!ENTITY % miUnitOfMeasure.attributes
             "name CDATA 'miUnitOfMeasure'
              value CDATA #REQUIRED
             "
>
<!ELEMENT miUnitOfMeasure    %miUnitOfMeasure.content;>
<!ATTLIST miUnitOfMeasure    %miUnitOfMeasure.attributes;>

<!--                    LONG NAME: Quantity Of Measure:  -->
<!ENTITY % miMeasuredValue.content
                       "(#PCDATA |
                         %text;)*"
>
<!ENTITY % miMeasuredValue.attributes
             "keyref 
                        CDATA 
                                  #IMPLIED
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT miMeasuredValue    %miMeasuredValue.content;>
<!ATTLIST miMeasuredValue    %miMeasuredValue.attributes;>

<!--                    LONG NAME: Quality Tolerance                          -->
<!ENTITY % miQualityTolerance.content
                       "((%miQualityToleranceType;),
                         (%miUnitOfMeasure;),
                         (%miMeasuredValue;))"
>
<!ENTITY % miQualityTolerance.attributes
             "keyref 
                        CDATA 
                                  #IMPLIED
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT miQualityTolerance    %miQualityTolerance.content;>
<!ATTLIST miQualityTolerance    %miQualityTolerance.attributes;>

<!--                    LONG NAME: Quality Tolerance Type:  -->
<!ENTITY % miQualityToleranceType.content
                       "EMPTY"
>
<!ENTITY % miQualityToleranceType.attributes
             "name CDATA 'miQualityToleranceType'
              value (plus | minus | plusorminus) 'plusorminus'
             "
>
<!ELEMENT miQualityToleranceType    %miQualityToleranceType.content;>
<!ATTLIST miQualityToleranceType    %miQualityToleranceType.attributes;>

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->


<!ATTLIST miTechDataList         %global-atts;  class  CDATA "+ topic/sl mi-d/miTechDataList "  >
<!ATTLIST miTechDatali           %global-atts;  class  CDATA "+ topic/sli mi-d/miTechDatali " >
<!ATTLIST miDataType             %global-atts;  class  CDATA "+ topic/ph mi-d/miDataType "       >
<!ATTLIST miQuantity             %global-atts;  class  CDATA "+ topic/ph mi-d/miQuantity "       >
<!ATTLIST miQuantityGroup        %global-atts;  class  CDATA "+ topic/ph mi-d/miQuantityGroup "       >
<!ATTLIST miQuantityValue        %global-atts;  class  CDATA "+ topic/ph mi-d/miQuantityValue "       >
<!ATTLIST miSystemOfMeasurement  %global-atts;  class  CDATA "+ topic/data mi-d/miSystemOfMeasurement "       >
<!ATTLIST miUnitOfMeasure        %global-atts;  class  CDATA "+ topic/data mi-d/miUnitOfMeasure "       >
<!ATTLIST miMeasuredValue    %global-atts;  class  CDATA "+ topic/ph mi-d/miMeasuredValue "       >
<!ATTLIST miQualityTolerance     %global-atts;  class  CDATA "+ topic/ph mi-d/miQualityTolerance "       >
<!ATTLIST miQualityToleranceType %global-atts;  class  CDATA "+ topic/data mi-d/miQualityToleranceType "       >

<!-- ================== End DITA Machine Industry Domain  ==================== -->
