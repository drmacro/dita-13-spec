<?xml version="1.0" encoding="UTF-8" ?>
<!-- ===========================================================
     HTML generation templates for the rubyDomain DITA domain.
     
     Copyright (c) 2012 OASIS Open
     
     =========================================================== -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="
    *[contains(@class, ' ruby-d/ruby ')] |
    *[contains(@class, ' ruby-d/rb ')]  |
    *[contains(@class, ' ruby-d/rp ')]  |
    *[contains(@class, ' ruby-d/rt ')] 
    " priority="10">
     <xsl:copy copy-namespaces="no"><xsl:apply-templates/></xsl:copy>
  </xsl:template>

  
</xsl:stylesheet>
