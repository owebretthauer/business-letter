<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
        version="2.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:fo="http://www.w3.org/1999/XSL/Format"
        xmlns:saxon="http://icl.com/saxon">

    <xsl:include href="properties.xsl" />
    <xsl:include href="base.xsl"/>
    <xsl:include href="empty.xsl" />
    <xsl:include href="html.xsl" />
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">

        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <xsl:apply-templates />
        </fo:root>

    </xsl:template>


    <xsl:attribute-set name="main-debug-border">
        <!--
        <xsl:attribute name="border-top-style">solid</xsl:attribute>
        <xsl:attribute name="border-top-width">0.5pt</xsl:attribute>
        <xsl:attribute name="border-top-color">black</xsl:attribute>

        <xsl:attribute name="border-right-style">solid</xsl:attribute>
        <xsl:attribute name="border-right-width">0.5pt</xsl:attribute>
        <xsl:attribute name="border-right-color">black</xsl:attribute>

        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-bottom-width">0.5pt</xsl:attribute>
        <xsl:attribute name="border-bottom-color">black</xsl:attribute>

        <xsl:attribute name="border-left-style">solid</xsl:attribute>
        <xsl:attribute name="border-left-width">0.5pt</xsl:attribute>
        <xsl:attribute name="border-left-color">black</xsl:attribute>
        -->

    </xsl:attribute-set>

    <xsl:template name="main-pagemaster">
        <fo:page-sequence-master master-name="main-right-left">
            <fo:repeatable-page-master-alternatives maximum-repeats="no-limit">
                <fo:conditional-page-master-reference master-reference="empty" odd-or-even="any" blank-or-not-blank="blank"/>
                <fo:conditional-page-master-reference master-reference="main-right-first" odd-or-even="odd" page-position="first" />
                <fo:conditional-page-master-reference master-reference="main-right" odd-or-even="odd" />
                <fo:conditional-page-master-reference master-reference="main-left" odd-or-even="even" />
            </fo:repeatable-page-master-alternatives>
        </fo:page-sequence-master>
    </xsl:template>

    <xsl:template name="main-pagedefinition">

        <!-- First Page -->
        <fo:simple-page-master master-name="main-right-first" page-width="{$page-width}mm" page-height="{$page-height}mm" margin-top="0mm" margin-bottom="0mm" margin-left="0mm" margin-right="0mm">
            <fo:region-body
                    region-name="content"
                    margin-top="{$content-margin-top-first}mm"
                    margin-bottom="{$content-margin-bottom}mm"
                    margin-left="{$content-margin-inside}mm"
                    margin-right="{$content-margin-outside}mm"
                    background-repeat="no-repeat"
                    background-position-horizontal="left"
            />
            <fo:region-before extent="{$page-height}mm" region-name="before-right-first" />
            <fo:region-after extent="{$region-after}mm" region-name="after-right" />
        </fo:simple-page-master>

        <!-- Right -->
        <fo:simple-page-master master-name="main-right" page-width="{$page-width}mm" page-height="{$page-height}mm" margin-top="0mm" margin-bottom="0mm" margin-left="0mm" margin-right="0mm">
            <fo:region-body
                    region-name="content"
                    margin-top="{$content-margin-top}mm"
                    margin-bottom="{$content-margin-bottom}mm"
                    margin-left="{$content-margin-inside}mm"
                    margin-right="{$content-margin-outside}mm"
                    background-repeat="no-repeat"
                    background-position-horizontal="left"
            />
            <fo:region-before extent="{$region-before}mm" region-name="before-right" />
            <fo:region-after extent="{$region-after}mm" region-name="after-right" />
        </fo:simple-page-master>

        <!-- Left -->
        <fo:simple-page-master master-name="main-left" page-width="{$page-width}mm" page-height="{$page-height}mm" margin-top="0mm" margin-bottom="0mm" margin-left="0mm" margin-right="0mm">
            <fo:region-body
                    region-name="content"
                    margin-top="{$content-margin-top}mm"
                    margin-bottom="{$content-margin-bottom}mm"
                    margin-left="{$content-margin-outside}mm"
                    margin-right="{$content-margin-inside}mm"
                    background-repeat="no-repeat"
                    background-position-horizontal="left"
            />
            <fo:region-before extent="{$region-before}mm" region-name="before-left" />
            <fo:region-after extent="{$region-after}mm" region-name="after-left" />
        </fo:simple-page-master>
    </xsl:template>

    <xsl:template name="main-section">
        <fo:page-sequence master-reference="main-right-left" color="{$black}"> <!-- initial-page-number="5"  -->
            <xsl:call-template name="main_before_right_first" />
            <xsl:call-template name="main_before_right" />
            <xsl:call-template name="main_before_left" />
            <xsl:call-template name="main_after_right" />
            <xsl:call-template name="main_after_left" />
            <xsl:call-template name="empty-static-flow-name-contents" />
            <xsl:call-template name="main_content" />
        </fo:page-sequence>
    </xsl:template>


    <xsl:template name="main_before_right_first">
        <fo:static-content flow-name="before-right-first" color="{$black}">

            <xsl:call-template name="main_header" />

            <xsl:if test="$show-crop-marks = 'true'">
                <xsl:call-template name="crop-marks-before" />
            </xsl:if>

            <fo:block-container width="10mm" top="87mm" left="0mm" position="absolute">
                <fo:block>
                    <fo:external-graphic src="{$imageFolder}/faltmarke.svg" content-width="5mm" />
                </fo:block>
            </fo:block-container>

            <fo:block-container width="5mm" top="192mm" left="0mm" position="absolute">
                <fo:block>
                    <fo:external-graphic src="{$imageFolder}/faltmarke.svg" content-width="5mm" />
                </fo:block>
            </fo:block-container>

            <fo:block-container width="{$content-width}mm" text-align="left" top="13mm" left="{$content-margin-inside}mm" position="absolute">
                <fo:block space-before="0mm" space-after="0mm">
                    <fo:external-graphic src="{$logo}" content-height="15mm" />
                </fo:block>
            </fo:block-container>

        </fo:static-content>
    </xsl:template>




    <xsl:template name="main_before_right">
        <fo:static-content flow-name="before-right" color="{$black}">

            <xsl:if test="$show-crop-marks = 'true'">
                <xsl:call-template name="crop-marks-before" />
            </xsl:if>

            <fo:block-container width="{$content-width}mm" text-align="right" top="13mm" right="{$content-margin-outside}mm" position="absolute">
                <fo:block space-before="0mm" space-after="0mm">
                    <!-- <fo:external-graphic src="url(file:{$logo})" content-height="15mm" /> -->
                </fo:block>
            </fo:block-container>

        </fo:static-content>
    </xsl:template>

    <xsl:template name="main_before_left">
        <fo:static-content flow-name="before-left" color="{$black}">

            <xsl:if test="$show-crop-marks = 'true'">
                <xsl:call-template name="crop-marks-before" />
            </xsl:if>

            <fo:block-container width="{$content-width}mm" text-align="right" top="13mm" right="{$content-margin-inside}mm" position="absolute">
                <fo:block space-before="0mm" space-after="0mm">
                    <!-- <fo:external-graphic src="url(file:{$logo})" content-height="15mm" /> -->
                </fo:block>
            </fo:block-container>

        </fo:static-content>
    </xsl:template>

    <xsl:template name="main_after_right">
        <fo:static-content flow-name="after-right">
            <xsl:if test="$show-crop-marks = 'true'">
                <xsl:call-template name="crop-marks-after" />
            </xsl:if>
            <xsl:call-template name="main_footer" />
            <!--
            <xsl:call-template name="page-numbers" />
            -->
        </fo:static-content>
    </xsl:template>

    <xsl:template name="main_after_left">
        <fo:static-content flow-name="after-left">
            <xsl:if test="$show-crop-marks = 'true'">
                <xsl:call-template name="crop-marks-after" />
            </xsl:if>
            <xsl:call-template name="main_footer" />
        <!--
        <xsl:call-template name="page-numbers" />
        -->
    </fo:static-content>
