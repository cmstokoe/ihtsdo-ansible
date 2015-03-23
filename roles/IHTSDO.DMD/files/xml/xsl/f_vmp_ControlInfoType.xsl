<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="text" encoding="ASCII" />

<xsl:param name="delimiter" select=" '|' "/>

<xsl:template match="/*">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="//CONTROL_INFO">
<xsl:value-of select="VPID"/>
<xsl:value-of select="$delimiter"/>
<xsl:value-of select="CATCD"/>
<xsl:value-of select="$delimiter"/>
<xsl:value-of select="CATDT"/>
<xsl:value-of select="$delimiter"/>
<xsl:value-of select="CAT_PREVCD"/>

<xsl:text>&#xa;</xsl:text>
</xsl:template>
<xsl:template match="text()" />

</xsl:stylesheet>
