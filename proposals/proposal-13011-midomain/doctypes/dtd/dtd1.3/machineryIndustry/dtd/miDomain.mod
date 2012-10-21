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


<!ENTITY % techdatalist   "techdatalist"                                  >
<!ENTITY % techdata      "techdata"                                 >
<!ENTITY % datatype       "datatype"                                  >
<!ENTITY % quantity       "quantity"                                  >

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->
 
<!--                    LONG NAME: Technical Data List                     -->
<!ENTITY % techdatalist.content
                       "(%techdata;)+"
>
<!ENTITY % techdatalist.attributes
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
<!ELEMENT techdatalist    %techdatalist.content;>
<!ATTLIST techdatalist    %techdatalist.attributes;>


<!--                    LONG NAME: Technical Data List Item                -->
<!ENTITY % techdata.content
                       "((%datatype;, 
                          %quantity;) | 
                         (%basic.ph;)*)"
>
<!ENTITY % techdata.attributes
             "%univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT techdata    %techdata.content;>
<!ATTLIST techdata    %techdata.attributes;>





<!--                    LONG NAME: Datatype                          -->
<!ENTITY % datatype.content
                       "(%ph.cnt; |
                         %text;)*"
>
<!ENTITY % datatype.attributes
             "keyref 
                        CDATA 
                                  #IMPLIED
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>
<!ELEMENT datatype    %datatype.content;>
<!ATTLIST datatype    %datatype.attributes;>


<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->


<!ATTLIST techdatalist    %global-atts;  class  CDATA "+ topic/sl mi-d/techdatalist "  >
<!ATTLIST techdatali   %global-atts;  class  CDATA "+ topic/sli mi-d/techdatali " >
<!ATTLIST datatype    %global-atts;  class  CDATA "+ topic/ph mi-d/datatype "       >

<!-- ================== End DITA Machine Industry Domain  ==================== -->
