<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:key name="liquid-by-category" match="liquid" use="@category" />

    <xsl:template match="/">
        <div>
            <h2>Total number of goods:<xsl:value-of select="count(//liquid)"/></h2>
           <xsl:apply-templates select="//liquid[generate-id(.) = generate-id(key('liquid-by-category', @category)[1] )]"/>
        </div>
    </xsl:template>

    <xsl:template match="liquid">
        <h2>Consistency: <xsl:value-of select="@category"/></h2>
        <h3>Total: <xsl:value-of select="count(//liquid[@category = current()/@category])"/></h3>
        <ul>
            <xsl:apply-templates select="key('liquid-by-category', @category)" mode="grouping"/>
        </ul>
    </xsl:template>

 <xsl:template match="liquid" mode="grouping">
        <li><a href="{//link}"><xsl:value-of select="@name"/></a> -
            <xsl:value-of select="//price"/>
        </li>
    </xsl:template>

</xsl:stylesheet>