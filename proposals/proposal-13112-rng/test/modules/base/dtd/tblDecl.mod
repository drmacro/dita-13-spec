<?xml version="1.0" encoding="UTF-8"?>

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % table       "table"                                       >
<!ENTITY % tgroup      "tgroup"                                      >
<!ENTITY % colspec     "colspec"                                     >
<!ENTITY % thead       "thead"                                       >
<!ENTITY % tbody       "tbody"                                       >
<!ENTITY % row         "row"                                         >
<!ENTITY % entry       "entry"                                       >

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->
  
<!ENTITY % yesorno
              "NMTOKEN" 
>
<!ENTITY % paracon
              "%tblcell.cnt;" 
>
<!ENTITY % tbl.table-titles.mdl
              "(%title;
%desc;
)" 
>
<!ENTITY % tbl.table-main.mdl
              "(%tgroup;)+" 
>
<!ENTITY % tbl.table.mdl
              "(%tbl.table-titles.mdl;
                %tbl.table-main.mdl;)" 
>
<!ENTITY % tbl.table.att
              "pgwide
                          %yesorno;
                                    #IMPLIED
" 
>
<!ENTITY % bodyatt
              "" 
>
<!ENTITY % tbl.tgroup.mdl
              "((%colspec;)*,
%thead;
                %tbody;)" 
>
<!ENTITY % tbl.tgroup.att
              "" 
>
<!ENTITY % tbl.thead.att
              "" 
>
<!ENTITY % tbl.tbody.att
              "" 
>
<!ENTITY % tbl.colspec.att
              "base
                          CDATA
                                    #IMPLIED
               %base-attribute-extensions;" 
>
<!ENTITY % tbl.row.mdl
              "(%entry;)+" 
>
<!ENTITY % tbl.row.att
              "" 
>
<!ENTITY % tbl.entry.mdl
              "(%paracon;)*" 
>
<!ENTITY % tbl.entry.att
              "base
                          CDATA
                                    #IMPLIED
               %base-attribute-extensions;" 
>
<!--                    LONG NAME: Table                           -->
<!ENTITY % table.content
              "%tbl.table.mdl;" 
>
<!ENTITY % table.attributes
              "frame
                          (top |
                           bottom |
                           topbot |
                           all |
                           sides |
                           none |
                           -dita-use-conref-target)
                                    #IMPLIED
               colsep
                          %yesorno;
                                    #IMPLIED
               rowsep
                          %yesorno;
                                    #IMPLIED
               %tbl.table.att;
               %bodyatt;
               %dita.table.attributes;" 
>
<!ELEMENT  table %table.content;>
<!ATTLIST  table %table.attributes;>


<!--                    LONG NAME: Tgroup                          -->
<!ENTITY % tgroup.content
              "%tbl.tgroup.mdl;" 
>
<!ENTITY % tgroup.attributes
              "cols
                          NMTOKEN
                                    #REQUIRED
               colsep
                          %yesorno;
                                    #IMPLIED
               rowsep
                          %yesorno;
                                    #IMPLIED
               align
                          (left |
                           right |
                           center |
                           justify |
                           char |
                           -dita-use-conref-target)
                                    #IMPLIED
               %tbl.tgroup.att;
               %dita.tgroup.attributes;" 
>
<!ELEMENT  tgroup %tgroup.content;>
<!ATTLIST  tgroup %tgroup.attributes;>


<!--                    LONG NAME: Colspec                         -->
<!ENTITY % colspec.content
              "EMPTY" 
>
<!ENTITY % colspec.attributes
              "colnum
                          NMTOKEN
                                    #IMPLIED
               colname
                          NMTOKEN
                                    #IMPLIED
               colwidth
                          CDATA
                                    #IMPLIED
               colsep
                          %yesorno;
                                    #IMPLIED
               rowsep
                          %yesorno;
                                    #IMPLIED
               align
                          (left |
                           right |
                           center |
                           justify |
                           char |
                           -dita-use-conref-target)
                                    #IMPLIED
               char
                          CDATA
                                    #IMPLIED
               charoff
                          NMTOKEN
                                    #IMPLIED
               %tbl.colspec.att;
               %dita.colspec.attributes;" 
>
<!ELEMENT  colspec %colspec.content;>
<!ATTLIST  colspec %colspec.attributes;>


<!--                    LONG NAME: Thead                           -->
<!ENTITY % thead.content
              "(%row;)+" 
>
<!ENTITY % thead.attributes
              "valign
                          (top |
                           middle |
                           bottom |
                           -dita-use-conref-target)
                                    #IMPLIED
               %tbl.thead.att;
               %dita.thead.attributes;" 
>
<!ELEMENT  thead %thead.content;>
<!ATTLIST  thead %thead.attributes;>


<!--                    LONG NAME: Tbody                           -->
<!ENTITY % tbody.content
              "(%row;)+" 
>
<!ENTITY % tbody.attributes
              "valign
                          (top |
                           middle |
                           bottom |
                           -dita-use-conref-target)
                                    #IMPLIED
               %tbl.tbody.att;
               %dita.tbody.attributes;" 
>
<!ELEMENT  tbody %tbody.content;>
<!ATTLIST  tbody %tbody.attributes;>


<!--                    LONG NAME: Row                             -->
<!ENTITY % row.content
              "%tbl.row.mdl;" 
>
<!ENTITY % row.attributes
              "rowsep
                          %yesorno;
                                    #IMPLIED
               valign
                          (top |
                           middle |
                           bottom |
                           -dita-use-conref-target)
                                    #IMPLIED
               %tbl.row.att;
               %dita.row.attributes;" 
>
<!ELEMENT  row %row.content;>
<!ATTLIST  row %row.attributes;>


<!--                    LONG NAME: Entry                           -->
<!ENTITY % entry.content
              "%tbl.entry.mdl;" 
>
<!ENTITY % entry.attributes
              "colname
                          NMTOKEN
                                    #IMPLIED
               namest
                          NMTOKEN
                                    #IMPLIED
               nameend
                          NMTOKEN
                                    #IMPLIED
               morerows
                          NMTOKEN
                                    #IMPLIED
               colsep
                          %yesorno;
                                    #IMPLIED
               rowsep
                          %yesorno;
                                    #IMPLIED
               align
                          (left |
                           right |
                           center |
                           justify |
                           char |
                           -dita-use-conref-target)
                                    #IMPLIED
               char
                          CDATA
                                    #IMPLIED
               charoff
                          NMTOKEN
                                    #IMPLIED
               valign
                          (top |
                           middle |
                           bottom |
                           -dita-use-conref-target)
                                    #IMPLIED
               %tbl.entry.att;
               %dita.entry.attributes;" 
>
<!ELEMENT  entry %entry.content;>
<!ATTLIST  entry %entry.attributes;>



<!-- ============================================================= -->
<!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
<!-- ============================================================= -->
  
<!ATTLIST  table        %global-atts;  class CDATA "- topic/table "      >
<!ATTLIST  tgroup       %global-atts;  class CDATA "- topic/tgroup "     >
<!ATTLIST  colspec      %global-atts;  class CDATA "- topic/colspec "    >
<!ATTLIST  thead        %global-atts;  class CDATA "- topic/thead "      >
<!ATTLIST  tbody        %global-atts;  class CDATA "- topic/tbody "      >
<!ATTLIST  row          %global-atts;  class CDATA "- topic/row "        >
<!ATTLIST  entry        %global-atts;  class CDATA "- topic/entry "      >

<!-- ================== tblDeclMod ==================== -->
 