</xsl:template>

<xsl:template match="letter">

    <fo:layout-master-set>
        <xsl:call-template name="main-pagemaster"/>
        <xsl:call-template name="main-pagedefinition"/>
        <xsl:call-template name="empty-pagedefinition"/>
    </fo:layout-master-set>

    <!-- Empty Page -->
        <!--
        <xsl:call-template name="insert_empty_pages" >
            <xsl:with-param name="forcePageCount" select="true()"/>
        </xsl:call-template>
        -->

        <!-- Main -->
        <xsl:call-template name="main-section"/>

    </xsl:template>

    <xsl:template name="main_content">
        <fo:flow flow-name="content" font-size="12pt" font-family="{$basefont}" color="{$black}">
            <fo:block><xsl:apply-templates select="meta/subject"/></fo:block>
            <fo:block><xsl:apply-templates select="meta/opening"/></fo:block>
            <fo:block><xsl:apply-templates select="body"/></fo:block>
            <fo:block><xsl:apply-templates select="footer"/></fo:block>
            <fo:block><xsl:apply-templates select="signature"/></fo:block>
        </fo:flow>
    </xsl:template>

    <xsl:template name="main_header">

        <!-- sender -->
        <fo:block-container position="absolute" top="{$letter-recipient-height}mm" left="{$content-margin-inside}mm">
            <fo:block font-size="8pt" text-decoration="underline" color="{$lightgrey}">
                <xsl:apply-templates select="/letter/meta/sender/contact" mode="letter_box"/>
            </fo:block>
        </fo:block-container>

        <!-- recipient -->
        <fo:block-container position="absolute" top="{$letter-recipient-height + 5}mm" left="{$content-margin-inside}mm">
            <xsl:apply-templates select="/letter/meta/recipient"/>
        </fo:block-container>

        <fo:block-container position="absolute" top="{$content-margin-top}mm" right="{$content-margin-outside}mm" text-align="right" width="{$content-width}mm">
            <fo:block font-size="{$small}">
                <xsl:apply-templates select="/letter/meta/sender/contact" mode="default"/>
            </fo:block>
        </fo:block-container>

        <fo:block-container position="absolute" top="{$letter-recipient-height + 30}mm" left="{$content-margin-inside}mm" width="{$content-width}mm" height="50mm" text-align="right">
            <fo:block font-weight="bold">
                <xsl:value-of select="/letter/meta/sender/contact/city"/>, den <xsl:value-of select="/letter/meta/date"/>
            </fo:block>
        </fo:block-container>

    </xsl:template>

    <xsl:template match="recipient">
      <fo:block><xsl:value-of select="name"/></fo:block>
      <fo:block><xsl:value-of select="extra"/></fo:block>
      <fo:block><xsl:value-of select="street"/></fo:block>
      <fo:block><xsl:value-of select="postcode"/> <xsl:value-of select="city"/></fo:block>
    </xsl:template>

    <xsl:template match="sender/contact" mode="default">
      <fo:block><xsl:value-of select="name"/></fo:block>
      <fo:block><xsl:value-of select="extra"/></fo:block>
      <fo:block><xsl:value-of select="street"/></fo:block>
      <fo:block><xsl:value-of select="postcode"/><xsl:text> </xsl:text><xsl:value-of select="city"/></fo:block>
      <fo:leader color="{$lightgrey}" leader-pattern="rule" rule-style="solid" rule-thickness="0.5pt"  leader-length="6cm" />
      <fo:block color="{$lightgrey}">Telefon: <xsl:value-of select="phone"/></fo:block>
      <fo:block color="{$lightgrey}"><xsl:value-of select="email"/></fo:block>
    </xsl:template>

    <xsl:template match="sender/contact" mode="letter_box">
        <fo:block font-size="8pt">
            <xsl:if test="name != ''">
                <xsl:value-of select="name"/>
                <xsl:text> &#x2022; </xsl:text>
            </xsl:if>

            <xsl:if test="extra != ''">
                <xsl:value-of select="extra"/>
                <xsl:text> &#x2022;</xsl:text>
            </xsl:if>


            <xsl:if test="street != ''">
                <xsl:value-of select="street"/>
                <xsl:text> &#x2022; </xsl:text>
            </xsl:if>

            <xsl:if test="street != '' and name != ''">
                <xsl:value-of select="postcode"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="city"/>
            </xsl:if>
        </fo:block>
    </xsl:template>

    <xsl:template name="main_footer">
        <fo:block></fo:block>
    </xsl:template>

    <xsl:template match="subject">
        <fo:block font-weight="bold"><xsl:apply-templates /></fo:block>
        <fo:block>&#160;</fo:block>
    </xsl:template>

    <xsl:template match="opening">
        <!-- Opening -->
        <fo:block>
            <xsl:apply-templates />
        </fo:block>
    </xsl:template>

    <xsl:template match="closing">
        <fo:block margin-top="36pt">
            <fo:block>
                <xsl:apply-templates />
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="signature">
        <fo:block>
            <fo:block>
                <fo:block>
                    <fo:external-graphic src="{$signatur}" content-height="10mm" />
                </fo:block>
                <fo:block>
                    <xsl:apply-templates />
                </fo:block>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="body">
        <fo:block text-align="justify" hyphenate="true">

            <!-- Body -->
            <fo:block margin-top="12pt">
                <xsl:apply-templates />
            </fo:block>

        </fo:block>
    </xsl:template>

    <xsl:template match="processBankInformation">
        <xsl:apply-templates select="//sender/bankInformation" mode="content" />
    </xsl:template>

    <xsl:template match="bankInformation" mode="content">
        <xsl:variable name="table-width"><xsl:value-of select="100" /></xsl:variable>
        <fo:block>
            <fo:table width="100%" table-layout="fixed">
                <fo:table-column column-width="proportional-column-width(0.25)" column-number="1" />
                <fo:table-column column-width="proportional-column-width(0.75)" column-number="2" />
                <fo:table-column column-width="proportional-column-width(1.25)" column-number="3" />
                <fo:table-column column-width="proportional-column-width(1.75)" column-number="4" />
                <fo:table-body>
                    <fo:table-row>
                        <!--<fo:table-cell column-number="1"><fo:block background-color="red">.</fo:block></fo:table-cell>-->
                        <fo:table-cell column-number="2">
                            <fo:block font-weight="bold">Bankname:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell column-number="3">
                            <fo:block><xsl:value-of select="bankname" /></fo:block>
                        </fo:table-cell>
                        <!--<fo:table-cell column-number="4"><fo:block background-color="blue">.</fo:block></fo:table-cell>-->
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell column-number="2">
                            <fo:block font-weight="bold">IBAN:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell column-number="3">
                            <fo:block><xsl:value-of select="iban" /></fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell column-number="2">
                            <fo:block font-weight="bold">BIC:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell column-number="3">
                            <fo:block><xsl:value-of select="bic" /></fo:block>
                        </fo:table-cell>
                    </fo:table-row>

                </fo:table-body>
            </fo:table>
        </fo:block>

    </xsl:template>

</xsl:stylesheet>
