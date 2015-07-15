<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  id="stylesheet"
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom"
  xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">

  <xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" />
  <xsl:template match="/">
    <html>
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <style>
        /*Styles go here*/
      </style>
    </head>
    <body>
      <!-- Henry listens -->
      <h1><xsl:value-of select="rss/channel/title" /></h1>

      <!-- Henrylistens description -->
      <p><xsl:value-of select="rss/channel/description" /></p>

      <p>Subscribe to this podcast in iTunes or the app of your choice.</p>

      <p>Copy and paste this URL:</p>

      <!-- Copy-paste URL -->
      <p>
        <input type="text" id="input">
          <xsl:attribute name="value">
            <xsl:value-of select="rss/channel/link" />
          </xsl:attribute>
        </input>
        <script> var input = document.getElementById('input'); var focused = false; if (input) { input.onblur = function() { focused = false; }; input.onclick = function() { if (!focused) { focused = true; input.select(); } }; } </script>
      </p>

      <!-- Logo -->
      <img title="logo">
        <xsl:attribute name="src">
          <xsl:value-of select="rss/channel/image/url"/>
        </xsl:attribute>
      </img>

      <!-- Description -->
      <p><xsl:value-of select="rss/channel/description"/></p>

      <div>
        <h2>Episodes</h2>
        <ul>
          <!-- Loop over items -->
          <xsl:for-each select="rss/channel/item">
            <li>
              <!-- Episode thumbnail? -->

              <!-- Episode title -->
              <h3>
                <xsl:value-of select="title"/>
              </h3>

              <!-- Episode description -->
              <p><xsl:value-of select="description"/></p>

              <!-- Link to download -->
              <p><a>
                <xsl:attribute name="href">
                  <xsl:value-of select="enclosure/@url"/>
                </xsl:attribute> Download audio
              </a></p>

              <!-- Link to episode -->
              <p><a>
                <xsl:attribute name="href">
                  <xsl:value-of select="link"/>
                </xsl:attribute> Link to episode</a> (may not work!)</p>
            </li>
          </xsl:for-each>
        </ul>
      </div>
    </body>
  </html>
  </xsl:template>
</xsl:stylesheet>
