<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

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
    </tr>
      <xsl:for-each select="./subitem">
        <tr class="subitem">
          <td class="noborder">---</td>
          <td><xsl:value-of select="@value"/></td>
          <td>
          <xsl:apply-templates/>
          </td>
        </tr>
      </xsl:for-each>
    </xsl:for-each>
  </table>
  </body>
  </html>
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