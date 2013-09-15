<?xml version="1.0" encoding="UTF-8"?>

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % author      "author"                                      >
<!ENTITY % source      "source"                                      >
<!ENTITY % publisher   "publisher"                                   >
<!ENTITY % copyright   "copyright"                                   >
<!ENTITY % copyryear   "copyryear"                                   >
<!ENTITY % copyrholder "copyrholder"                                 >
<!ENTITY % critdates   "critdates"                                   >
<!ENTITY % created     "created"                                     >
<!ENTITY % revised     "revised"                                     >
<!ENTITY % permissions "permissions"                                 >
<!ENTITY % category    "category"                                    >
<!ENTITY % metadata    "metadata"                                    >
<!ENTITY % audience    "audience"                                    >
<!ENTITY % keywords    "keywords"                                    >
<!ENTITY % prodinfo    "prodinfo"                                    >
<!ENTITY % prodname    "prodname"                                    >
<!ENTITY % vrmlist     "vrmlist"                                     >
<!ENTITY % vrm         "vrm"                                         >
<!ENTITY % brand       "brand"                                       >
<!ENTITY % series      "series"                                      >
<!ENTITY % platform    "platform"                                    >
<!ENTITY % prognum     "prognum"                                     >
<!ENTITY % featnum     "featnum"                                     >
<!ENTITY % component   "component"                                   >
<!ENTITY % othermeta   "othermeta"                                   >
<!ENTITY % resourceid  "resourceid"                                  >

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->
  
<!ENTITY % date-format
              "CDATA" 
>
<!--                    LONG NAME: Author                          -->
<!ENTITY % author.content
              "(%words.cnt;)*" 
>
<!ENTITY % author.attributes
              "%univ-atts;
               href
                          CDATA
                                    #IMPLIED
               format
                          CDATA
                                    #IMPLIED
               scope
                          (external |
                           local |
                           peer |
                           -dita-use-conref-target)
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED
               type
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  author %author.content;>
<!ATTLIST  author %author.attributes;>


<!--                    LONG NAME: Source                          -->
<!ENTITY % source.content
              "(%words.cnt; |
                %ph;)*" 
>
<!ENTITY % source.attributes
              "%univ-atts;
               href
                          CDATA
                                    #IMPLIED
               format
                          CDATA
                                    #IMPLIED
               type
                          CDATA
                                    #IMPLIED
               scope
                          (external |
                           local |
                           peer |
                           -dita-use-conref-target)
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  source %source.content;>
<!ATTLIST  source %source.attributes;>


<!--                    LONG NAME: Publisher                       -->
<!ENTITY % publisher.content
              "(%words.cnt;)*" 
>
<!ENTITY % publisher.attributes
              "href
                          CDATA
                                    #IMPLIED
               format
                          CDATA
                                    #IMPLIED
               type
                          CDATA
                                    #IMPLIED
               scope
                          (external |
                           local |
                           peer |
                           -dita-use-conref-target)
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED
               %univ-atts;" 
>
<!ELEMENT  publisher %publisher.content;>
<!ATTLIST  publisher %publisher.attributes;>


<!--                    LONG NAME: Copyright                       -->
<!ENTITY % copyright.content
              "((%copyryear;)+,
                %copyrholder;)" 
>
<!ENTITY % copyright.attributes
              "%univ-atts;
               type
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  copyright %copyright.content;>
<!ATTLIST  copyright %copyright.attributes;>


<!--                    LONG NAME: Copyryear                       -->
<!ENTITY % copyryear.content
              "EMPTY" 
>
<!ENTITY % copyryear.attributes
              "year
                          %date-format;
                                    #REQUIRED
               %univ-atts;" 
>
<!ELEMENT  copyryear %copyryear.content;>
<!ATTLIST  copyryear %copyryear.attributes;>


<!--                    LONG NAME: Copyrholder                     -->
<!ENTITY % copyrholder.content
              "(%words.cnt;)*" 
>
<!ENTITY % copyrholder.attributes
              "%univ-atts;" 
>
<!ELEMENT  copyrholder %copyrholder.content;>
<!ATTLIST  copyrholder %copyrholder.attributes;>


<!--                    LONG NAME: Critdates                       -->
<!ENTITY % critdates.content
              "((%created;)?,
                (%revised;)*)" 
>
<!ENTITY % critdates.attributes
              "%univ-atts;" 
>
<!ELEMENT  critdates %critdates.content;>
<!ATTLIST  critdates %critdates.attributes;>


<!--                    LONG NAME: Created                         -->
<!ENTITY % created.content
              "EMPTY" 
>
<!ENTITY % created.attributes
              "date
                          %date-format;
                                    #REQUIRED
               golive
                          %date-format;
                                    #IMPLIED
               expiry
                          %date-format;
                                    #IMPLIED
               %univ-atts;" 
