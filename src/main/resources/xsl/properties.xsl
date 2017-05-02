<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">


    <!-- Base Folder -->
    <xsl:variable name="baseFolder">./</xsl:variable>

    <!-- Illustration Folder -->
    <xsl:variable name="imageFolder">images</xsl:variable>

    <!-- Images -->
    <xsl:variable name="signatur"><xsl:value-of select="$imageFolder"/>/signatur.png</xsl:variable>
    <xsl:variable name="logo"><xsl:value-of select="$imageFolder"/>/logo.png</xsl:variable>

    <!-- Fonts -->
    <xsl:variable name="basefont">Helvetica</xsl:variable>
    <xsl:variable name="boldfont">Helvetica</xsl:variable>
    <xsl:variable name="symbolfont">Helvetica</xsl:variable>

    <!-- Sizes -->
    <xsl:variable name="small">11pt</xsl:variable>
    <xsl:variable name="normal">12pt</xsl:variable>

    <!-- Colors -->
    <xsl:variable name="white">white</xsl:variable>
    <xsl:variable name="black">black</xsl:variable>
    <xsl:variable name="lightgrey">grey</xsl:variable>

    <!-- Page Margins -->
    <xsl:variable name="content-margin-top-first">95.46</xsl:variable>
    <xsl:variable name="content-margin-top">20</xsl:variable>
    <xsl:variable name="content-margin-bottom">35</xsl:variable>

    <xsl:variable name="content-margin-inside">25</xsl:variable>
    <xsl:variable name="content-margin-outside">20</xsl:variable>

    <!-- multi column -->
    <xsl:param name="column-count">1</xsl:param>
    <xsl:param name="column-gap">12pt</xsl:param>

    <!-- writing-mode: lr-tb | rl-tb | tb-rl -->
    <xsl:param name="writing-mode">lr-tb</xsl:param>

    <!-- text-align: justify | start -->
    <xsl:param name="text-align">start</xsl:param>

    <!-- hyphenate: true | false -->
    <xsl:param name="hyphenate">false</xsl:param>

    <!-- Crop Marks -->
    <xsl:variable name="show-crop-marks">false</xsl:variable>
    <xsl:variable name="show-crop-height-and-width">10</xsl:variable>

    <!-- DIN 4 = 210 x 297, + space for crap-marks -->
    <xsl:variable name="page-width"><xsl:value-of select="210 + 2 * $show-crop-height-and-width" /></xsl:variable>
    <xsl:variable name="page-height"><xsl:value-of select="297 + 2 * $show-crop-height-and-width" /></xsl:variable>

    <xsl:variable name="letter-recipient-height">
        <xsl:choose>
            <xsl:when test="$show-crop-marks = 'true'">
                <xsl:value-of select="45 + $show-crop-height-and-width" />
            </xsl:when>
            <xsl:otherwise>45</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <!-- Right Page (Odd) -->
    <xsl:variable name="content-width">
        <xsl:value-of select="$page-width - $content-margin-inside - $content-margin-outside"/>
    </xsl:variable>

    <xsl:variable name="region-before-first">95.46</xsl:variable>
    <xsl:variable name="region-before">20</xsl:variable>
    <xsl:variable name="region-after">35</xsl:variable>

    <!-- Borders -->
    <xsl:variable name="border-width-outer">1.25pt</xsl:variable>
    <xsl:variable name="border-width-inner">0.5pt</xsl:variable>

    <!-- Formatting -->
    <xsl:attribute-set name="margin-basic-block">
        <xsl:attribute name="padding-top">1.5pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">1.5pt</xsl:attribute>
        <xsl:attribute name="padding-left">4pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="clear-padding">
        <xsl:attribute name="padding-top">0pt</xsl:attribute>
        <xsl:attribute name="padding-right">0pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
        <xsl:attribute name="padding-left">0pt</xsl:attribute>
    </xsl:attribute-set>

    <!-- Debuging -->
    <xsl:attribute-set name="debug-1">
        <xsl:attribute name="border-style">dotted</xsl:attribute>
        <xsl:attribute name="border-width">0.5pt</xsl:attribute>
        <xsl:attribute name="border-color">red</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="debug-2">
        <xsl:attribute name="border-style">dotted</xsl:attribute>
        <xsl:attribute name="border-width">1pt</xsl:attribute>
        <xsl:attribute name="border-color">blue</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="debug-3">
        <xsl:attribute name="border-style">dotted</xsl:attribute>
        <xsl:attribute name="border-width">1pt</xsl:attribute>
        <xsl:attribute name="border-color">green</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>
