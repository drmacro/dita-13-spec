<?xml version="1.0" encoding="UTF-8"?>

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % data-about  "data-about"                                  >
<!ENTITY % data        "data"                                        >
<!ENTITY % unknown     "unknown"                                     >
<!ENTITY % foreign     "foreign"                                     >
<!ENTITY % title       "title"                                       >
<!ENTITY % navtitle    "navtitle"                                    >
<!ENTITY % shortdesc   "shortdesc"                                   >
<!ENTITY % desc        "desc"                                        >
<!ENTITY % p           "p"                                           >
<!ENTITY % note        "note"                                        >
<!ENTITY % longquoteref "longquoteref"                                >
<!ENTITY % lq          "lq"                                          >
<!ENTITY % q           "q"                                           >
<!ENTITY % sl          "sl"                                          >
<!ENTITY % sli         "sli"                                         >
<!ENTITY % ul          "ul"                                          >
<!ENTITY % ol          "ol"                                          >
<!ENTITY % li          "li"                                          >
<!ENTITY % itemgroup   "itemgroup"                                   >
<!ENTITY % dl          "dl"                                          >
<!ENTITY % dlhead      "dlhead"                                      >
<!ENTITY % dthd        "dthd"                                        >
<!ENTITY % ddhd        "ddhd"                                        >
<!ENTITY % dlentry     "dlentry"                                     >
<!ENTITY % dt          "dt"                                          >
<!ENTITY % dd          "dd"                                          >
<!ENTITY % fig         "fig"                                         >
<!ENTITY % figgroup    "figgroup"                                    >
<!ENTITY % pre         "pre"                                         >
<!ENTITY % lines       "lines"                                       >
<!ENTITY % text        "text"                                        >
<!ENTITY % keyword     "keyword"                                     >
<!ENTITY % term        "term"                                        >
<!ENTITY % ph          "ph"                                          >
<!ENTITY % tm          "tm"                                          >
<!ENTITY % boolean     "boolean"                                     >
<!ENTITY % state       "state"                                       >
<!ENTITY % image       "image"                                       >
<!ENTITY % alt         "alt"                                         >
<!ENTITY % longdescref "longdescref"                                 >
<!ENTITY % object      "object"                                      >
<!ENTITY % param       "param"                                       >
<!ENTITY % simpletable "simpletable"                                 >
<!ENTITY % sthead      "sthead"                                      >
<!ENTITY % strow       "strow"                                       >
<!ENTITY % stentry     "stentry"                                     >
<!ENTITY % draft-comment "draft-comment"                               >
<!ENTITY % required-cleanup "required-cleanup"                            >
<!ENTITY % fn          "fn"                                          >
<!ENTITY % indexterm   "indexterm"                                   >
<!ENTITY % index-base  "index-base"                                  >
<!ENTITY % indextermref "indextermref"                                >
<!ENTITY % cite        "cite"                                        >
<!ENTITY % xref        "xref"                                        >

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->
  
<!ENTITY % basic.ph
              "%boolean; |
               %cite; |
               %keyword; |
               %ph; |
               %q; |
               %term; |
               %tm; |
               %xref; |
               %state;" 
>
<!ENTITY % basic.block
              "%dl; |
               %fig; |
               %image; |
               %lines; |
               %lq; |
               %note; |
               %object; |
               %ol; |
               %p; |
               %pre; |
               %simpletable; |
               %sl; |
               %table; |
               %ul;" 
>
<!ENTITY % basic.phandblock
              "%basic.block; |
               %basic.ph;" 
>
<!ENTITY % basic.ph.noxref
              "%boolean; |
               %keyword; |
               %ph; |
               %q; |
               %term; |
               %tm; |
               %state;" 
>
<!ENTITY % basic.ph.notm
              "%boolean; |
               %cite; |
               %keyword; |
               %ph; |
               %q; |
               %term; |
               %xref; |
               %state;" 
>
<!ENTITY % basic.block.notbl
              "%dl; |
               %fig; |
               %image; |
               %lines; |
               %lq; |
               %note; |
               %object; |
               %ol; |
               %p; |
               %pre; |
               %sl; |
               %ul;" 
>
<!ENTITY % basic.block.nonote
              "%dl; |
               %fig; |
               %image; |
               %lines; |
               %lq; |
               %object; |
               %ol; |
               %p; |
               %pre; |
               %simpletable; |
               %sl; |
               %table; |
               %ul;" 
