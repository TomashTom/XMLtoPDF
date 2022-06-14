<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
    <xsl:output encoding="UTF-8" indent="yes" method="xml" standalone="no" omit-xml-declaration="no"/>
    <xsl:template match="/">
        <fo:root language="EN">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4_Paper" page-height="297mm" page-width="210mm" margin-top="5mm"
                                       margin-bottom="5mm" margin-left="5mm" margin-right="5mm">
                    <fo:region-body margin-top="1mm" margin-bottom="20mm"/>
                    <fo:region-before region-name="xsl-region-before" extent="25mm" display-align="before" precedence="true"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="A4_Paper">
                <fo:flow flow-name="xsl-region-body" border-collapse="collapse" reference-orientation="0">

                    <fo:block>CAR TABLE</fo:block>
                    <fo:table table-layout="fixed" width="100%" font-size="15pt" border-color="blue"
                              border-width="1mm" border-style="solid" text-align="center" display-align="before"
                              space-after="5mm" space-before="5mm">
                        <fo:table-column column-width="proportional-column-width(20)"/>
                        <fo:table-column column-width="proportional-column-width(20)"/>
                        <fo:table-column column-width="proportional-column-width(20)"/>
                        <fo:table-column column-width="proportional-column-width(20)"/>
                        <fo:table-column column-width="proportional-column-width(20)"/>
                        <fo:table-body font-size="95%">
                            <fo:table-row height="15mm">
                                <fo:table-cell>
                                    <fo:block>Name</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block>Model</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block>PRICE</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block>RATING</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <xsl:for-each select="cars/car">
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block>
                                            <xsl:value-of select="name"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>
                                            <xsl:value-of select="model"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>
                                            <xsl:value-of select="price"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>
                                            <xsl:value-of select="rating"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <fo:block>SHOPS</fo:block>
                    <fo:table table-layout="fixed" width="50%" font-size="17pt" border-color="black"
                              border-width="2mm" border-style="solid" text-align="left" display-align="before"
                              space-after="10mm" space-before="8mm">
                       <fo:table-column column-width="proportional-column-width(20)"/>
                        <fo:table-body font-size="95%">
                            <fo:table-row height="15mm">
                                <fo:table-cell>
                                    <fo:block>Shops around Europe</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <xsl:for-each select="cars/car/platform">
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block>
                                            <xsl:value-of select="platformName"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <fo:block>MODIFICATIONS</fo:block>
                    <fo:table table-layout="fixed" width="100%" font-size="15pt" border-color="green"
                              border-width="1mm" border-style="solid" text-align="left" display-align="before"
                              space-after="10mm" space-before="5mm">
                        <fo:table-column column-width="proportional-column-width(20)"/>
                        <fo:table-body font-size="95%">
                            <fo:table-row height="15mm">
                                <fo:table-cell>
                                    <fo:block>Modifications</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <xsl:for-each select="cars/car/launcher">
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block>
                                            <xsl:value-of select="launcherName"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <fo:block id="end-of-document">
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>