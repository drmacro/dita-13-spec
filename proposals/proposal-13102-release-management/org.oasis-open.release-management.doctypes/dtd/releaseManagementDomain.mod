<?xml version="1.0" encoding="UTF-8"?>
<!-- =============================================================
     DITA Release Management Metadata Domain
     
     Defines element types for capturing change details within
     topics or maps.
     
     Depends on the XNAL domain.
     
     DITA 1.3
     
     Copyright (c) 2013 OASIS Open
     
     ============================================================= -->

<!ENTITY % change-historylist       "change-historylist" >
<!ENTITY % change-item              "change-item" >
<!ENTITY % change-revisionid        "change-revisionid" >
<!ENTITY % change-request-reference "change-request-reference" >
<!ENTITY % change-started           "change-started" >
<!ENTITY % change-completed         "change-completed" >
<!ENTITY % change-summary           "change-summary" >
<!ENTITY % change-request-system    "change-request-system" >
<!ENTITY % change-request-id        "change-request-id" >

<!-- Long Name: Change History List -->

<!ENTITY % changehistory.data.atts
      '%univ-atts;
              datatype 
                        CDATA 
                                  #IMPLIED
              outputclass
                        CDATA 
                                  #IMPLIED
       '>

<!ENTITY % change-historylist.content 
  "(%change-item;)*
  "
>
<!ENTITY % change-historylist.attributes
      '%changehistory.data.atts;
      name 
          CDATA 
                    "change-historylist"
'
>
<!ELEMENT change-historylist %change-historylist.content; >
<!ATTLIST change-historylist %change-historylist.attributes;>

<!-- Long Name: Change Item 

     An individual release note. 

-->
<!ENTITY % change-item.content 
  "((%personinfo;|
     %organizationinfo;)*,
    %change-revisionid;?,
    %change-request-reference;?,
    %change-started;?,
    %change-completed;,
    %change-summary;?,
    %data;*) 
">
<!ENTITY % change-item.attributes
      '%changehistory.data.atts;
      name 
          CDATA 
                    "change-item"
'
>
<!ELEMENT change-item %change-item.content; >
<!ATTLIST change-item %change-item.attributes; >


<!-- Long Name: Revision ID 

     Specifies the revision ID to which the change applies.
     Revision IDs are normally specified within publication
     maps (e.g., Bookmap <revisionid> element).
     
      -->
<!ENTITY % change-revisionid.content 
  "(%data.cnt;)*" 
>
<!ENTITY % change-revisionid.attributes
      '%changehistory.data.atts;
      name 
          CDATA 
                    "change-revisionid"
'
>
<!ELEMENT change-revisionid %change-revisionid.content; >
<!ATTLIST change-revisionid %change-revisionid.attributes; >

<!-- Long Name: Change Request Reference

      Provides traceablity to an external change 
      request or other ticketing system; 
-->
<!ENTITY % change-request-reference.content 
  "(%change-request-system;?,
    %change-request-id;?)"
>
<!ENTITY % change-request-reference.attributes
      '%changehistory.data.atts;
      name 
          CDATA 
                    "change-request-reference"
'
>
<!ELEMENT change-request-reference %change-request-reference.content; >
<!ATTLIST change-request-reference %change-request-reference.attributes; >

<!-- Long Name; Change Request System 

     Some description of or identifier for the information system that
     manages or serves the referenced change request, for example,
     an issue tracking system.
     -->
<!ENTITY % change-request-system.content 
  "(%data.cnt;)*" 
>
<!ENTITY % change-request-system.attributes
      '%changehistory.data.atts;
      name 
          CDATA 
                    "change-request-system"
'
>
<!ELEMENT change-request-system %change-request-system.content; >
<!ATTLIST change-request-system %change-request-system.attributes; >

<!-- Long Name: Change request ID

     The identifier of the change request, such as an issue
     ID or ticket number.
     
  -->
<!ENTITY % change-request-id.content
  "(%data.cnt;)*" 
>
<!ENTITY % change-request-id.attributes
      '%changehistory.data.atts;
      name 
          CDATA 
                    "change-request-id"
'
>
<!ELEMENT change-request-id %change-request-id.content; >
<!ATTLIST change-request-id %change-request-id.attributes; >


<!-- Long Name: Change started date 

-->
<!ENTITY % change-started.content 
  "(#PCDATA | 
    text)*" 
>
<!ENTITY % change-started.attributes
      '%changehistory.data.atts;
      name 
          CDATA 
                    "change-started"
'
>
<!ELEMENT change-started %change-started.content; >
<!ATTLIST change-started %change-started.attributes; >

<!-- Long Name: Change completed date -->
<!ENTITY % change-completed.content 
  "(#PCDATA | 
    text)*" 
>
<!ENTITY % change-completed.attributes
      '%changehistory.data.atts;
      name 
          CDATA 
                    "change-completed"
'
>
<!ELEMENT change-completed %change-completed.content; >
<!ATTLIST change-completed %change-completed.attributes; >

<!-- Long Name: Change Summary 

     The portion of the release note that will/may appear in a document 
     
  -->
<!ENTITY % change-summary.content 
  "(%data.cnt;)*" 
>
<!ENTITY % change-summary.attributes
      '%changehistory.data.atts;
      name 
          CDATA 
                    "change-summary"
'
>
<!ELEMENT change-summary %change-summary.content; >
<!ATTLIST change-summary %change-summary.attributes; > 

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

<!ATTLIST change-historylist       %global-atts;  class CDATA "- topic/metadata rm-d/change-historylist ">
<!ATTLIST change-item              %global-atts;  class CDATA "- topic/data rm-d/change-item ">
<!ATTLIST change-revisionid        %global-atts;  class CDATA "- topic/data rm-d/change-revisionid ">
<!ATTLIST change-request-reference %global-atts;  class CDATA "- topic/data rm-d/change-request-reference ">
<!ATTLIST change-started           %global-atts;  class CDATA "- topic/data rm-d/change-started ">
<!ATTLIST change-completed         %global-atts;  class CDATA "- topic/data rm-d/change-completed ">
<!ATTLIST change-summary           %global-atts;  class CDATA "- topic/data rm-d/change-summary ">
<!ATTLIST change-request-system    %global-atts;  class CDATA "- topic/data rm-d/change-request-system ">
<!ATTLIST change-request-id        %global-atts;  class CDATA "- topic/data rm-d/change-request-id ">

<!-- ============== End of Release Management domain ======================= -->