>
<!ENTITY % basic.block.nopara
              "%dl; |
               %fig; |
               %image; |
               %lines; |
               %lq; |
               %note; |
               %object; |
               %ol; |
               %pre; |
               %simpletable; |
               %sl; |
               %table; |
               %ul;" 
>
<!ENTITY % basic.block.nolq
              "%dl; |
               %fig; |
               %image; |
               %lines; |
               %note; |
               %object; |
               %ol; |
               %p; |
               %pre; |
               %simpletable; |
               %sl; |
               %table; |
               %ul;" 
>
<!ENTITY % basic.block.notbnofg
              "%dl; |
               %image; |
               %lines; |
               %lq; |
               %note; |
               %object; |
               %ol; |
               %p; |
               %pre; |
               %sl; |
               %ul;" 
>
<!ENTITY % basic.block.notbfgobj
              "%dl; |
               %image; |
               %lines; |
               %lq; |
               %note; |
               %ol; |
               %p; |
               %pre; |
               %sl; |
               %ul;" 
>
<!ENTITY % txt.incl
              "%draft-comment; |
               %fn; |
               %indextermref; |
               %indexterm; |
               %required-cleanup;" 
>
<!ENTITY % data.elements.incl
              "%data; |
               %data-about;" 
>
<!ENTITY % foreign.unknown.incl
              "%foreign; |
               %unknown;" 
>
<!ENTITY % listitem.cnt
              "#PCDATA |
               %basic.block; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %itemgroup; |
               %txt.incl;" 
>
<!ENTITY % itemgroup.cnt
              "#PCDATA |
               %basic.block; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %txt.incl;" 
>
<!ENTITY % title.cnt
              "#PCDATA |
               %basic.ph.noxref; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %image;" 
>
<!ENTITY % xreftext.cnt
              "#PCDATA |
               %basic.ph.noxref; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %image;" 
>
<!ENTITY % xrefph.cnt
              "#PCDATA |
               %basic.ph.noxref; |
               %data.elements.incl; |
               %foreign.unknown.incl;" 
>
<!ENTITY % shortquote.cnt
              "#PCDATA |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl;" 
>
<!ENTITY % para.cnt
              "#PCDATA |
               %basic.block.nopara; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %txt.incl;" 
>
<!ENTITY % note.cnt
              "#PCDATA |
               %basic.block.nonote; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %txt.incl;" 
>
<!ENTITY % longquote.cnt
              "#PCDATA |
               %basic.block.nolq; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %longquoteref; |
               %txt.incl;" 
>
<!ENTITY % tblcell.cnt
              "#PCDATA |
               %basic.block.notbl; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %txt.incl;" 
>
<!ENTITY % desc.cnt
              "#PCDATA |
               %basic.block.notbfgobj; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl;" 
>
<!ENTITY % ph.cnt
              "#PCDATA |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %image; |
               %txt.incl;" 
>
<!ENTITY % fn.cnt
              "#PCDATA |
               %basic.block.notbl; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl;" 
>
<!ENTITY % term.cnt
              "#PCDATA |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %image;" 
>
<!ENTITY % defn.cnt
              "#PCDATA |
               %basic.block; |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %itemgroup; |
               %txt.incl;" 
>
<!ENTITY % pre.cnt
              "#PCDATA |
               %basic.ph; |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %txt.incl;" 
>
<!ENTITY % fig.cnt
              "%basic.block.notbnofg; |
               %data.elements.incl; |
               %fn; |
               %foreign.unknown.incl; |
               %simpletable; |
               %xref;" 
>
<!ENTITY % figgroup.cnt
              "%basic.block.notbnofg; |
               %basic.ph; |
               %data.elements.incl; |
               %fn; |
               %foreign.unknown.incl;" 
>
<!ENTITY % words.cnt
              "#PCDATA |
               %data.elements.incl; |
               %foreign.unknown.incl; |
               %keyword; |
               %term;" 
>
<!ENTITY % data.cnt
              "%words.cnt; |
               %image; |
               %object; |
               %ph; |
               %title;" 
>
<!ENTITY % display-atts
              "scale
                          (50 |
                           60 |
                           70 |
                           80 |
                           90 |
                           100 |
                           110 |
                           120 |
                           140 |
                           160 |
                           180 |
                           200 |
                           -dita-use-conref-target)
                                    #IMPLIED
               frame
                          (all |
                           bottom |
                           none |
                           sides |
                           top |
                           topbot |
                           -dita-use-conref-target)
                                    #IMPLIED
               expanse
                          (column |
                           page |
                           spread |
                           textline |
                           -dita-use-conref-target)
                                    #IMPLIED
