<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA IBM Map Utilities Domain                     -->
<!--  VERSION:   1.1                                               -->
<!--  DATE:      May 2011                                          -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an
      appropriate system identifier
PUBLIC "-//IBM//ELEMENTS DITA IBM Map Utilities Domain//EN"
      Delivered as file "ibmMapUtilitiesDomain.mod"                -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Define elements and specialization attributes     -->
<!--             for Map Group Domain                              -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             May 2005                                          -->
<!--                                                               -->
<!--             Copyright IBM Corporation 2005, 2011.             -->
<!--                                                               -->
<!-- UPDATES:                                                      -->
<!--   2006.12.11 RDA: Update overrideShortdesc model to match     -->
<!--                   expanced shortdesc model from DITA 1.1      -->
<!--   2011.05.13 RDA: Add support for ditavalref                  -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                    ELEMENT NAME ENTITIES                      -->
<!-- ============================================================= -->

<!ENTITY % overrideTitle     "overrideTitle"                         >
<!ENTITY % overrideShortdesc "overrideShortdesc"                     >
<!ENTITY % retrievalKeys     "retrievalKeys"                         >
<!ENTITY % retkey            "retkey"                                >
<!ENTITY % ditavalref        "ditavalref"                            >
<!ENTITY % ditavalmeta       "ditavalmeta"                           >
<!ENTITY % noFileRenaming    "noFileRenaming"                        >


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Link Text                       -->
<!--doc:The <overrideTitle> element allows you to force a title or heading into a topic, regardless of the locktitle and lockmeta attribute values.
Category: Map elements-->
<!--doc: The override title (<overrideTitle>) element occurs within the topicmeta element in a map. This element allows you to force a title or heading into a topic, regardless of the locktitle and lockmeta attribute values.
Category: Map Utilities element-->
<!ELEMENT  overrideTitle     (%words.cnt;)*                          >

<!--                    LONG NAME: Short Description               -->
<!--doc:The <overrideShortdesc> element allows you to force a short description into a topic, regardless of the locktitle and lockmeta attribute values.
Category: Map elements-->
<!--doc: The override short description (<overrideShortdesc>) element occurs within the topicmeta element in a map. The short description, which represents the purpose or theme of the topic, is also intended to be used as a link preview and for searching. This element allows you to force a short description into a topic, regardless of the locktitle and lockmeta attribute values.
Category: Map Utilities element-->
<!ELEMENT  overrideShortdesc    (%title.cnt;)*                       >

<!--                    LONG NAME: Retrieval Keys                  -->
<!--doc:The <retrievalKeys> element specifies retrieval aid text.
Category: Map elements-->
<!--doc: The retrievalKeys element specifies retrieval aid text.
Category: Map Utilities element-->
<!ELEMENT retrievalKeys      (%retkey;)+                             >
<!ATTLIST retrievalKeys
             %univ-atts;                                             >

<!--                    LONG NAME: Retkey (drops <tm>)             -->
<!--doc:The <retkey> element specifies retrieval aid text.
Category: Map elements-->
<!--doc: The retkey element specifies retrieval aid text.
Category: Map Utilities element-->
<!ELEMENT retkey       (#PCDATA)*                                    >
<!ATTLIST retkey
             keyref     CDATA                           #IMPLIED
             %univ-atts;                                             >

<!--                    LONG NAME: Topic Reference                 -->
<!--doc:The <ditavalref> element designates a DITAVAL properties file for use in branch filtering in a map.
Category: Map elements-->
<!--doc: The <ditavalref> element designates a DITAVAL properties file for use in branch filtering in a map.
Category: Map Utilities element-->
<!ELEMENT  ditavalref     ((%ditavalmeta;)?)                   >
<!ATTLIST  ditavalref
             navtitle   CDATA                             #IMPLIED
             href       CDATA                             #IMPLIED
             keyref     CDATA                             #IMPLIED
             outputclass
                        CDATA                             #IMPLIED
             scope      (local | peer | external |
                         -dita-use-conref-target)         #IMPLIED
             linking    (none | normal |
                         sourceonly | targetonly |
                         -dita-use-conref-target)         'none'
             format     CDATA                             'ditaval'
             toc        (yes | no |
                         -dita-use-conref-target)         'no'
             print      (yes | no | printonly |
                         -dita-use-conref-target)         #IMPLIED
             %univ-atts;                                             >

<!--                    LONG NAME: Ditaval Metadata                -->
<!--doc:The <ditavalmeta> element defines metadata that applies to a DITAVAL in a map.
Category: Map elements-->
<!--doc: The <ditavalmeta> element defines metadata that applies to a DITAVAL in a map.
Category: Map Utilities element-->
<!ELEMENT  ditavalmeta    ((%navtitle;)?, (%noFileRenaming;)?)       >
<!ATTLIST  ditavalmeta
             lockmeta   (yes | no |
                         -dita-use-conref-target)         #IMPLIED
             %univ-atts;                                             >

<!--                    LONG NAME: No File Renaming                -->
<!--doc: The <noFileRenaming> element specifies that no files should be renamed in the branch filtering output process.
Category: Map Utilities element-->
<!ELEMENT noFileRenaming    EMPTY>


<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

<!ATTLIST overrideTitle    %global-atts;  class CDATA "+ map/linktext  ibmmu-d/overrideTitle " >
<!ATTLIST overrideShortdesc   %global-atts;  class CDATA "+ map/shortdesc ibmmu-d/overrideShortdesc " >
<!ATTLIST retrievalKeys    %global-atts;  class CDATA "+ topic/keywords ibmmu-d/retrievalKeys "    >
<!ATTLIST retkey   %global-atts;  class CDATA "+ topic/keyword ibmmu-d/retkey "    >
<!ATTLIST ditavalref   %global-atts;  class CDATA "+ map/topicref ibmmu-d/ditavalref "    >
<!ATTLIST ditavalmeta   %global-atts;  class CDATA "+ map/topicmeta ibmmu-d/ditavalmeta "    >
<!ATTLIST noFileRenaming   %global-atts;  class CDATA "+ topic/data ibmmu-d/noFileRenaming "    >

<!-- ================== DITA Map Group Domain  =================== -->
