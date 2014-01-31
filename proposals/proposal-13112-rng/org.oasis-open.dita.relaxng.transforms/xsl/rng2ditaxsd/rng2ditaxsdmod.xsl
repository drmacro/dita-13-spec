<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:rng="http://relaxng.org/ns/structure/1.0"
  xmlns:rnga="http://relaxng.org/ns/compatibility/annotations/1.0"
  xmlns:rng2ditadtd="http://dita.org/rng2ditadtd"
  xmlns:relpath="http://dita2indesign/functions/relpath"
  xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
  xmlns:str="http://local/stringfunctions"
  xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/"
  xmlns:dita="http://dita.oasis-open.org/architecture/2005/"
  xmlns:rngfunc="http://dita.oasis-open.org/dita/rngfunctions"
  exclude-result-prefixes="xs xd rng rnga relpath a str ditaarch dita rngfunc"
  version="2.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Jan 31, 2014</xd:p>
      <xd:p><xd:b>Author:</xd:b> ekimber</xd:p>
      <xd:p></xd:p>
    </xd:desc>
  </xd:doc>
  
    <!-- ====================
       Mode header-comment
       ==================== -->

  <xsl:template match="dita:moduleDesc" mode="header-comment">
    <xsl:apply-templates select="dita:headerComment" mode="#current"/>
  </xsl:template>
  
  <xsl:template match="dita:headerComment" mode="header-comment">
    <!-- Note that the header comment is a single string with
         space preserved.
      -->
    <xsl:choose>
      <xsl:when test="$headerCommentStyle = 'comment-per-line'">
        <xsl:analyze-string select="." regex="^.+$" flags="m">
          <xsl:matching-substring>
            <xsl:comment><xsl:value-of select="str:pad(., 61)"/></xsl:comment>
            <xsl:text>&#x0a;</xsl:text>
          </xsl:matching-substring>
          <xsl:non-matching-substring>
            <xsl:if test="normalize-space(.) != ''">
              <xsl:comment><xsl:value-of 
                select="str:pad(., 61)"/></xsl:comment>
              <xsl:text>&#x0a;</xsl:text>
            </xsl:if>
          </xsl:non-matching-substring>
        </xsl:analyze-string>
      </xsl:when>
      <xsl:otherwise>
        <xsl:comment><xsl:value-of select="string(.)"/></xsl:comment>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  
</xsl:stylesheet>