" 
>
<!ENTITY % props-attribute-extensions
              "" 
>
<!ENTITY % base-attribute-extensions
              "" 
>
<!ENTITY % filter-atts
              "props
                          CDATA
                                    #IMPLIED
               platform
                          CDATA
                                    #IMPLIED
               product
                          CDATA
                                    #IMPLIED
               audience
                          CDATA
                                    #IMPLIED
               otherprops
                          CDATA
                                    #IMPLIED
               %props-attribute-extensions;" 
>
<!ENTITY % select-atts
              "%filter-atts;
               base
                          CDATA
                                    #IMPLIED
               %base-attribute-extensions;
               importance
                          (default |
                           deprecated |
                           high |
                           low |
                           normal |
                           obsolete |
                           optional |
                           recommended |
                           required |
                           urgent |
                           -dita-use-conref-target)
                                    #IMPLIED
               rev
                          CDATA
                                    #IMPLIED
               status
                          (changed |
                           deleted |
                           new |
                           unchanged |
                           -dita-use-conref-target)
                                    #IMPLIED
" 
>
<!ENTITY % conref-atts
              "conref
                          CDATA
                                    #IMPLIED
               conrefend
                          CDATA
                                    #IMPLIED
               conaction
                          (mark |
                           pushafter |
                           pushbefore |
                           pushreplace |
                           -dita-use-conref-target)
                                    #IMPLIED
               conkeyref
                          CDATA
                                    #IMPLIED
" 
>
<!ENTITY % id-atts
              "id
                          NMTOKEN
                                    #IMPLIED
               %conref-atts;" 
>
<!ENTITY % localization-atts
              "translate
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    #IMPLIED
               xml:lang
                          CDATA
                                    #IMPLIED
               dir
                          (lro |
                           ltr |
                           rlo |
                           rtl |
                           -dita-use-conref-target)
                                    #IMPLIED
" 
>
<!ENTITY % localization-atts-translate-no
              "translate
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    'no'
               xml:lang
                          CDATA
                                    #IMPLIED
               dir
                          (lro |
                           ltr |
                           rlo |
                           rtl |
                           -dita-use-conref-target)
                                    #IMPLIED
" 
>
<!ENTITY % univ-atts
              "(%id-atts;
                %select-atts;
                %localization-atts;)" 
>
<!ENTITY % univ-atts-translate-no
              "(%id-atts;
                %select-atts;
                %localization-atts-translate-no;)" 
>
<!ENTITY % global-atts
              "xtrc
                          CDATA
                                    #IMPLIED
               xtrf
                          CDATA
                                    #IMPLIED
" 
>
<!--                    LONG NAME: Data About                      -->
<!ENTITY % data-about.content
              "(%data;
                (%data; |
                 %data-about;)*)" 
>
<!ENTITY % data-about.attributes
              "%univ-atts;
               href
                          CDATA
                                    #IMPLIED
               keyref
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
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  data-about %data-about.content;>
<!ATTLIST  data-about %data-about.attributes;>


<!ENTITY % data-element-atts
              "%univ-atts;
               name
                          CDATA
                                    #IMPLIED
               datatype
                          CDATA
                                    #IMPLIED
               value
                          CDATA
                                    #IMPLIED
               href
                          CDATA
                                    #IMPLIED
               keyref
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
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!--                    LONG NAME: Data                            -->
<!ENTITY % data.content
              "(%data.cnt;)*" 
>
<!ENTITY % data.attributes
              "%data-element-atts;" 
>
<!ELEMENT  data %data.content;>
<!ATTLIST  data %data.attributes;>


<!--                    LONG NAME: Unknown                         -->
<!ENTITY % unknown.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ATTLIST  unknown %unknown.attributes;>


<!--                    LONG NAME: Foreign                         -->
<!ENTITY % foreign.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ATTLIST  foreign %foreign.attributes;>


<!--                    LONG NAME: Title                           -->
<!ENTITY % title.content
              "(%title.cnt;)*" 
>
<!ENTITY % title.attributes
              "%id-atts;
               %localization-atts;
               base
                          CDATA
                                    #IMPLIED
               %base-attribute-extensions;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  title %title.content;>
<!ATTLIST  title %title.attributes;>


<!--                    LONG NAME: Navtitle                        -->
<!ENTITY % navtitle.content
              "(%words.cnt; |
                %ph;)*" 
>
<!ENTITY % navtitle.attributes
              "%univ-atts;" 
