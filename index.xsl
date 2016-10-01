<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<xsl:character-map name="angle-brackets">
    <xsl:output-character character="&lt;" string="&lt;"/>
    <xsl:output-character character="&gt;" string="&gt;"/>
</xsl:character-map>

<xsl:template match="/">
  <html>
  <head>
    <script type="text/x-mathjax-config">
      MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});
    </script>  
    <script type="text/javascript" async="async" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML" />
    <style>
        table {
            border:1px solid green;
            border-collapse:collapse;
        }
        .upborder
        {
            border-top:1px solid green;
        }
        .noborder {
            border:none;
        }
        .subitem {
            background-color:#ccc;
        }
        th {
            text-align:left;
        }
    </style>
  </head>
  <body>
  <h2>Покажчик</h2>
  <table cellspacing="0">
    <tr bgcolor="#9acd32">
      <th colspan="2">Елемент</th>
      <th>Сторінки</th>
	  <th>Пропонований<br />переклад</th>
	  <th>Обговорення</th>
    </tr>
    <xsl:for-each select="index/item">
    <tr class="upborder">
      <td colspan="2" width="30%"><xsl:value-of select="@value"/></td>
	  <td>
        <xsl:apply-templates select="./pages"/>
	  </td>
      <td><xsl:value-of select="@translation"/></td>
      <td><xsl:apply-templates select="@link"/></td>
    </tr>
      <xsl:for-each select="./subitem">
        <tr class="subitem">
          <td class="noborder">---</td>
          <td><xsl:value-of select="@value"/></td>
          <td>
          <xsl:apply-templates/>
          </td>
          <td><xsl:value-of select="@translation"/></td>
          <td><xsl:apply-templates select="@link"/></td>
        </tr>
      </xsl:for-each>
    </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>

<xsl:template match="@link">
  <xsl:choose>
    <xsl:when test="@link != ''">
      <xsl:variable name="link" select="@link"/>
        <a href="{$link}">на форум</a>
      </xsl:when>
    <xsl:otherwise>
      <a href="http://r2u.org.ua/forum/posting.php?mode=post&amp;f=51">нове</a>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="pages/*">
            <xsl:choose>
              <xsl:when test="name(.) = 'single'">
                <xsl:value-of select="@value"/><br />
              </xsl:when>
              <xsl:when test="name(.) = 'range'">
                <xsl:value-of select="@start"/>--<xsl:value-of select="@end"/><br />
              </xsl:when>
            </xsl:choose>
</xsl:template>

</xsl:stylesheet>