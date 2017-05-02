<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
        version="2.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:fo="http://www.w3.org/1999/XSL/Format">


    <xsl:attribute-set name="h1">
        <xsl:attribute name="font-size">2em</xsl:attribute>
        <xsl:attribute name="font-weight">700</xsl:attribute>
        <xsl:attribute name="space-before">0.67em</xsl:attribute>
        <xsl:attribute name="space-after">0.67em</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="keep-together.within-column">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="h2">
        <xsl:attribute name="font-size">1.5em</xsl:attribute>
        <xsl:attribute name="font-weight">700</xsl:attribute>
        <xsl:attribute name="space-before">0.83em</xsl:attribute>
        <xsl:attribute name="space-after">0.83em</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="keep-together.within-column">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="h3">
        <xsl:attribute name="font-size">1.17em</xsl:attribute>
        <xsl:attribute name="font-weight">700</xsl:attribute>
        <xsl:attribute name="space-before">1em</xsl:attribute>
        <xsl:attribute name="space-after">1em</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="keep-together.within-column">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="h4">
        <xsl:attribute name="font-size">1em</xsl:attribute>
        <xsl:attribute name="font-weight">700</xsl:attribute>
        <xsl:attribute name="space-before">1.17em</xsl:attribute>
        <xsl:attribute name="space-after">1.17em</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="keep-together.within-column">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="h5">
        <xsl:attribute name="font-size">0.83em</xsl:attribute>
        <xsl:attribute name="font-weight">700</xsl:attribute>
        <xsl:attribute name="space-before">1.33em</xsl:attribute>
        <xsl:attribute name="space-after">1.33em</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="keep-together.within-column">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="h6">
        <xsl:attribute name="font-size">0.67em</xsl:attribute>
        <xsl:attribute name="font-weight">700</xsl:attribute>
        <xsl:attribute name="space-before">1.67em</xsl:attribute>
        <xsl:attribute name="space-after">1.67em</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="keep-together.within-column">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="b">
        <xsl:attribute name="font-weight">700</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="p">
        <xsl:attribute name="space-before">1em</xsl:attribute>
        <xsl:attribute name="space-after">1em</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="hr">
        <xsl:attribute name="border">1px inset</xsl:attribute>
        <xsl:attribute name="space-before">0.67em</xsl:attribute>
        <xsl:attribute name="space-after">0.67em</xsl:attribute>
    </xsl:attribute-set>

    <xsl:template name="process-common-attributes-and-children">
        <xsl:call-template name="process-common-attributes"/>
        <xsl:apply-templates/>
    </xsl:template>


    <xsl:template name="process-common-attributes">
    </xsl:template>

    <xsl:template match="h1">
        <fo:block xsl:use-attribute-sets="h1">
            <xsl:call-template name="process-common-attributes-and-children"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="h2">
        <fo:block xsl:use-attribute-sets="h2">
            <xsl:call-template name="process-common-attributes-and-children"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="h3">
        <fo:block xsl:use-attribute-sets="h3">
            <xsl:call-template name="process-common-attributes-and-children"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="h4">
        <fo:block xsl:use-attribute-sets="h4">
            <xsl:call-template name="process-common-attributes-and-children"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="h5">
        <fo:block xsl:use-attribute-sets="h5">
            <xsl:call-template name="process-common-attributes-and-children"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="h6">
        <fo:block xsl:use-attribute-sets="h6">
            <xsl:call-template name="process-common-attributes-and-children"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="b">
        <fo:block xsl:use-attribute-sets="b">
            <xsl:call-template name="process-common-attributes-and-children"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="p">
        <fo:block xsl:use-attribute-sets="p">
            <xsl:call-template name="process-common-attributes-and-children"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="hr">
        <fo:block xsl:use-attribute-sets="hr">
            <xsl:call-template name="process-common-attributes"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="center">
        <fo:block text-align="center">
            <xsl:call-template name="process-common-attributes-and-children"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="div">
        <!-- normal block -->
        <fo:block>
            <xsl:call-template name="process-common-attributes"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="br">
        <fo:block>
            <xsl:call-template name="process-common-attributes"/>
        </fo:block>
    </xsl:template>


    <xsl:attribute-set name="ul">
        <xsl:attribute name="space-before">1em</xsl:attribute>
        <xsl:attribute name="space-after">1em</xsl:attribute>
        <xsl:attribute name="keep-together.within-page">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ul-nested">
        <xsl:attribute name="space-before">0pt</xsl:attribute>
        <xsl:attribute name="space-after">0pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ol">
        <xsl:attribute name="space-before">1em</xsl:attribute>
        <xsl:attribute name="space-after">1em</xsl:attribute>
        <xsl:attribute name="keep-together.within-page">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ol-nested">
        <xsl:attribute name="space-before">0pt</xsl:attribute>
        <xsl:attribute name="space-after">0pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ul-li">
        <!-- for (unordered)fo:list-item -->
        <xsl:attribute name="relative-align">baseline</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ol-li">
        <!-- for (ordered)fo:list-item -->
        <xsl:attribute name="relative-align">baseline</xsl:attribute>
    </xsl:attribute-set>

    <xsl:param name="ul-label-1">&#x2022;</xsl:param>
    <xsl:attribute-set name="ul-label-1">
        <xsl:attribute name="font">1em serif</xsl:attribute>
    </xsl:attribute-set>

    <xsl:param name="ul-label-2">o</xsl:param>
    <xsl:attribute-set name="ul-label-2">
        <xsl:attribute name="font">0.67em monospace</xsl:attribute>
        <xsl:attribute name="baseline-shift">0.25em</xsl:attribute>
    </xsl:attribute-set>

    <xsl:param name="ul-label-3">-</xsl:param>
    <xsl:attribute-set name="ul-label-3">
        <xsl:attribute name="font-weight">700</xsl:attribute>
        <xsl:attribute name="font-size">0.9em</xsl:attribute>
        <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="baseline-shift">0.05em</xsl:attribute>
    </xsl:attribute-set>

    <xsl:param name="ol-label-1">1.</xsl:param>
    <xsl:attribute-set name="ol-label-1"/>

    <xsl:param name="ol-label-2">a.</xsl:param>
    <xsl:attribute-set name="ol-label-2"/>

    <xsl:param name="ol-label-3">i.</xsl:param>
    <xsl:attribute-set name="ol-label-3"/>

    <xsl:template match="ul">
        <fo:list-block xsl:use-attribute-sets="ul">
            <xsl:call-template name="process-common-attributes-and-children"/>
        </fo:list-block>
    </xsl:template>

    <xsl:template match="li//ul">
        <fo:list-block xsl:use-attribute-sets="ul-nested">
            <xsl:call-template name="process-common-attributes-and-children"/>
        </fo:list-block>
    </xsl:template>

    <xsl:template match="ol">
        <fo:list-block xsl:use-attribute-sets="ol">
            <xsl:call-template name="process-common-attributes-and-children"/>
        </fo:list-block>
    </xsl:template>

    <xsl:template match="li//ol">
        <fo:list-block xsl:use-attribute-sets="ol-nested">
            <xsl:call-template name="process-common-attributes-and-children"/>
        </fo:list-block>
    </xsl:template>

    <xsl:template match="ul/li">
        <fo:list-item xsl:use-attribute-sets="ul-li">
            <xsl:call-template name="process-ul-li"/>
        </fo:list-item>
    </xsl:template>

    <xsl:template name="process-ul-li">
        <xsl:call-template name="process-common-attributes"/>
        <fo:list-item-label end-indent="label-end()"
                            text-align="end" wrap-option="no-wrap">
            <fo:block>
                <xsl:variable name="depth" select="count(ancestor::ul)" />
                <xsl:choose>
                    <xsl:when test="$depth = 1">
                        <fo:inline xsl:use-attribute-sets="ul-label-1">
                            <xsl:value-of select="$ul-label-1"/>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="$depth = 2">
                        <fo:inline xsl:use-attribute-sets="ul-label-2">
                            <xsl:value-of select="$ul-label-2"/>
                        </fo:inline>
                    </xsl:when>
                    <xsl:otherwise>
                        <fo:inline xsl:use-attribute-sets="ul-label-3">
                            <xsl:value-of select="$ul-label-3"/>
                        </fo:inline>
                    </xsl:otherwise>
                </xsl:choose>
            </fo:block>
        </fo:list-item-label>
        <fo:list-item-body start-indent="body-start()">
            <fo:block>
                <xsl:apply-templates/>
            </fo:block>
        </fo:list-item-body>
    </xsl:template>

    <xsl:template match="ol/li">
        <fo:list-item xsl:use-attribute-sets="ol-li">
            <xsl:call-template name="process-ol-li"/>
        </fo:list-item>
    </xsl:template>

    <xsl:template name="process-ol-li">
        <xsl:call-template name="process-common-attributes"/>
        <fo:list-item-label end-indent="label-end()"
                            text-align="end" wrap-option="no-wrap">
            <fo:block>
                <xsl:variable name="depth" select="count(ancestor::ol)" />
                <xsl:choose>
                    <xsl:when test="$depth = 1">
                        <fo:inline xsl:use-attribute-sets="ol-label-1">
                            <xsl:number format="{$ol-label-1}"/>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="$depth = 2">
                        <fo:inline xsl:use-attribute-sets="ol-label-2">
                            <xsl:number format="{$ol-label-2}"/>
                        </fo:inline>
                    </xsl:when>
                    <xsl:otherwise>
                        <fo:inline xsl:use-attribute-sets="ol-label-3">
                            <xsl:number format="{$ol-label-3}"/>
                        </fo:inline>
                    </xsl:otherwise>
                </xsl:choose>
            </fo:block>
        </fo:list-item-label>
        <fo:list-item-body start-indent="body-start()">
            <fo:block>
                <xsl:apply-templates/>
            </fo:block>
        </fo:list-item-body>
    </xsl:template>



</xsl:stylesheet>