>
<!ELEMENT  navtitle %navtitle.content;>
<!ATTLIST  navtitle %navtitle.attributes;>


<!--                    LONG NAME: Shortdesc                       -->
<!ENTITY % shortdesc.content
              "(%title.cnt; |
                %draft-comment;)*" 
>
<!ENTITY % shortdesc.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  shortdesc %shortdesc.content;>
<!ATTLIST  shortdesc %shortdesc.attributes;>


<!--                    LONG NAME: Desc                            -->
<!ENTITY % desc.content
              "(%desc.cnt;)*" 
>
<!ENTITY % desc.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  desc %desc.content;>
<!ATTLIST  desc %desc.attributes;>


<!--                    LONG NAME: P                               -->
<!ENTITY % p.content
              "(%para.cnt;)*" 
>
<!ENTITY % p.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  p %p.content;>
<!ATTLIST  p %p.attributes;>


<!--                    LONG NAME: Note                            -->
<!ENTITY % note.content
              "(%note.cnt;)*" 
>
<!ENTITY % note.attributes
              "type
                          (attention |
                           caution |
                           danger |
                           fastpath |
                           important |
                           note |
                           notice |
                           other |
                           remember |
                           restriction |
                           tip |
                           warning |
                           -dita-use-conref-target)
                                    #IMPLIED
               spectitle
                          CDATA
                                    #IMPLIED
               othertype
                          CDATA
                                    #IMPLIED
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  note %note.content;>
<!ATTLIST  note %note.attributes;>


<!--                    LONG NAME: Longquoteref                    -->
<!ENTITY % longquoteref.content
              "EMPTY" 
>
<!ENTITY % longquoteref.attributes
              "href
                          CDATA
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED
               type
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
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  longquoteref %longquoteref.content;>
<!ATTLIST  longquoteref %longquoteref.attributes;>


<!--                    LONG NAME: Lq                              -->
<!ENTITY % lq.content
              "(%longquote.cnt;)*" 
>
<!ENTITY % lq.attributes
              "href
                          CDATA
                                    #IMPLIED
               keyref
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
               reftitle
                          CDATA
                                    #IMPLIED
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  lq %lq.content;>
<!ATTLIST  lq %lq.attributes;>


<!--                    LONG NAME: Q                               -->
<!ENTITY % q.content
              "(%shortquote.cnt;)*" 
>
<!ENTITY % q.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  q %q.content;>
<!ATTLIST  q %q.attributes;>


<!--                    LONG NAME: Sl                              -->
<!ENTITY % sl.content
              "(%sli;)+" 
>
<!ENTITY % sl.attributes
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
                                    #IMPLIED
" 
>
<!ELEMENT  sl %sl.content;>
<!ATTLIST  sl %sl.attributes;>


<!--                    LONG NAME: Sli                             -->
<!ENTITY % sli.content
              "(%ph.cnt;)*" 
>
<!ENTITY % sli.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  sli %sli.content;>
<!ATTLIST  sli %sli.attributes;>


<!--                    LONG NAME: Ul                              -->
<!ENTITY % ul.content
              "(%li;)+" 
>
<!ENTITY % ul.attributes
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
                                    #IMPLIED
" 
>
<!ELEMENT  ul %ul.content;>
<!ATTLIST  ul %ul.attributes;>


<!--                    LONG NAME: Ol                              -->
<!ENTITY % ol.content
              "(%li;)+" 
>
<!ENTITY % ol.attributes
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
                                    #IMPLIED
" 
>
<!ELEMENT  ol %ol.content;>
<!ATTLIST  ol %ol.attributes;>


<!--                    LONG NAME: Li                              -->
<!ENTITY % li.content
              "(%listitem.cnt;)*" 
>
<!ENTITY % li.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  li %li.content;>
<!ATTLIST  li %li.attributes;>


<!--                    LONG NAME: Itemgroup                       -->
<!ENTITY % itemgroup.content
              "(%itemgroup.cnt;)*" 
>
<!ENTITY % itemgroup.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  itemgroup %itemgroup.content;>
<!ATTLIST  itemgroup %itemgroup.attributes;>


<!--                    LONG NAME: Dl                              -->
<!ENTITY % dl.content
              "((%dlhead;)?,
                (%dlentry;)+)" 
>
<!ENTITY % dl.attributes
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
                                    #IMPLIED
" 
>
<!ELEMENT  dl %dl.content;>
<!ATTLIST  dl %dl.attributes;>


<!--                    LONG NAME: Dlhead                          -->
<!ENTITY % dlhead.content
              "((%dthd;)?,
                (%ddhd;)?)" 
