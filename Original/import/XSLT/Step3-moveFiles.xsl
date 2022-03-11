<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:param name="lastSIDIHfileNumber">2489</xsl:param>
    <xsl:param name="pathStart">/Users/andrejp/Repo/project/Okupacijske_meje/</xsl:param>
    <xsl:param name="path2entity">/sidih/menuTop/menu8/menu10/</xsl:param>
    
    <xsl:template match="root">
        <xsl:variable name="exhNum" select="@exh"/>
        <xsl:variable name="entity-num" select="@entiy"/>
        <xsl:result-document href="../import/move{$exhNum}.txt">
            <xsl:for-each select="figure">
                <xsl:variable name="fileNumber" select="position() + $lastSIDIHfileNumber"/>
                <xsl:variable name="fileName" select="graphic"/>
                
                <xsl:text>mv </xsl:text>
                <xsl:value-of select="concat($pathStart,'Pictures/exh0',$exhNum,'/',$fileName)"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="concat($pathStart,'import/exh',$exhNum,$path2entity,$entity-num,'/file',$fileNumber,'/',$fileName)"/>
                <xsl:if test="position() != last()">
                    <xsl:text> ; </xsl:text>
                </xsl:if>
            </xsl:for-each>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>