>
<!ELEMENT  created %created.content;>
<!ATTLIST  created %created.attributes;>


<!--                    LONG NAME: Revised                         -->
<!ENTITY % revised.content
              "EMPTY" 
>
<!ENTITY % revised.attributes
              "modified
                          %date-format;
                                    #REQUIRED
               golive
                          %date-format;
                                    #IMPLIED
               expiry
                          %date-format;
                                    #IMPLIED
               %univ-atts;" 
>
<!ELEMENT  revised %revised.content;>
<!ATTLIST  revised %revised.attributes;>


<!--                    LONG NAME: Permissions                     -->
<!ENTITY % permissions.content
              "EMPTY" 
>
<!ENTITY % permissions.attributes
              "%univ-atts;
               view
                          CDATA
                                    #REQUIRED" 
>
<!ELEMENT  permissions %permissions.content;>
<!ATTLIST  permissions %permissions.attributes;>


<!--                    LONG NAME: Category                        -->
<!ENTITY % category.content
              "(%words.cnt;)*" 
>
<!ENTITY % category.attributes
              "%univ-atts;" 
>
<!ELEMENT  category %category.content;>
<!ATTLIST  category %category.attributes;>


<!--                    LONG NAME: Metadata                        -->
<!ENTITY % metadata.content
              "((%audience;)*,
                (%category;)*,
                (%keywords;)*,
                (%prodinfo;)*,
                (%othermeta;)*,
                (%data.elements.incl; |
                 %foreign.unknown.incl;)*)" 
>
<!ENTITY % metadata.attributes
              "%univ-atts;
               mapkeyref
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  metadata %metadata.content;>
<!ATTLIST  metadata %metadata.attributes;>


<!--                    LONG NAME: Audience                        -->
<!ENTITY % audience.content
              "EMPTY" 
>
<!ENTITY % audience.attributes
              "type
                          CDATA
                                    #IMPLIED
               othertype
                          CDATA
                                    #IMPLIED
               job
                          CDATA
                                    #IMPLIED
               otherjob
                          CDATA
                                    #IMPLIED
               experiencelevel
                          CDATA
                                    #IMPLIED
               name
                          NMTOKEN
                                    #IMPLIED
               %univ-atts;" 
>
<!ELEMENT  audience %audience.content;>
<!ATTLIST  audience %audience.attributes;>


<!--                    LONG NAME: Keywords                        -->
<!ENTITY % keywords.content
              "(%indexterm; |
                %keyword;)*" 
>
<!ENTITY % keywords.attributes
              "%univ-atts;" 
>
<!ELEMENT  keywords %keywords.content;>
<!ATTLIST  keywords %keywords.attributes;>


<!--                    LONG NAME: Prodinfo                        -->
<!ENTITY % prodinfo.content
              "(%prodname;
                %vrmlist;
                (%brand; |
                 %component; |
                 %featnum; |
                 %platform; |
                 %prognum; |
                 %series;)*)" 
>
<!ENTITY % prodinfo.attributes
              "%univ-atts;" 
>
<!ELEMENT  prodinfo %prodinfo.content;>
<!ATTLIST  prodinfo %prodinfo.attributes;>


<!--                    LONG NAME: Prodname                        -->
<!ENTITY % prodname.content
              "(%words.cnt;)*" 
>
<!ENTITY % prodname.attributes
              "%univ-atts;" 
>
<!ELEMENT  prodname %prodname.content;>
<!ATTLIST  prodname %prodname.attributes;>


<!--                    LONG NAME: Vrmlist                         -->
<!ENTITY % vrmlist.content
              "(%vrm;)+" 
>
<!ENTITY % vrmlist.attributes
              "%univ-atts;" 
>
<!ELEMENT  vrmlist %vrmlist.content;>
<!ATTLIST  vrmlist %vrmlist.attributes;>


<!--                    LONG NAME: Vrm                             -->
<!ENTITY % vrm.content
              "EMPTY" 
>
<!ENTITY % vrm.attributes
              "version
                          CDATA
                                    #REQUIRED
               release
                          CDATA
                                    #IMPLIED
               modification
                          CDATA
                                    #IMPLIED
               %univ-atts;" 
>
<!ELEMENT  vrm %vrm.content;>
<!ATTLIST  vrm %vrm.attributes;>


<!--                    LONG NAME: Brand                           -->
<!ENTITY % brand.content
              "(%words.cnt;)*" 
>
<!ENTITY % brand.attributes
              "%univ-atts;" 
>
<!ELEMENT  brand %brand.content;>
<!ATTLIST  brand %brand.attributes;>


<!--                    LONG NAME: Series                          -->
<!ENTITY % series.content
              "(%words.cnt;)*" 