>
<!ENTITY % dlhead.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  dlhead %dlhead.content;>
<!ATTLIST  dlhead %dlhead.attributes;>


<!--                    LONG NAME: Dthd                            -->
<!ENTITY % dthd.content
              "(%title.cnt;)*" 
>
<!ENTITY % dthd.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  dthd %dthd.content;>
<!ATTLIST  dthd %dthd.attributes;>


<!--                    LONG NAME: Ddhd                            -->
<!ENTITY % ddhd.content
              "(%title.cnt;)*" 
>
<!ENTITY % ddhd.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  ddhd %ddhd.content;>
<!ATTLIST  ddhd %ddhd.attributes;>


<!--                    LONG NAME: Dlentry                         -->
<!ENTITY % dlentry.content
              "((%dt;)+,
                (%dd;)+)" 
>
<!ENTITY % dlentry.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  dlentry %dlentry.content;>
<!ATTLIST  dlentry %dlentry.attributes;>


<!--                    LONG NAME: Dt                              -->
<!ENTITY % dt.content
              "(%term.cnt;)*" 
>
<!ENTITY % dt.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  dt %dt.content;>
<!ATTLIST  dt %dt.attributes;>


<!--                    LONG NAME: Dd                              -->
<!ENTITY % dd.content
              "(%defn.cnt;)*" 
>
<!ENTITY % dd.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  dd %dd.content;>
<!ATTLIST  dd %dd.attributes;>


<!--                    LONG NAME: Fig                             -->
<!ENTITY % fig.content
              "((%title;)?,
                (%desc;)?,
                (%figgroup; |
                 %fig.cnt;)*)" 
>
<!ENTITY % fig.attributes
              "%display-atts;
               spectitle
                          CDATA
                                    #IMPLIED
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  fig %fig.content;>
<!ATTLIST  fig %fig.attributes;>


<!--                    LONG NAME: Figgroup                        -->
<!ENTITY % figgroup.content
              "((%title;)?,
                (%figgroup; |
                 %figgroup.cnt;)*)" 
>
<!ENTITY % figgroup.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  figgroup %figgroup.content;>
<!ATTLIST  figgroup %figgroup.attributes;>


<!--                    LONG NAME: Pre                             -->
<!ENTITY % pre.content
              "(%pre.cnt;)*" 
>
<!ENTITY % pre.attributes
              "%display-atts;
               spectitle
                          CDATA
                                    #IMPLIED
               xml:space
                          (preserve)
                                    #FIXED 
                                    'preserve'
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  pre %pre.content;>
<!ATTLIST  pre %pre.attributes;>


<!--                    LONG NAME: Lines                           -->
<!ENTITY % lines.content
              "(%pre.cnt;)*" 
>
<!ENTITY % lines.attributes
              "%display-atts;
               spectitle
                          CDATA
                                    #IMPLIED
               xml:space
                          (preserve)
                                    #FIXED 
                                    'preserve'
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  lines %lines.content;>
<!ATTLIST  lines %lines.attributes;>


<!--                    LONG NAME: Text                            -->
<!ENTITY % text.content
              "(#PCDATA |
                %text;)*" 
>
<!ENTITY % text.attributes
              "%univ-atts;" 
>
<!ELEMENT  text %text.content;>
<!ATTLIST  text %text.attributes;>


<!--                    LONG NAME: Keyword                         -->
<!ENTITY % keyword.content
              "(#PCDATA |
                %text; |
                %tm;)*" 
>
<!ENTITY % keyword.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  keyword %keyword.content;>
<!ATTLIST  keyword %keyword.attributes;>


<!--                    LONG NAME: Term                            -->
<!ENTITY % term.content
              "(#PCDATA |
                %text; |
                %tm;)*" 
>
<!ENTITY % term.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  term %term.content;>
<!ATTLIST  term %term.attributes;>


<!--                    LONG NAME: Ph                              -->
<!ENTITY % ph.content
              "(%ph.cnt; |
                %text;)*" 
>
<!ENTITY % ph.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  ph %ph.content;>
<!ATTLIST  ph %ph.attributes;>


<!--                    LONG NAME: Tm                              -->
<!ENTITY % tm.content
              "(#PCDATA |
                %text; |
                %tm;)*" 
>
<!ENTITY % tm.attributes
              "trademark
                          CDATA
                                    #IMPLIED
               tmowner
                          CDATA
                                    #IMPLIED
               tmtype
                                                      (reg |
                           service |
                           tm |
                           -dita-use-conref-target)
                                    #REQUIRED
               tmclass
                          CDATA
                                    #IMPLIED
               %univ-atts;" 
