<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:html="http://www.w3.org/1999/xhtml"
   xmlns:tei="http://www.tei-c.org/ns/1.0"
   xmlns:teidocx="http://www.tei-c.org/ns/teidocx/1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   exclude-result-prefixes="tei html teidocx xs"
   version="2.0">

   <xsl:import href="../../../../pub-XSLT/Stylesheets/html5-foundation6-chs/to.xsl"/>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet" type="stylesheet">
      <desc>
         <p>TEI stylesheet for making HTML5 output (Zurb Foundation 6 http://foundation.zurb.com/sites/docs/).</p>
         <p>This software is dual-licensed:
            
            1. Distributed under a Creative Commons Attribution-ShareAlike 3.0
            Unported License http://creativecommons.org/licenses/by-sa/3.0/ 
            
            2. http://www.opensource.org/licenses/BSD-2-Clause
            
            
            
            Redistribution and use in source and binary forms, with or without
            modification, are permitted provided that the following conditions are
            met:
            
            * Redistributions of source code must retain the above copyright
            notice, this list of conditions and the following disclaimer.
            
            * Redistributions in binary form must reproduce the above copyright
            notice, this list of conditions and the following disclaimer in the
            documentation and/or other materials provided with the distribution.
            
            This software is provided by the copyright holders and contributors
            "as is" and any express or implied warranties, including, but not
            limited to, the implied warranties of merchantability and fitness for
            a particular purpose are disclaimed. In no event shall the copyright
            holder or contributors be liable for any direct, indirect, incidental,
            special, exemplary, or consequential damages (including, but not
            limited to, procurement of substitute goods or services; loss of use,
            data, or profits; or business interruption) however caused and on any
            theory of liability, whether in contract, strict liability, or tort
            (including negligence or otherwise) arising in any way out of the use
            of this software, even if advised of the possibility of such damage.
         </p>
         <p>Andrej Pančur, Institute for Contemporary History</p>
         <p>Copyright: 2013, TEI Consortium</p>
      </desc>
   </doc>
  
   <!-- Uredi parametre v skladu z dodatnimi zahtevami za pretvorbo te publikacije: -->
   <!-- ../../../  -->
   <!-- http://www2.sistory.si/publikacije/ -->
   <xsl:param name="path-general"></xsl:param>
   
   <!-- Iz datoteke ../../../../publikacije-XSLT/sistory/html5-foundation6-chs/to.xsl -->
   <xsl:param name="outputDir">docs/</xsl:param>
   
   <xsl:param name="homeLabel">SIstory</xsl:param>
   <xsl:param name="homeURL">https://okupacijskemeje.si/</xsl:param>
   
   <xsl:param name="splitLevel">1</xsl:param>
   
   <!-- Iz datoteke ../../../../publikacije-XSLT/sistory/html5-foundation6-chs/my-html_param.xsl -->
   <xsl:param name="title-bar-sticky">false</xsl:param>
   
   <xsl:param name="chapterAsSIstoryPublications">false</xsl:param>
   
   <xsl:param name="documentationLanguage">en</xsl:param>
   
   <xsl:param name="element-gloss-teiHeader-lang">en</xsl:param>
   
   <xsl:param name="languages-locale">true</xsl:param>
   
   <!-- odstranim pri spodnjih param true -->
   <xsl:param name="numberFigures"></xsl:param>
   <xsl:param name="numberFrontTables"></xsl:param>
   <xsl:param name="numberHeadings"></xsl:param>
   <xsl:param name="numberParagraphs"></xsl:param>
   <xsl:param name="numberTables"></xsl:param>
   
   <!-- V html/head izpisani metapodatki -->
   <xsl:param name="description"></xsl:param>
   <xsl:param name="keywords"></xsl:param>
   <xsl:param name="title"></xsl:param>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Ne procesiram štetja besed v kolofonu</desc>
   </doc>
   <xsl:template name="countWords"/>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za front front/div</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-front-head">
      <xsl:param name="thisLanguage"/>
      <xsl:choose>
         <xsl:when test="$thisLanguage = 'en'">About</xsl:when>
         <xsl:otherwise>O projektu</xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- A projektről -->
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za glavno vsebino (glavna navigacija)</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-body-head">
      <xsl:param name="thisLanguage"/>
      <xsl:choose>
         <xsl:when test="$thisLanguage = 'en'">Exhibitions</xsl:when>
         <xsl:otherwise>Razstave</xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- Kilítások -->
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za izpis naziva bibliografije na gornji navigaciji</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-bibl-head">
      <xsl:param name="thisLanguage"/>
      <xsl:choose>
         <xsl:when test="$thisLanguage = 'en'">Results</xsl:when>
         <xsl:otherwise>Rezultati</xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- Eredmények -->
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za izpis naziva priloge na gornji navigaciji</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-appendix-head">
      <xsl:param name="thisLanguage"/>
      <xsl:choose>
         <xsl:when test="$thisLanguage = 'en'">Movies</xsl:when>
         <xsl:otherwise>Filmi</xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- Filmek -->
   
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>V css in javascript Hook dodam imageViewer</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="cssHook">
      <xsl:if test="$title-bar-sticky = 'true'">
         <xsl:value-of select="concat($path-general,'themes/css/foundation/6/sistory-sticky_title_bar.css')"/>
      </xsl:if>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.min.css" rel="stylesheet" type="text/css" />
      <link href="{concat($path-general,'themes/plugin/TipueSearch/6.1/tipuesearch/css/normalize.css')}" rel="stylesheet" type="text/css" />
      <link href="{concat($path-general,'themes/css/plugin/TipueSearch/6.1/my-tipuesearch.css')}"  rel="stylesheet" type="text/css" />
      <!-- dodan imageViewer -->
      <link href="{concat($path-general,'themes/plugin/ImageViewer/1.1.3/imageviewer.css')}"  rel="stylesheet" type="text/css" />
   </xsl:template>
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>[html] Hook where extra Javascript functions can be defined</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="javascriptHook">
      <script src="{concat($path-general,'themes/foundation/6/js/vendor/jquery.js')}"></script>
      <!-- za highcharts -->
      <xsl:if test="//tei:figure[@type = 'chart'][tei:graphic[@mimeType = 'application/javascript']]">
         <xsl:variable name="jsfile" select="//tei:figure[@type = 'chart'][tei:graphic[@mimeType = 'application/javascript']][1]/tei:graphic[@mimeType = 'application/javascript']/@url"/>
         <xsl:variable name="chart-jsfile" select="document($jsfile)/html/body/script[1]/@src"/>
         <script src="{$chart-jsfile[1]}"></script>
      </xsl:if>
      <!-- za back-to-top in highcharts je drugače potrebno dati jquery, vendar sedaj ne rabim dodajati jquery kodo,
         ker je že vsebovana zgoraj -->
      <!-- dodan imageViewer -->
      <script src="{concat($path-general,'themes/plugin/ImageViewer/1.1.3/imageviewer.js')}"></script>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Slike, ki imajo vključeno možnost povečanja slike z imageviewer</desc>
   </doc>
   <xsl:template match="tei:figure[@rend='imageviewer']">
      <figure id="{@xml:id}">
         <img class="imageviewer" style="height:600px;" src="{tei:graphic[contains(@url,'normal')]/@url}" data-high-res-src="{tei:graphic[1]/@url}" alt="{normalize-space(tei:head)}"/>
         <figcaption>
            <xsl:value-of select="normalize-space(tei:head)"/>
         </figcaption>
      </figure>
      <br/>
      <br/>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Posebno oblikovanje za slike z intervjuji https://foundation.zurb.com/sites/docs/media-object.html</desc>
   </doc>
   <xsl:template match="tei:figure[@rend='interview']">
      <div class="media-object" id="{@xml:id}">
         <div class="media-object-section">
            <div class="thumbnail">
               <img class="imageviewer" src="{tei:graphic[contains(@url,'thumb')]/@url}" data-high-res-src="{tei:graphic[not(contains(@url,'thumb'))]/@url}"/>
            </div>
         </div>
         <div class="media-object-section">
            <xsl:apply-templates select="*[not(self::tei:graphic)]"/>
         </div>
      </div>
   </xsl:template>
   
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>Dodam zaključni javascript za ImageViewer</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="bodyEndHook">
      <script type="text/javascript">
         
         $(function () {
         var viewer = ImageViewer();
         $('.imageviewer').click(function () {
         var imgSrc = this.src,
         highResolutionImage = $(this).data('high-res-src');
         viewer.show(imgSrc, highResolutionImage);
         });
         });
      </script>
      <script src="{concat($path-general,'themes/foundation/6/js/vendor/what-input.js')}"></script>
      <script src="{concat($path-general,'themes/foundation/6/js/vendor/foundation.min.js')}"></script>
      <script src="{concat($path-general,'themes/foundation/6/js/app.js')}"></script>
      <!-- back-to-top -->
      <script src="{concat($path-general,'themes/js/plugin/back-to-top/back-to-top.js')}"></script>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Vključi youtube kodo</desc>
   </doc>
   <xsl:template match="tei:media[@mimeType='video/youtube' or @mimeType='video/x-youtube']">
      <div class="responsive-embed">
         <iframe width="420" height="315" src="https://www.youtube.com/embed/{tokenize(@url,'/')[last()]}" frameborder="0" allowfullscreen=""/>
      </div>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>KAZALO SLIK: ga mora preurediti, ker prvotno procesira samo $splitLevel = 0, sedaj pa imamo $splitLevel = 1</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="images">
      <xsl:param name="thisLanguage"/>
      <!-- izpiše vse slike -->
      <ul class="circel">
         <xsl:for-each select="//tei:figure[if ($languages-locale='true') then ancestor::tei:div[@xml:id][@xml:lang=$thisLanguage] else @xml:id][tei:graphic][not(@type='chart')]">
            <xsl:variable name="figure-id" select="@xml:id"/>
            <!-- Preuredim v skladu s tem projektu, vendar dolgoročno potrebno najti bolj vzdržno rešitev!!! -->
            <xsl:variable name="image-chapter-id" select="ancestor::tei:div[@xml:id][parent::tei:div[parent::tei:body]]/@xml:id"/>
            <xsl:variable name="sistoryPath">
               <xsl:if test="$chapterAsSIstoryPublications='true'">
                  <xsl:call-template name="sistoryPath">
                     <xsl:with-param name="chapterID" select="$image-chapter-id"/>
                  </xsl:call-template>
               </xsl:if>
            </xsl:variable>
            <li>
               <a href="{concat($sistoryPath,$image-chapter-id,'.html#',$figure-id)}">
                  <xsl:value-of select="tei:head"/>
               </a>
            </li>
         </xsl:for-each>
      </ul><!-- konec procesiranja slik -->
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Sem moral okleščiti prvotni listBibl is sistory profila, ker je dvakrat kazal listBibl/head</desc>
   </doc>
   <xsl:template match="tei:listBibl">
      <ul>
         <xsl:if test="@xml:id">
            <xsl:attribute name="id">
               <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:apply-templates/>
      </ul>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Spremenil samo vrstni red v zgornji navigaciji: dal bibliogrphy za appendix</desc>
      <param name="thisChapter-id"></param>
      <param name="thisLanguage"></param>
      <param name="title-bar-type"></param>
   </doc>
   <xsl:template name="title-bar-list-of-contents">
      <xsl:param name="thisChapter-id"/>
      <xsl:param name="thisLanguage"/>
      <xsl:param name="title-bar-type"/>
      <xsl:variable name="sistoryParentPath">
         <xsl:choose>
            <xsl:when test="self::tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno[@type='sistory']">
               <xsl:variable name="teiParentId" select="self::tei:teiCorpus/@xml:id"/>
               <xsl:if test="$chapterAsSIstoryPublications='true'">
                  <xsl:call-template name="sistoryPath">
                     <xsl:with-param name="chapterID" select="$teiParentId"/>
                  </xsl:call-template>
               </xsl:if>
            </xsl:when>
            <xsl:when test="ancestor-or-self::tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno[@type='sistory']">
               <xsl:variable name="teiParentId" select="ancestor-or-self::tei:TEI/@xml:id"/>
               <xsl:if test="$chapterAsSIstoryPublications='true'">
                  <xsl:call-template name="sistoryPath">
                     <xsl:with-param name="chapterID" select="$teiParentId"/>
                  </xsl:call-template>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
      </xsl:variable>
      <!-- Poiščemo vse možne dele publikacije -->
      <!-- Naslovnica - index.html je vedno, kadar ni procesirano iz teiCorpus in ima hkrati TEI svoj xml:id -->
      <li>
         <!-- večjezično poimenovanje index html datotek -->
         <xsl:variable name="index-html">
            <xsl:choose>
               <xsl:when test="$thisLanguage != $languages-locale-primary">
                  <xsl:value-of select="concat('index','-',$thisLanguage)"/>
               </xsl:when>
               <xsl:otherwise>index</xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:if test="$thisChapter-id = $index-html">
            <xsl:attribute name="class">active</xsl:attribute>
         </xsl:if>
         <a>
            <xsl:attribute name="href">
               <xsl:choose>
                  <xsl:when test="ancestor::tei:teiCorpus and ancestor-or-self::tei:TEI[@xml:id]">
                     <xsl:value-of select="concat($sistoryParentPath,ancestor-or-self::tei:TEI/@xml:id,'.html')"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="concat($sistoryParentPath,$index-html,'.html')"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:attribute>
            <xsl:choose>
               <xsl:when test="tei:text[@type = 'article'] or ancestor::tei:text[@type = 'article'] or self::tei:teiCorpus/tei:TEI/tei:text[@type = 'article']">
                  <xsl:choose>
                     <xsl:when test="$languages-locale='true'">
                        <xsl:call-template name="myi18n-lang">
                           <xsl:with-param name="word">Naslov</xsl:with-param>
                           <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
                        </xsl:call-template>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:sequence select="tei:i18n('Naslov')"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:choose>
                     <xsl:when test="$languages-locale='true'">
                        <xsl:call-template name="myi18n-lang">
                           <xsl:with-param name="word">Naslovnica</xsl:with-param>
                           <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
                        </xsl:call-template>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:sequence select="tei:i18n('Naslovnica')"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:otherwise>
            </xsl:choose>
         </a>
      </li>
      <!-- kolofon: CIP in teiHeader -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:front/tei:divGen[@type='cip' or @type='teiHeader']">
         <xsl:call-template name="header-colophon">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- kolofon CIP za teiCorpus za revije: TODO za večjezičnost-locale -->
      <xsl:if test="self::tei:teiCorpus and $write-teiCorpus-cip='true'">
         <li>
            <xsl:if test="$thisChapter-id='cip'">
               <xsl:attribute name="class">active</xsl:attribute>
            </xsl:if>
            <xsl:variable name="sistoryPath">
               <xsl:if test="$chapterAsSIstoryPublications='true'">
                  <xsl:call-template name="sistoryPath">
                     <xsl:with-param name="chapterID" select="self::tei:teiCorpus/@xml:id"/>
                  </xsl:call-template>
               </xsl:if>
            </xsl:variable>
            <a href="{concat($sistoryPath,'impressum.html')}">
               <xsl:sequence select="tei:i18n('impressum')"/>
            </a>
         </li>
      </xsl:if>
      <!-- TEI kolofon za teiCorpus za revije: TODO za večjezičnost-locale -->
      <xsl:if test="self::tei:teiCorpus and $write-teiCorpus-teiHeader='true'">
         <li>
            <xsl:if test="$thisChapter-id='teiHeader'">
               <xsl:attribute name="class">active</xsl:attribute>
            </xsl:if>
            <xsl:variable name="sistoryPath">
               <xsl:if test="$chapterAsSIstoryPublications='true'">
                  <xsl:call-template name="sistoryPath">
                     <xsl:with-param name="chapterID" select="self::tei:teiCorpus/@xml:id"/>
                  </xsl:call-template>
               </xsl:if>
            </xsl:variable>
            <a href="{concat($sistoryPath,'teiHeader.html')}">
               <xsl:sequence select="tei:i18n('teiHeader')"/>
            </a>
         </li>
      </xsl:if>
      <!-- kazalo toc titleAuthor za teiCorpus za revije (predpogoj: tei:text mora imeti @n): TODO za večjezičnost-locale -->
      <xsl:if test="self::tei:teiCorpus and $write-teiCorpus-toc_titleAuthor='true'">
         <li>
            <xsl:if test="$thisChapter-id='tocJournal'">
               <xsl:attribute name="class">active</xsl:attribute>
            </xsl:if>
            <xsl:variable name="sistoryPath">
               <xsl:if test="$chapterAsSIstoryPublications='true'">
                  <xsl:call-template name="sistoryPath">
                     <xsl:with-param name="chapterID" select="self::tei:teiCorpus/@xml:id"/>
                  </xsl:call-template>
               </xsl:if>
            </xsl:variable>
            <a href="{concat($sistoryPath,'tocJournal.html')}">
               <xsl:sequence select="tei:i18n('tocJournal')"/>
            </a>
         </li>
      </xsl:if>
      <!-- kazalo toc -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:front/tei:divGen[@type='toc']">
         <xsl:call-template name="header-toc">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- Uvodna poglavja v tei:front -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:front/tei:div">
         <xsl:call-template name="header-front">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- Osrednji del besedila v tei:body - Poglavja -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:body/tei:div">
         <xsl:call-template name="header-body">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- Content: divGen, ki požene prazen template divGen-process-content,
             v katerega lahko vstavimo pretvorbo za dinamično prikazovanje glavne vsebine -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:body/tei:divGen[@type='content']">
         <xsl:call-template name="header-content">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- Spremne besedila/študije k digitalnim izdajam -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:back/tei:div[@type='study']">
         <xsl:call-template name="header-study">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- Priloge v tei:back -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:back/tei:div[@type='appendix']">
         <xsl:call-template name="header-appendix">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- viri in literatura v tei:back -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:back/tei:div[@type='bibliogr']">
         <xsl:call-template name="header-bibliogr">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- povzetki -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:back/tei:div[@type='summary']">
         <xsl:call-template name="header-summary">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- Indeksi (oseb, krajev in organizacij) v divGen ali v div -->
      <xsl:if test="ancestor-or-self::tei:TEI/tei:text/tei:back/*[self::tei:divGen or self::tei:div][@type='index']">
         <xsl:call-template name="header-back-index">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
            <xsl:with-param name="title-bar-type" select="$title-bar-type"/>
            <xsl:with-param name="sistoryParentPath" select="$sistoryParentPath"/>
         </xsl:call-template>
      </xsl:if>
      <!-- languages - locale -->
      <xsl:if test="$languages-locale='true'">
         <xsl:call-template name="header-locale">
            <xsl:with-param name="thisChapter-id" select="$thisChapter-id"/>
            <xsl:with-param name="thisLanguage" select="$thisLanguage"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   
   
</xsl:stylesheet>
