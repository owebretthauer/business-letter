<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">


    <xsl:template name="empty-pagedefinition">
        <fo:simple-page-master master-name="empty" page-width="{$page-width}mm" page-height="{$page-height}mm" margin-top="0mm" margin-bottom="0mm" margin-left="0mm" margin-right="0mm">
            <fo:region-body
                    region-name="content"
                    margin-top="{$content-margin-top}mm"
                    margin-bottom="{$content-margin-bottom}mm"
                    margin-left="{$content-margin-inside}mm"
                    margin-right="{$content-margin-outside}mm"
                    background-repeat="no-repeat"
                    background-position-horizontal="left"
            />
            <fo:region-before extent="{$region-before}mm" region-name="empty-before" />
            <fo:region-after extent="{$region-after}mm" region-name="empty-after" />
        </fo:simple-page-master>
    </xsl:template>


    <xsl:template name="insert_empty_pages">
        <xsl:param name="forcePageCount"/>
        <fo:page-sequence master-reference="empty" color="{$black}">
            <xsl:if test="$forcePageCount">
                <xsl:attribute name="force-page-count">end-on-even</xsl:attribute>
            </xsl:if>

            <xsl:call-template name="empty-static-flow-name-contents" />

            <fo:flow flow-name="content" font-size="8pt" font-family="{$basefont}" color="{$black}">
                <fo:block>&#160;</fo:block>
            </fo:flow>

        </fo:page-sequence>
    </xsl:template>

    <xsl:template name="empty-static-flow-name-contents">

        <fo:static-content flow-name="empty-before" color="{$black}">
            <xsl:call-template name="crop-marks-before"/>
        </fo:static-content>

        <fo:static-content flow-name="empty-after">
            <xsl:call-template name="crop-marks-after"/>
            <xsl:call-template name="page-numbers" />
        </fo:static-content>

    </xsl:template>

</xsl:stylesheet>
