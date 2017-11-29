<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
  version="2.0">
  <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" name="html"/>
  <xsl:include href="blockAndInlineElements.xsl"/>
  <xsl:template match="/">
    <xsl:call-template name="pageHome"/>
    <xsl:call-template name="pageAbout"/>
    <xsl:call-template name="pageFullView">
      <xsl:with-param name="navType" select="'hierarchy'"/>
    </xsl:call-template>
    <xsl:call-template name="pageFullView">
      <xsl:with-param name="navType" select="'index'"/>
    </xsl:call-template>
    <xsl:call-template name="pageFullView">
      <xsl:with-param name="navType" select="'sequence'"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="pageFullView">
    <xsl:param name="navType"/>
    <xsl:for-each select="//cricketPlayer">
      <xsl:variable name="itemId" select="@id"/>
      <xsl:result-document href="../html/{$itemId}_{$navType}.html" format="html">
        <html>
          <head>
            <title>Cricket Player Information System</title>
            <meta charset="utf-8">
              <xsl:text> </xsl:text>
            </meta>
            <link href="css/player.css" rel="stylesheet">
              <xsl:text> </xsl:text>
            </link>
          </head>
          
          <body>
            <div class="page">
              <div class="bannerArea">
                <xsl:call-template name="bannerView"> </xsl:call-template>
              </div>
              
              <div class="globalNavArea"> </div>
              <div class="localNavArea">
                <xsl:call-template name="localNavView">
                  <xsl:with-param name="navType" select="$navType"/>
                </xsl:call-template>
              </div>
              
              <div class="contentArea">
                <xsl:call-template name="fullView">
                  <xsl:with-param name="itemId" select="$itemId"/>
                </xsl:call-template>
                
                <div class="subArea">
                  <xsl:call-template name="associationView">
                    <xsl:with-param name="itemId" select="$itemId"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </body>
          
        </html>
      </xsl:result-document>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="pageHome">
    <xsl:result-document href="../html/default.html" format="html">
      <p>This is the home page. </p>
    </xsl:result-document>
  </xsl:template>
  <xsl:template name="pageAbout">
    <xsl:result-document href="../html/about.html" format="html">
      <p>This is the about page</p>
    </xsl:result-document>
  </xsl:template>
  
  <xsl:template name="bannerView">
    <img src="images/Cricket_logo.png">
      <xsl:text> </xsl:text>
    </img>
    <h1>Cricket Player Information System</h1>
  </xsl:template>
  
  <xsl:template name="fullView">
    <xsl:param name="itemId"/>
    <xsl:for-each select="//cricketPlayer[@id =$itemId]">
      <img src="images/{photos/photo/@fileName}">
        <xsl:text> </xsl:text>
      </img>
      <ul>
        <li>Player Name: <xsl:value-of select="title"/></li>
        <li>
          Description:
          <xsl:for-each select="description">
            <xsl:apply-templates/>  
          </xsl:for-each>
        </li>
        <li>Age: <xsl:value-of select="age"/></li>
        <li>Gender: <xsl:value-of select="gender"/></li>
        <li>National Side: <xsl:value-of select="nationalSide"/> </li>
        <xsl:if test="teamsPlayedFor">
          <li>Teams Played for:</li>
          <xsl:for-each select="teamsPlayedFor/team">
            <xsl:value-of select="teamName"/><xsl:text> </xsl:text>
          </xsl:for-each>
        </xsl:if>
        <li>Playing role: <xsl:value-of select="playingRole"/></li>
        <li>Batting style: <xsl:value-of select="battingStyle"/></li>
        <li>Bowling style: <xsl:value-of select="bowlingStyle"/></li>
        <li>Game Stats: <ul>
          <li>Games played: <xsl:value-of select="gameStats/matchesPlayed"/></li>
          <li>Innings played: <xsl:value-of select="gameStats/inningsPlayed"/></li>
          <li>Bowling averages <ul>
            <li>Wickets: <xsl:value-of select="gameStats/bowlingAverages/wickets"/></li>
          </ul>
          </li>
          <li>Fielding averages <ul>
            <li>Catches: <xsl:value-of select="gameStats/fieldingAverages/catches"/></li>
          </ul>
          </li>
          <li>Batting averages <ul>
            <li>Runs: <xsl:value-of select="gameStats/battingAverages/runs"/></li>
            <li>Centuries: <xsl:value-of select="gameStats/battingAverages/centuries"/></li>
            <li>Half Centuries: <xsl:value-of select="gameStats/battingAverages/halfCenturies"/></li>
          </ul>
          </li>
        </ul>
        </li>
      </ul>
    </xsl:for-each>  
  </xsl:template>
  
  <xsl:template name="localNavSwitch">
    <xsl:param name="navType"></xsl:param>
    <xsl:choose>
      <xsl:when test="$navType='hierarchy'">
        <xsl:call-template name="hierarchyView"></xsl:call-template>
      </xsl:when>
      <xsl:when test="$navType='index'">
        <xsl:call-template name="indexView"></xsl:call-template>
      </xsl:when>
      <xsl:when test="$navType='sequence'">
        <xsl:call-template name="sequenceView"></xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <p><xsl:value-of select="$navType"/></p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="localNavView">
    <xsl:param name="navType"/>
    <xsl:call-template name="localNavSwitch">
      <xsl:with-param name="navType" select="$navType"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template name="hierarchyView">
    <h3>Players by Region</h3>
    <xsl:for-each select="//cricketPlayerBase/regions/region">
      <xsl:call-template name="displayHierarchy">
        <xsl:with-param name="indent" select="'20'"></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    
  </xsl:template>
  
  <xsl:template name="displayHierarchy">
    <xsl:param name="indent"></xsl:param>
    <p style="margin-left:{$indent}px;margin-top:0px;margin-bottom:0px">
      <xsl:value-of select="title"/>
    </p>
    <xsl:for-each select="playerRefId">
      <xsl:variable name="currPlayerId" select="."/>
      <p style="margin-left:{number($indent)+20}px;margin-top:0px;margin-bottom:0px">
        <a href="{$currPlayerId}_hierarchy.html">
          <xsl:value-of select="//cricketPlayer[@id=$currPlayerId]/title"/>
        </a>
      </p>
    </xsl:for-each>
    <xsl:for-each select="region">
      <xsl:call-template name="displayHierarchy">
        <xsl:with-param name="indent" select="number($indent)+10"></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="indexView">
    <h3>Player Index</h3>
    <table border="1">
      <tr>
        <th>Player name Starts with:</th>
        <th>Go to player info.</th>
      </tr>
      <xsl:for-each select="//keywords/keyword">
        <xsl:sort select="title"/>
        <tr>
          <td>
            <xsl:value-of select="title"/>
          </td>
          <td>
            <xsl:for-each select="playerRefId">
              <xsl:variable name="currPlayer" select="."/>
              <a href="{$currPlayer}_index.html">
                <xsl:value-of select="//cricketPlayer[@id=$currPlayer]/title"/>
              </a>
              <br/>
            </xsl:for-each>
          </td>
          
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>
  
  <xsl:template name="associationView">
    <xsl:param name="itemId"></xsl:param>
    <xsl:for-each select="//cricketPlayer[@id=$itemId]">
      <p>Related Players:</p>
      <p>
        <xsl:for-each select="relatedPlayers/playerRefId">
          <xsl:variable name="relatedPlayers" select="."/>
          
          <a href="{$relatedPlayers}_association.html">
            <xsl:value-of select="//cricketPlayer[@id=$relatedPlayers]/title"/>
          </a>
          <p> </p>
          
        </xsl:for-each>
      </p>
    </xsl:for-each>    
  </xsl:template>
  
  <xsl:template name="sequenceView">
    <xsl:for-each select="//sequence">
      <hr/>
      <h2>
        <xsl:value-of select="@title"/>
      </h2>
      <ul>
        <xsl:for-each select="playerRefId">
          <xsl:variable name="playerRefId" select="."/>
          <li>
            <a href="#{$playerRefId}_sequence.html">
              <xsl:value-of select="//cricketPlayer[@id=$playerRefId]/title"/>
            </a>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:for-each>
  </xsl:template>
  
</xsl:stylesheet>