>
<!ELEMENT  tm %tm.content;>
<!ATTLIST  tm %tm.attributes;>


<!--                    LONG NAME: Boolean                         -->
<!ENTITY % boolean.content
              "EMPTY" 
>
<!ENTITY % boolean.attributes
              "state
                          (no |
                           yes |
                           -dita-use-conref-target)
                                    #REQUIRED
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  boolean %boolean.content;>
<!ATTLIST  boolean %boolean.attributes;>


<!--                    LONG NAME: State                           -->
<!ENTITY % state.content
              "EMPTY" 
>
<!ENTITY % state.attributes
              "name
                          CDATA
                                    #REQUIRED
               value
                          CDATA
                                    #REQUIRED
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  state %state.content;>
<!ATTLIST  state %state.attributes;>


<!--                    LONG NAME: Image                           -->
<!ENTITY % image.content
              "((%alt;)?,
                (%longdescref;)?)" 
>
<!ENTITY % image.attributes
              "href
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
               alt
                          CDATA
                                    #IMPLIED
               longdescref
                          CDATA
                                    #IMPLIED
               height
                          NMTOKEN
                                    #IMPLIED
               width
                          NMTOKEN
                                    #IMPLIED
               align
                          CDATA
                                    #IMPLIED
               scale
                          NMTOKEN
                                    #IMPLIED
               scalefit
                          (yes |
                           no |
                           -dita-use-conref-target)
                                    #IMPLIED
               placement
                          (break |
                           inline |
                           -dita-use-conref-target)
                                    'inline'
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  image %image.content;>
<!ATTLIST  image %image.attributes;>


<!--                    LONG NAME: Alt                             -->
<!ENTITY % alt.content
              "(%words.cnt; |
                %ph;)*" 
>
<!ENTITY % alt.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  alt %alt.content;>
<!ATTLIST  alt %alt.attributes;>


<!--                    LONG NAME: Longdescref                     -->
<!ENTITY % longdescref.content
              "EMPTY" 
>
<!ENTITY % longdescref.attributes
              "href
                          CDATA
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED
               type
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
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  longdescref %longdescref.content;>
<!ATTLIST  longdescref %longdescref.attributes;>


<!--                    LONG NAME: Object                          -->
<!ENTITY % object.content
              "((%desc;)?,
                (%longdescref;)?,
                (%param;)*,
                (%foreign.unknown.incl;)*)" 
>
<!ENTITY % object.attributes
              "declare
                          (declare)
                                    #IMPLIED
               classid
                          CDATA
                                    #IMPLIED
               codebase
                          CDATA
                                    #IMPLIED
               data
                          CDATA
                                    #IMPLIED
               type
                          CDATA
                                    #IMPLIED
               codetype
                          CDATA
                                    #IMPLIED
               archive
                          CDATA
                                    #IMPLIED
               standby
                          CDATA
                                    #IMPLIED
               height
                          NMTOKEN
                                    #IMPLIED
               width
                          NMTOKEN
                                    #IMPLIED
               usemap
                          CDATA
                                    #IMPLIED
               name
                          CDATA
                                    #IMPLIED
               tabindex
                          NMTOKEN
                                    #IMPLIED
               longdescref
                          CDATA
                                    #IMPLIED
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
               longdescre
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  object %object.content;>
<!ATTLIST  object %object.attributes;>


<!--                    LONG NAME: Param                           -->
<!ENTITY % param.content
              "EMPTY" 
>
<!ENTITY % param.attributes
              "%univ-atts;
               name
                          CDATA
                                    #REQUIRED
               value
                          CDATA
                                    #IMPLIED
               valuetype
                          (data |
                           object |
                           ref |
                           -dita-use-conref-target)
                                    #IMPLIED
               type
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  param %param.content;>
<!ATTLIST  param %param.attributes;>


<!--                    LONG NAME: Simpletable                     -->
<!ENTITY % simpletable.content
              "((%sthead;)?,
                (%strow;)+)" 
>
<!ENTITY % simpletable.attributes
              "relcolwidth
                          CDATA
                                    #IMPLIED
               keycol
                          NMTOKEN
                                    #IMPLIED
               refcols
                          NMTOKENS
                                    #IMPLIED
               %display-atts;
               spectitle
                          CDATA
                                    #IMPLIED
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  simpletable %simpletable.content;>
<!ATTLIST  simpletable %simpletable.attributes;>


