<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        version="2.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xls="http://www.w3.org/1999/XSL/Format">

    <xsl:template name="crop-marks-before">

        <fo:block-container width="10mm" top="0mm" right="0mm" position="absolute">
            <fo:block>
                <fo:external-graphic src="{$imageFolder}/ro.svg" content-width="10mm" />
            </fo:block>
        </fo:block-container>

        <fo:block-container width="10mm" top="0mm" left="0mm" position="absolute">
            <fo:block>
                <fo:external-graphic src="{$imageFolder}/lo.svg" content-width="10mm" />
            </fo:block>
        </fo:block-container>

    </xsl:template>

    <xsl:template name="crop-marks-after">

        <fo:block-container width="10mm" top="{$region-after - 10}mm" left="{$page-width - 10}mm" position="absolute"  >
            <fo:block>
                <fo:external-graphic src="{$imageFolder}/ru.svg" content-width="10mm"/>
            </fo:block>
        </fo:block-container>

        <fo:block-container width="10mm" top="{$region-after - 10}mm" left="0mm" position="absolute"  >
            <fo:block>
                <fo:external-graphic src="{$imageFolder}/lu.svg" content-width="10mm"/>
            </fo:block>
        </fo:block-container>

    </xsl:template>

    <xsl:template name="page-numbers">

        <fo:block-container width="230mm" height="10mm" top="8mm" left="0mm" position="absolute">
            <fo:block font-family="{$basefont}" font-weight="bold" font-size="12pt" text-align="center"><fo:page-number/></fo:block>
        </fo:block-container>

    </xsl:template>


</xsl:stylesheet>