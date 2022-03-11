<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- izhodiščni je Okupacijske_meje.xml -->
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:param name="exh-div-id">exhibition06</xsl:param>
    <xsl:param name="sidihEntity">119</xsl:param>
    
    <xsl:template match="/">
        <xsl:result-document href="list-{$exh-div-id}.xml">
            <root entiy="{$sidihEntity}" exh="{number(substring-after($exh-div-id,'exhibition'))}">
                <xsl:for-each select="//tei:figure[ancestor::tei:div[@xml:id=$exh-div-id]][@rend='imageviewer' or @rend='interview']">
                    <xsl:variable name="n" select="@n"/>
                    <xsl:variable name="position" select="position()"/>
                    <xsl:variable name="exh-div-id-en" select="concat('en-',$exh-div-id)"/>
                    <figure xml:id="{@xml:id}">
                        <title xml:lang="slv">
                            <xsl:value-of select="tei:head"/>
                        </title>
                        <title xml:lang="eng">
                            <xsl:value-of select="//tei:figure[@n=$n][ancestor::tei:div[@xml:id=$exh-div-id-en]]/tei:head"/>
                        </title>
                        <xsl:if test="@rend='interview'">
                            <quote xml:lang="slv">
                                <xsl:value-of select="tei:cit/tei:quote"/>
                            </quote>
                            <bibl xml:lang="slv">
                                <xsl:value-of select="tei:cit/tei:bibl"/>
                            </bibl>
                            <xsl:for-each select="//tei:figure[@n=$n][ancestor::tei:div[@xml:id=$exh-div-id-en]]">
                                <quote xml:lang="eng">
                                    <xsl:value-of select="tei:cit/tei:quote"/>
                                </quote>
                                <bibl xml:lang="eng">
                                    <xsl:value-of select="tei:cit/tei:bibl"/>
                                </bibl>
                            </xsl:for-each>
                        </xsl:if>
                        <creator/>
                        <provenance/>
                        <source/>
                        <description xml:lang="slv"/>
                        <description xml:lang="eng"/>
                        <graphic>
                            <xsl:value-of select=" tokenize(tei:graphic[1]/@url,'/')[last()]"/>
                        </graphic>
                    </figure>
                </xsl:for-each>
            </root>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>