>
<!ENTITY % series.attributes
              "%univ-atts;" 
>
<!ELEMENT  series %series.content;>
<!ATTLIST  series %series.attributes;>


<!--                    LONG NAME: Platform                        -->
<!ENTITY % platform.content
              "(%words.cnt;)*" 
>
<!ENTITY % platform.attributes
              "%univ-atts;" 
>
<!ELEMENT  platform %platform.content;>
<!ATTLIST  platform %platform.attributes;>


<!--                    LONG NAME: Prognum                         -->
<!ENTITY % prognum.content
              "(%words.cnt;)*" 
>
<!ENTITY % prognum.attributes
              "%univ-atts;" 
>
<!ELEMENT  prognum %prognum.content;>
<!ATTLIST  prognum %prognum.attributes;>


<!--                    LONG NAME: Featnum                         -->
<!ENTITY % featnum.content
              "(%words.cnt;)*" 
>
<!ENTITY % featnum.attributes
              "%univ-atts;" 
>
<!ELEMENT  featnum %featnum.content;>
<!ATTLIST  featnum %featnum.attributes;>


<!--                    LONG NAME: Component                       -->
<!ENTITY % component.content
              "(%words.cnt;)*" 
>
<!ENTITY % component.attributes
              "%univ-atts;" 
>
<!ELEMENT  component %component.content;>
<!ATTLIST  component %component.attributes;>


<!--                    LONG NAME: Othermeta                       -->
<!ENTITY % othermeta.content
              "EMPTY" 
>
<!ENTITY % othermeta.attributes
              "name
                          CDATA
                                    #REQUIRED
               content
                          CDATA
                                    #REQUIRED
               translate-content
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    #IMPLIED
               %univ-atts;" 
>
<!ELEMENT  othermeta %othermeta.content;>
<!ATTLIST  othermeta %othermeta.attributes;>


<!--                    LONG NAME: Resourceid                      -->
<!ENTITY % resourceid.content
              "EMPTY" 
>
<!ENTITY % resourceid.attributes
              "%select-atts;
               %localization-atts;
               id
                          CDATA
                                    #REQUIRED
               %conref-atts;
               appname
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  resourceid %resourceid.content;>
<!ATTLIST  resourceid %resourceid.attributes;>



<!-- ============================================================= -->
<!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
<!-- ============================================================= -->
  
<!ATTLIST  author       %global-atts;  class CDATA "- topic/author "     >
<!ATTLIST  source       %global-atts;  class CDATA "- topic/source "     >
<!ATTLIST  publisher    %global-atts;  class CDATA "- topic/publisher "  >
<!ATTLIST  copyright    %global-atts;  class CDATA "- topic/copyright "  >
<!ATTLIST  copyryear    %global-atts;  class CDATA "- topic/copyryear "  >
<!ATTLIST  copyrholder  %global-atts;  class CDATA "- topic/copyrholder ">
<!ATTLIST  critdates    %global-atts;  class CDATA "- topic/critdates "  >
<!ATTLIST  created      %global-atts;  class CDATA "- topic/created "    >
<!ATTLIST  revised      %global-atts;  class CDATA "- topic/revised "    >
<!ATTLIST  permissions  %global-atts;  class CDATA "- topic/permissions ">
<!ATTLIST  category     %global-atts;  class CDATA "- topic/category "   >
<!ATTLIST  metadata     %global-atts;  class CDATA "- topic/metadata "   >
<!ATTLIST  audience     %global-atts;  class CDATA "- topic/audience "   >
<!ATTLIST  keywords     %global-atts;  class CDATA "- topic/keywords "   >
<!ATTLIST  prodinfo     %global-atts;  class CDATA "- topic/prodinfo "   >
<!ATTLIST  prodname     %global-atts;  class CDATA "- topic/prodname "   >
<!ATTLIST  vrmlist      %global-atts;  class CDATA "- topic/vrmlist "    >
<!ATTLIST  vrm          %global-atts;  class CDATA "- topic/vrm "        >
<!ATTLIST  brand        %global-atts;  class CDATA "- topic/brand "      >
<!ATTLIST  series       %global-atts;  class CDATA "- topic/series "     >
<!ATTLIST  platform     %global-atts;  class CDATA "- topic/platform "   >
<!ATTLIST  prognum      %global-atts;  class CDATA "- topic/prognum "    >
<!ATTLIST  featnum      %global-atts;  class CDATA "- topic/featnum "    >
<!ATTLIST  component    %global-atts;  class CDATA "- topic/component "  >
<!ATTLIST  othermeta    %global-atts;  class CDATA "- topic/othermeta "  >
<!ATTLIST  resourceid   %global-atts;  class CDATA "- topic/resourceid " >

<!-- ================== metaDeclMod ==================== -->
 