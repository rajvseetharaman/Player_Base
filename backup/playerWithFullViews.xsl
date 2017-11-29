<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xhtml"/>
    <xsl:variable name="itemId" select="'p1'"/>
    <xsl:template match="/">
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
                            <xsl:with-param name="navType" select="none"/>
                        </xsl:call-template>
                    </div>

                    <div class="contentArea">
                        <xsl:call-template name="fullView">
                            <xsl:with-param name="itemId" select="$itemId"/>
                        </xsl:call-template>

                        <div class="subArea"> </div>
                    </div>
                </div>
            </body>

        </html>
    </xsl:template>

    <xsl:template name="fullView">
        <xsl:param name="itemId"/>
        <xsl:for-each select="//cricketPlayer[@id =$itemId]">
            <img src="images/{photos/photo/@fileName}">
                <xsl:text> </xsl:text>
            </img>
            <ul>
                <li>Player Name: <xsl:value-of select="title"/></li>
                <li>Description: <xsl:copy-of select="description/p"/></li>
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

    <xsl:template name="bannerView">
        <img src="images/Cricket_logo.png">
            <xsl:text> </xsl:text>
        </img>
        <h1>Cricket Player Information System</h1>
    </xsl:template>

    <xsl:template name="localNavView">
        <xsl:param name="navType"/>
        <p>Players by Nationality:</p>
        <ul>
            <li>
                <a href="#">India</a>
            </li>
            <li>
                <a href="#">England</a>
            </li>
            <li>
                <a href="#">Australia</a>
            </li>
            <li>
                <a href="#">Bangladesh</a>
            </li>
            <li>
                <a href="#">New Zealand</a>
            </li>
            <li>
                <a href="#">Pakistan</a>
            </li>
            <li>
                <a href="#">South Africa</a>
            </li>
            <li>
                <a href="#">Sri Lanka</a>
            </li>
            <li>
                <a href="#">West Indies</a>
            </li>
            <li>
                <a href="#">Canada</a>
            </li>
            <li>
                <a href="#">Ireland</a>
            </li>
            <li>
                <a href="#">Kenya</a>
            </li>
            <li>
                <a href="#">USA</a>
            </li>
            <li>
                <a href="#">UAE</a>
            </li>
            <li>
                <a href="#">Afghanistan</a>
            </li>
        </ul>
    </xsl:template>

</xsl:stylesheet>