<!--                    LONG NAME: Sthead                          -->
<!ENTITY % sthead.content
              "(%stentry;)+" 
>
<!ENTITY % sthead.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  sthead %sthead.content;>
<!ATTLIST  sthead %sthead.attributes;>


<!--                    LONG NAME: Strow                           -->
<!ENTITY % strow.content
              "(%stentry;)*" 
>
<!ENTITY % strow.attributes
              "%univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  strow %strow.content;>
<!ATTLIST  strow %strow.attributes;>


<!--                    LONG NAME: Stentry                         -->
<!ENTITY % stentry.content
              "(%tblcell.cnt;)*" 
>
<!ENTITY % stentry.attributes
              "specentry
                          CDATA
                                    #IMPLIED
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  stentry %stentry.content;>
<!ATTLIST  stentry %stentry.attributes;>


<!--                    LONG NAME: Draft-comment                   -->
<!ENTITY % draft-comment.content
              "(#PCDATA |
                %basic.phandblock; |
                %data.elements.incl; |
                %foreign.unknown.incl;)*" 
>
<!ENTITY % draft-comment.attributes
              "author
                          CDATA
                                    #IMPLIED
               time
                          CDATA
                                    #IMPLIED
               disposition
                          CDATA
                                    #IMPLIED
               %univ-atts-translate-no;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  draft-comment %draft-comment.content;>
<!ATTLIST  draft-comment %draft-comment.attributes;>


<!--                    LONG NAME: Required-cleanup                -->
<!ENTITY % required-cleanup.attributes
              "remap
                          CDATA
                                    #IMPLIED
               %univ-atts-translate-no;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ATTLIST  required-cleanup %required-cleanup.attributes;>


<!--                    LONG NAME: Fn                              -->
<!ENTITY % fn.content
              "(%fn.cnt;)*" 
>
<!ENTITY % fn.attributes
              "callout
                          CDATA
                                    #IMPLIED
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  fn %fn.content;>
<!ATTLIST  fn %fn.attributes;>


<!--                    LONG NAME: Indexterm                       -->
<!ENTITY % indexterm.content
              "(%words.cnt; |
                %ph; |
                %indexterm; |
                %index-base;)*" 
>
<!ENTITY % indexterm.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               start
                          CDATA
                                    #IMPLIED
               end
                          CDATA
                                    #IMPLIED
               %univ-atts;" 
>
<!ELEMENT  indexterm %indexterm.content;>
<!ATTLIST  indexterm %indexterm.attributes;>


<!--                    LONG NAME: Index-base                      -->
<!ENTITY % index-base.content
              "(%words.cnt; |
                %indexterm;)*" 
>
<!ENTITY % index-base.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               %univ-atts;" 
>
<!ELEMENT  index-base %index-base.content;>
<!ATTLIST  index-base %index-base.attributes;>


<!--                    LONG NAME: Indextermref                    -->
<!ENTITY % indextermref.content
              "EMPTY" 
>
<!ENTITY % indextermref.attributes
              "keyref
                          CDATA
                                    #REQUIRED
               %univ-atts;" 
>
<!ELEMENT  indextermref %indextermref.content;>
<!ATTLIST  indextermref %indextermref.attributes;>


<!--                    LONG NAME: Cite                            -->
<!ENTITY % cite.content
              "(%xrefph.cnt;)*" 
>
<!ENTITY % cite.attributes
              "keyref
                          CDATA
                                    #IMPLIED
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  cite %cite.content;>
<!ATTLIST  cite %cite.attributes;>


<!--                    LONG NAME: Xref                            -->
<!ENTITY % xref.content
              "(%xreftext.cnt; |
                %desc;)*" 
>
<!ENTITY % xref.attributes
              "href
                          CDATA
                                    #IMPLIED
               keyref
                          CDATA
                                    #IMPLIED
               type
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
               %univ-atts;
               outputclass
                          CDATA
                                    #IMPLIED
" 
>
<!ELEMENT  xref %xref.content;>
<!ATTLIST  xref %xref.attributes;>



<!-- ============================================================= -->
<!--             SPECIALIZATION ATTRIBUTE DECLARATIONS             -->
<!-- ============================================================= -->
  
<!ATTLIST  alt          %global-atts;  class CDATA "- topic/alt "        >
<!ATTLIST  boolean      %global-atts;  class CDATA "- topic/boolean "    >
<!ATTLIST  cite         %global-atts;  class CDATA "- topic/cite "       >
<!ATTLIST  dd           %global-atts;  class CDATA "- topic/dd "         >
<!ATTLIST  data         %global-atts;  class CDATA "- topic/data "       >
<!ATTLIST  data-about   %global-atts;  class CDATA "- topic/data-about " >
<!ATTLIST  ddhd         %global-atts;  class CDATA "- topic/ddhd "       >
<!ATTLIST  desc         %global-atts;  class CDATA "- topic/desc "       >
<!ATTLIST  dl           %global-atts;  class CDATA "- topic/dl "         >
<!ATTLIST  dlentry      %global-atts;  class CDATA "- topic/dlentry "    >
<!ATTLIST  dlhead       %global-atts;  class CDATA "- topic/dlhead "     >
<!ATTLIST  draft-comment %global-atts;  class CDATA "- topic/draft-comment ">
<!ATTLIST  dt           %global-atts;  class CDATA "- topic/dt "         >
<!ATTLIST  dthd         %global-atts;  class CDATA "- topic/dthd "       >
<!ATTLIST  fig          %global-atts;  class CDATA "- topic/fig "        >
<!ATTLIST  figgroup     %global-atts;  class CDATA "- topic/figgroup "   >
<!ATTLIST  fn           %global-atts;  class CDATA "- topic/fn "         >
<!ATTLIST  foreign      %global-atts;  class CDATA "- topic/foreign "    >
<!ATTLIST  image        %global-atts;  class CDATA "- topic/image "      >
<!ATTLIST  indexterm    %global-atts;  class CDATA "- topic/indexterm "  >
<!ATTLIST  index-base   %global-atts;  class CDATA "- topic/index-base " >
<!ATTLIST  indextermref %global-atts;  class CDATA "- topic/indextermref ">
<!ATTLIST  itemgroup    %global-atts;  class CDATA "- topic/itemgroup "  >
<!ATTLIST  keyword      %global-atts;  class CDATA "- topic/keyword "    >
<!ATTLIST  li           %global-atts;  class CDATA "- topic/li "         >
<!ATTLIST  lines        %global-atts;  class CDATA "- topic/lines "      >
<!ATTLIST  longdescref  %global-atts;  class CDATA "- topic/longdescref ">
<!ATTLIST  longquoteref %global-atts;  class CDATA "- topic/longquoteref ">
<!ATTLIST  lq           %global-atts;  class CDATA "- topic/lq "         >
<!ATTLIST  navtitle     %global-atts;  class CDATA "- topic/navtitle "   >
<!ATTLIST  note         %global-atts;  class CDATA "- topic/note "       >
<!ATTLIST  object       %global-atts;  class CDATA "- topic/object "     >
<!ATTLIST  ol           %global-atts;  class CDATA "- topic/ol "         >
<!ATTLIST  p            %global-atts;  class CDATA "- topic/p "          >
<!ATTLIST  param        %global-atts;  class CDATA "- topic/param "      >
<!ATTLIST  ph           %global-atts;  class CDATA "- topic/ph "         >
<!ATTLIST  pre          %global-atts;  class CDATA "- topic/pre "        >
<!ATTLIST  q            %global-atts;  class CDATA "- topic/q "          >
<!ATTLIST  required-cleanup %global-atts;  class CDATA "- topic/required-cleanup ">
<!ATTLIST  simpletable  %global-atts;  class CDATA "- topic/simpletable ">
<!ATTLIST  sl           %global-atts;  class CDATA "- topic/sl "         >
<!ATTLIST  sli          %global-atts;  class CDATA "- topic/sli "        >
<!ATTLIST  state        %global-atts;  class CDATA "- topic/state "      >
<!ATTLIST  stentry      %global-atts;  class CDATA "- topic/stentry "    >
<!ATTLIST  sthead       %global-atts;  class CDATA "- topic/sthead "     >
<!ATTLIST  strow        %global-atts;  class CDATA "- topic/strow "      >
<!ATTLIST  term         %global-atts;  class CDATA "- topic/term "       >
<!ATTLIST  text         %global-atts;  class CDATA "- topic/text "       >
<!ATTLIST  title        %global-atts;  class CDATA "- topic/title "      >
<!ATTLIST  tm           %global-atts;  class CDATA "- topic/tm "         >
<!ATTLIST  ul           %global-atts;  class CDATA "- topic/ul "         >
<!ATTLIST  unknown      %global-atts;  class CDATA "- topic/unknown "    >
<!ATTLIST  xref         %global-atts;  class CDATA "- topic/xref "       >

<!-- ================== commonElementsMod ==================== -->
 