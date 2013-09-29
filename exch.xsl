<?xml  version="1.0" encoding="gb2312" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" 
        xmlns:msxsl="urn:schemas-microsoft-com:xslt"
        xmlns:user="http://www.hxsoft.com/mynamespace">
<msxsl:script language="JScript" implements-prefix="user">
   function getstr(nodelist) {
     var str="concat(";
     if(nodelist.length==1) return nodelist.item(0).text;
     for (var i=0; i&lt;nodelist.length;i++) {
       if(i==0)
	  str += nodelist.nextNode().text;
       else
          str +=","+"'!'" +","+ nodelist.nextNode().text ;
     }
     return str+")";
   }
   function getkeystr(nodelist,str) {
     if(nodelist.length &lt; 1) return "row";
     return "key('"+str+"',"+ getstr(nodelist) +")";
   }
</msxsl:script>
<xsl:template match="/mode">
   <xsl:value-of select="'&#x000A;'"/>
   <xsl:element name="xsl:stylesheet">
      <xsl:attribute name="version">1.0</xsl:attribute>
      <xsl:for-each select="(//group)/item">
	 <xsl:value-of select="'&#x000A;'"/>
         <xsl:element name="xsl:key">
             <xsl:attribute name="name"><xsl:value-of select="concat('G',position())"/></xsl:attribute>
             <xsl:attribute name="match">row</xsl:attribute>
 	     <xsl:variable name="index" select="position()"/>
 	     <xsl:variable name="nodeex" select="(//group)/item"/>
            <xsl:attribute name="use"><xsl:value-of select="user:getstr($nodeex[position() &lt;=$index])"/></xsl:attribute>
         </xsl:element>
      </xsl:for-each>
      <xsl:for-each select="(//row)/item">
         <xsl:value-of select="'&#x000A;'"/>
         <xsl:element name="xsl:key">
             <xsl:attribute name="name"><xsl:value-of select="concat('R',position())"/></xsl:attribute>
             <xsl:attribute name="match">row</xsl:attribute>
 	     <xsl:variable name="index" select="position()"/>
 	     <xsl:variable name="nodeex" select="(//group|//row)/item"/>
            <xsl:attribute name="use"><xsl:value-of select="user:getstr($nodeex[position() &lt;=$index +count(//group/item)])"/></xsl:attribute>
         </xsl:element>
      </xsl:for-each>
      <xsl:for-each select="(//col)/item">
         <xsl:value-of select="'&#x000A;'"/>
         <xsl:element name="xsl:key">
             <xsl:attribute name="name"><xsl:value-of select="concat('C',position())"/></xsl:attribute>
             <xsl:attribute name="match">row</xsl:attribute>
 	     <xsl:variable name="index" select="position()"/>
 	     <xsl:variable name="nodeex" select="(//group|//col)/item"/>
            <xsl:attribute name="use"><xsl:value-of select="user:getstr($nodeex[position() &lt;=$index +count(//group/item)])"/></xsl:attribute>
         </xsl:element>
      </xsl:for-each>
      <xsl:value-of select="'&#x000A;'"/>
      <xsl:element name="xsl:template">
          <xsl:attribute name="match">/data</xsl:attribute>
          <xsl:value-of select="'&#x000A;'"/>
          <html>
	  <xsl:value-of select="'&#x000A;'"/>
	<style>
 v\:* { behavior: url(#default#VML); }
 /* Font Definitions */
@font-face
	{font-family:宋体;
	panose-1:2 1 6 0 3 1 1 1 1 1;
	mso-font-alt:SimSun;
	mso-font-charset:134;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:3 135135232 16 0 262145 0;}
@font-face
	{font-family:"\@宋体";
	panose-1:2 1 6 0 3 1 1 1 1 1;
	mso-font-charset:134;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:3 135135232 16 0 262145 0;}
 /* Style Definitions */
p	{margin:0cm;
	mso-style-parent:"";
	margin-bottom:.0001pt;
	line-height:1.2;
	mso-pagination:none;
	mso-layout-grid-align:none;
	font-size:12.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:宋体;}
p.MsoNomal, li.MsoNomal, div.MsoNomal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:center;
	text-justify:inter-ideograph;
	line-height:1.2;
	mso-pagination:none;
	mso-layout-grid-align:none;
	font-size:12.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:宋体;}
td,th
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:center;
	text-justify:inter-ideograph;
	line-height:1.5;
	width:80pt;
	mso-pagination:none;
	mso-layout-grid-align:none;
	font-size:10.5pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:宋体;}
 /* Page Definitions */
p.MsoBodyText, li.MsoBodyText, div.MsoBodyText
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	line-height:1.2;
	mso-pagination:none;
	mso-layout-grid-align:none;
	font-size:12.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:宋体;}
 /* Page Definitions */
@page
	{mso-page-border-surround-header:no;
	mso-page-border-surround-footer:no;}
@page Section1
	{size:21.0cm 842.0pt;
	margin:1.0cm 1.0cm 1.0cm 42.55pt;
	mso-header-margin:42.55pt;
	mso-footer-margin:42.55pt;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
	</style>
	  <body>
	 <xsl:variable name="startindex">
	     <xsl:if test="count(//group/item) &gt; 0">1</xsl:if>
	     <xsl:if test="count(//group/item) &lt; 1">0</xsl:if>
	 </xsl:variable>
         <xsl:call-template name="processGroup">
             <xsl:with-param name="node" select="//group/item"></xsl:with-param>
             <xsl:with-param name="index" select="$startindex"></xsl:with-param>
          </xsl:call-template>
           <xsl:value-of select="'&#x000A;'"/>
 	  </body>
	  <xsl:value-of select="'&#x000A;'"/>
	  </html>
	  <xsl:value-of select="'&#x000A;'"/>
      </xsl:element>
      <xsl:value-of select="'&#x000A;'"/>
  </xsl:element>
</xsl:template>
<xsl:template name="processGroup">
    <xsl:param name="node"/>
    <xsl:param name="index"/>
    <xsl:if test="$index = 0">
 	 <xsl:value-of select="'&#x000A;'"/>
         <table border="0" cellspacing="0" cellpadding="0" style="border-collapse:collapse;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt;border:none">
            <xsl:call-template name="processColHeader"/>
            <xsl:call-template name="processRow">
      	       <xsl:with-param name="node1" select="(//group|//row)/item"></xsl:with-param>
               <xsl:with-param name="index1" select="count($node) + 1"></xsl:with-param>
            </xsl:call-template>
 	    <xsl:value-of select="'&#x000A;'"/>
	 </table>
	 <xsl:value-of select="'&#x000A;'"/>
	 <br/>
    </xsl:if>
    <xsl:if test="$index &lt;= count($node) and $index != 0">
	    <xsl:value-of select="'&#x000A;'"/>
 	     <xsl:element name="xsl:for-each">
                  <xsl:attribute name="select"><xsl:value-of select="user:getkeystr($node[$index  &gt; position()],concat('G',$index - 1))"/>[count(. | key(&apos;<xsl:value-of select="concat('G',$index)"/>&apos;,<xsl:value-of select="user:getstr($node[position() &lt;= $index])"/> )[1])=1]</xsl:attribute>
 		  <xsl:if test="count($node)=$index">
		   <xsl:value-of select="'&#x000A;'"/>
	            <div>
		    <xsl:for-each select="$node">
		      <xsl:value-of select="'&#x000A;'"/>
		       <xsl:element name="span"><xsl:value-of select="."/>:<xsl:element name="xsl:value-of">
			  <xsl:attribute name="select"><xsl:value-of select="."/></xsl:attribute>
		       </xsl:element>
		     </xsl:element>
		    </xsl:for-each>
		    <xsl:value-of select="'&#x000A;'"/>
                    </div>
 		    <xsl:value-of select="'&#x000A;'"/>
                   <table border="0" cellspacing="0" cellpadding="0" style="border-collapse:collapse;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt;border:none">
		   <xsl:value-of select="'&#x000A;'"/>
                   <xsl:call-template name="processColHeader"/>
                 
                    <xsl:call-template name="processRow">
             	       <xsl:with-param name="node1" select="(//group|//row)/item"></xsl:with-param>
                       <xsl:with-param name="index1" select="count($node) + 1"></xsl:with-param>
                    </xsl:call-template>
                    
		    <xsl:value-of select="'&#x000A;'"/>
		    </table>
		    <xsl:value-of select="'&#x000A;'"/>
	            <br/>
		  </xsl:if>
                <xsl:call-template name="processGroup">
             	   <xsl:with-param name="node" select="$node"></xsl:with-param>
                   <xsl:with-param name="index" select="$index+1"></xsl:with-param>
                </xsl:call-template>
	     <xsl:value-of select="'&#x000A;'"/>
	     </xsl:element>
   </xsl:if>
</xsl:template>
<xsl:template name="processRow">
    <xsl:param name="node1"/>
    <xsl:param name="index1"/>
    <xsl:if test="count(//row/item) &lt; 1">
        <xsl:call-template name="processData">
        <xsl:with-param name="node3" select="(//group/item|//col/item)"></xsl:with-param>
        <xsl:with-param name="index3" select="count(//group/item)+1"></xsl:with-param>
        </xsl:call-template>
    </xsl:if> 
     <xsl:if test="$index1 &lt;= count($node1)">
	    <xsl:value-of select="'&#x000A;'"/>
 	     <xsl:element name="xsl:for-each">
                   <xsl:if test="$index1 - 1 - count(//group/item) !=0">
		  <xsl:attribute name="select"><xsl:value-of select="user:getkeystr($node1[$index1  &gt; position()],concat('R',$index1 - 1 - count(//group/item)))"/>[count(. | key(&apos;<xsl:value-of select="concat('R',$index1 - count(//group/item))"/>&apos;,<xsl:value-of select="user:getstr($node1[position() &lt;= $index1])"/> )[1])=1]</xsl:attribute>
                   </xsl:if>
                  <xsl:if test="$index1 - 1 - count(//group/item) =0">
		  <xsl:attribute name="select"><xsl:value-of select="user:getkeystr($node1[$index1  &gt; position()],concat('G',count(//group/item)))"/>[count(. | key(&apos;<xsl:value-of select="concat('R',$index1 - count(//group/item))"/>&apos;,<xsl:value-of select="user:getstr($node1[position() &lt;= $index1])"/> )[1])=1]</xsl:attribute>
                   </xsl:if>
 		 <xsl:value-of select="'&#x000A;'"/>
                 <xsl:element name="xsl:variable">
                  <xsl:attribute name="name"><xsl:value-of select="concat('rownode',$index1 - count(//group/item))"/></xsl:attribute>
		  <xsl:attribute name="select">key(&apos;<xsl:value-of select="concat('R',$index1 - count(//group/item))"/>&apos;,<xsl:value-of select="user:getstr($node1[position() &lt;= $index1])"/>)</xsl:attribute>
		  </xsl:element>

		  <xsl:if test="count($node1)=$index1">
		    <xsl:value-of select="'&#x000A;'"/>
	            <tr>
		    <xsl:for-each select="$node1[position() &gt; count(//group/item)]">
		       <xsl:value-of select="'&#x000A;'"/>
		       <td style="border:solid 0.5pt black; margin:1pt;background=#ececec">
		       <xsl:element name="xsl:value-of">
			  <xsl:attribute name="select"><xsl:value-of select="."/></xsl:attribute>
		       </xsl:element>
		     </td>
		    </xsl:for-each>
                   <xsl:call-template name="processData">
             	     <xsl:with-param name="node3" select="(//group/item|//col/item)"></xsl:with-param>
                     <xsl:with-param name="index3" select="count(//group/item)+1"></xsl:with-param>
                   </xsl:call-template>
		       <xsl:value-of select="'&#x000A;'"/>
                    </tr>
 		  </xsl:if>
                <xsl:call-template name="processRow">
             	   <xsl:with-param name="node1" select="$node1"></xsl:with-param>
                   <xsl:with-param name="index1" select="$index1+1"></xsl:with-param>
                </xsl:call-template>
		       <xsl:value-of select="'&#x000A;'"/>
	     </xsl:element>
   </xsl:if>
</xsl:template>
<xsl:template name="processCol">
    <xsl:param name="node2"/>
    <xsl:param name="index2"/>
     <xsl:if test="$index2 &lt;= count($node2)">
	     <xsl:value-of select="'&#x000A;'"/>
  	     <xsl:element name="xsl:for-each">
                    <xsl:if test="$index2 - 1 - count(//group/item) !=0">
		  <xsl:attribute name="select"><xsl:value-of select="user:getkeystr($node2[$index2  &gt; position()],concat('C',$index2 - 1 - count(//group/item)))"/>[count(. | key(&apos;<xsl:value-of select="concat('C',$index2 - count(//group/item))"/>&apos;,<xsl:value-of select="user:getstr($node2[position() &lt;= $index2])"/> )[1])=1]</xsl:attribute>
                   </xsl:if>
                  <xsl:if test="$index2 - 1 - count(//group/item) =0">
                    <xsl:if test="count(//group/item)!=0">
		  	<xsl:attribute name="select"><xsl:value-of select="user:getkeystr($node2[$index2  &gt; position()],concat('G',count(//group/item)))"/>[count(. | key(&apos;<xsl:value-of select="concat('C',$index2 - count(//group/item))"/>&apos;,<xsl:value-of select="user:getstr($node2[position() &lt;= $index2])"/> )[1])=1]</xsl:attribute>
	  	    </xsl:if>
                    <xsl:if test="count(//group/item)=0">
		  	<xsl:attribute name="select">row[count(. | key(&apos;<xsl:value-of select="concat('C',$index2 - count(//group/item))"/>&apos;,<xsl:value-of select="user:getstr($node2[position() &lt;= $index2])"/> )[1])=1]</xsl:attribute>
	  	    </xsl:if>
                  </xsl:if>
  		  <xsl:if test="count($node2)=$index2" >
   		        <xsl:value-of select="'&#x000A;'"/>
                        <xsl:element name="xsl:variable">
			<xsl:attribute name="name">nodeex</xsl:attribute>
			<xsl:attribute name="select">key(&apos;<xsl:value-of select="concat('C',$index2 - count(//group/item))"/>&apos;,<xsl:value-of select="user:getstr($node2[position() &lt;= $index2])"/>)[count(.|key(&apos;<xsl:value-of select="concat('C',count(//group/item|//col/item) - count(//group/item))"/>&apos;,<xsl:value-of select="user:getstr((//group/item|//col/item))"/>)[1])=1]</xsl:attribute>
		       </xsl:element>
		       <xsl:value-of select="'&#x000A;'"/>
                       <td align="center" style="border:solid 0.5pt black; margin:1pt;background=#ececec">
		       <xsl:value-of select="'&#x000A;'"/>
		       <xsl:element name="xsl:attribute">
		       <xsl:attribute name="name">colspan</xsl:attribute>
		       <xsl:value-of select="'&#x000A;'"/>
                       <xsl:if test="count(//data/item) &lt; 1">
		       <xsl:element name="xsl:value-of">
		       <xsl:attribute name="select">count($nodeex)</xsl:attribute>
		       </xsl:element>
		       </xsl:if>
                       <xsl:if test="count(//data/item) &gt; 0">
		       <xsl:element name="xsl:value-of">
		       <xsl:attribute name="select">count($nodeex)*<xsl:value-of select="count(//data/item)"/></xsl:attribute>
		       </xsl:element>
		       </xsl:if>
		       <xsl:value-of select="'&#x000A;'"/>
		       </xsl:element>
		       <xsl:value-of select="'&#x000A;'"/>
  		       <xsl:element name="xsl:value-of">
			  <xsl:attribute name="select"><xsl:value-of select="$node2[position() = $index2]"/></xsl:attribute>
		       </xsl:element>
		     </td>

                   </xsl:if>
                <xsl:call-template name="processCol">
             	   <xsl:with-param name="node2" select="$node2"></xsl:with-param>
                   <xsl:with-param name="index2" select="$index2+1"></xsl:with-param>
                </xsl:call-template>
		       <xsl:value-of select="'&#x000A;'"/>
	     </xsl:element>
   </xsl:if>
</xsl:template>
<xsl:template name="processData">
    <xsl:param name="node3"/>
    <xsl:param name="index3"/>
    <xsl:if test="count(//col/item) &lt; 1 and count(//row/item) &gt; 0">
  	<xsl:value-of select="'&#x000A;'"/>
        <xsl:for-each select="//data/item">
        <td align="right" style="border:solid 0.5pt black; margin:1pt">
        <xsl:element name="xsl:value-of">
        <xsl:attribute name="select">format-number(sum($rownode<xsl:value-of select="count(//row/item)"/>/<xsl:value-of select="."/>),'#,##0.00')</xsl:attribute>
        </xsl:element>
       </td>
       </xsl:for-each>
     </xsl:if>
    <xsl:if test="count(//col/item) &lt; 1 and count(//row/item) &lt; 1">
  	<xsl:value-of select="'&#x000A;'"/>
         <xsl:element name="xsl:variable">
         <xsl:attribute name="name">datanode</xsl:attribute>
         <xsl:if test="count(//group/item)!=0">
	    <xsl:attribute name="select">key('<xsl:value-of select="concat('G',count(//group/item))"/>',<xsl:value-of select="user:getstr(//group/item)"/>)</xsl:attribute>
         </xsl:if>
         <xsl:if test="count(//group/item) = 0">
	    <xsl:attribute name="select">row</xsl:attribute>
         </xsl:if>
	 </xsl:element>
        <xsl:for-each select="//data/item">
        <td align="right" style="border:solid 0.5pt black; margin:1pt">
        <xsl:element name="xsl:value-of">
        <xsl:attribute name="select">format-number(sum($datanode/<xsl:value-of select="."/>),'#,##0.00')</xsl:attribute>
        </xsl:element>
       </td>
       </xsl:for-each>
     </xsl:if>
     <xsl:if test="$index3 &lt;= count($node3)">
		       <xsl:value-of select="'&#x000A;'"/>
 	     <xsl:element name="xsl:for-each">
                    <xsl:if test="$index3 - 1 - count(//group/item) !=0">
		  <xsl:attribute name="select"><xsl:value-of select="user:getkeystr($node3[$index3  &gt; position()],concat('C',$index3 - 1 - count(//group/item)))"/>[count(. | key(&apos;<xsl:value-of select="concat('C',$index3 - count(//group/item))"/>&apos;,<xsl:value-of select="user:getstr($node3[position() &lt;= $index3])"/> )[1])=1]</xsl:attribute>
                   </xsl:if>
                  <xsl:if test="$index3 - 1 - count(//group/item) =0">
                     <xsl:if test="count(//group/item)!=0">
		        <xsl:attribute name="select"><xsl:value-of select="user:getkeystr($node3[$index3  &gt; position()],concat('G',count(//group/item)))"/>[count(. | key(&apos;<xsl:value-of select="concat('C',$index3 - count(//group/item))"/>&apos;,<xsl:value-of select="user:getstr($node3[position() &lt;= $index3])"/> )[1])=1]</xsl:attribute>
                     </xsl:if>
                     <xsl:if test="count(//group/item)=0">
		        <xsl:attribute name="select">//row[count(. | key(&apos;<xsl:value-of select="concat('C',$index3 - count(//group/item))"/>&apos;,<xsl:value-of select="user:getstr($node3[position() &lt;= $index3])"/> )[1])=1]</xsl:attribute>
                     </xsl:if>
                   </xsl:if>
 		 <xsl:value-of select="'&#x000A;'"/>
                 <xsl:element name="xsl:variable">
                  <xsl:attribute name="name"><xsl:value-of select="concat('colnode',$index3 - count(//group/item))"/></xsl:attribute>
		  <xsl:attribute name="select">key(&apos;<xsl:value-of select="concat('C',$index3 - count(//group/item))"/>&apos;,<xsl:value-of select="user:getstr($node3[position() &lt;= $index3])"/>)</xsl:attribute>
		  </xsl:element>
		  <xsl:if test="count($node3)=$index3">
 		       <xsl:value-of select="'&#x000A;'"/>
                      <xsl:for-each select="//data/item">
                      <td align="right" style="border:solid 0.5pt black; margin:1pt">
                       <xsl:element name="xsl:value-of">
                            <xsl:if test="count(//row/item) &gt; 0 and count(//col/item) &gt; 0">
                            <xsl:attribute name="select">format-number(sum($rownode<xsl:value-of select="count(//row/item)"/>/<xsl:value-of select="."/>)+sum($colnode<xsl:value-of select="count(//col/item)"/>/<xsl:value-of select="."/>) - sum(($rownode<xsl:value-of select="count(//row/item)"/>|$colnode<xsl:value-of select="count(//col/item)"/>)/<xsl:value-of select="."/>),'  #,##0.00')</xsl:attribute>
                            </xsl:if>
                            <xsl:if test="count(//row/item) &gt; 0 and count(//col/item) &lt; 1">
                            <xsl:attribute name="select">format-number(sum($rownode<xsl:value-of select="count(//row/item)"/>/<xsl:value-of select="."/>),'#,##0.00')</xsl:attribute>
                            </xsl:if>
                            <xsl:if test="count(//row/item) &lt; 1 and count(//col/item) &gt; 0">
                            <xsl:attribute name="select">format-number(sum($colnode<xsl:value-of select="count(//col/item)"/>/<xsl:value-of select="."/>),'#,##0.00')</xsl:attribute>
                            </xsl:if>
                       </xsl:element>
                      </td>
                      </xsl:for-each>
  		  </xsl:if>
                <xsl:call-template name="processData">
             	   <xsl:with-param name="node3" select="$node3"></xsl:with-param>
                   <xsl:with-param name="index3" select="$index3+1"></xsl:with-param>
                </xsl:call-template>
		       <xsl:value-of select="'&#x000A;'"/>
	     </xsl:element>
   </xsl:if>
</xsl:template>
<xsl:template name="processColHeader">
        <xsl:text disable-output-escaping = "yes">&lt;tr&gt;</xsl:text>
 	<xsl:for-each select="//row/item">
	  <xsl:value-of select="'&#x000A;'"/>
          <th style="border:solid 0.5pt black; margin:1pt;background=#ececec">
	      <xsl:choose>
	      	 <xsl:when test="count(//col/item) &lt; 1">
                 	<xsl:value-of select="."></xsl:value-of>
	      	 </xsl:when>
	         <xsl:otherwise>
			<xsl:if test="count(//data/item) &gt; 0">
				<xsl:attribute name="rowspan"><xsl:value-of select="count(//col/item)+1"/></xsl:attribute>
				<xsl:value-of select="."></xsl:value-of>
			</xsl:if>
			<xsl:if test="count(//data/item) &lt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="count(//col/item)"/></xsl:attribute>
				<xsl:value-of select="."></xsl:value-of>
			</xsl:if>
		 </xsl:otherwise>
	      </xsl:choose>
          </th>
        </xsl:for-each>
	<xsl:choose>
          <xsl:when test="count(//data/item) &gt; 0 and count(//col/item) &lt; 1 ">
             <xsl:for-each select="//data/item">
	  	<xsl:value-of select="'&#x000A;'"/>
          	<th style="border:solid 0.5pt black; margin:1pt;background=#ececec">
             		<xsl:value-of select="."></xsl:value-of>
          	</th>
              </xsl:for-each>
	  </xsl:when>
	</xsl:choose>
        <xsl:for-each select="//col/item">
 	  <xsl:variable name="indexcol" select="position()"/>
	  <xsl:value-of select="'&#x000A;'"/>
          <xsl:if test="$indexcol !=1"><xsl:text disable-output-escaping = "yes">&lt;tr&gt;</xsl:text></xsl:if>
          <xsl:call-template name="processCol">
              <xsl:with-param name="node2" select="(//group/item|//col/item)[position() &lt;= $indexcol + count(//group/item)]"></xsl:with-param>
              <xsl:with-param name="index2" select="count(//group/item)+1"></xsl:with-param>
           </xsl:call-template>
           <xsl:value-of select="'&#x000A;'"/>
 	   <xsl:text disable-output-escaping = "yes">&lt;/tr&gt;</xsl:text>
        </xsl:for-each>
        <xsl:if test="count(//data/item) &gt; 0 and count(//col/item) &gt; 0 ">
            <xsl:value-of select="'&#x000A;'"/>
            <xsl:if test="count(//col/item) &gt; 0">
   	         <xsl:value-of select="'&#x000A;'"/>
                 <xsl:text disable-output-escaping = "yes">&lt;tr&gt;</xsl:text>
   		 <xsl:value-of select="'&#x000A;'"/>
                 <xsl:element name="xsl:variable">
                    <xsl:attribute name="name">nodeex</xsl:attribute>
                    <xsl:if test="count(//group/item)!=0">
		    <xsl:attribute name="select">key(&apos;<xsl:value-of select="concat('G',count(//group/item))"/>&apos;,<xsl:value-of select="user:getstr(//group/item)"/>)[count(.|key(&apos;<xsl:value-of select="concat('C',count(//group/item|//col/item) - count(//group/item))"/>&apos;,<xsl:value-of select="user:getstr((//group/item|//col/item))"/>)[1])=1]</xsl:attribute>
                    </xsl:if>
                    <xsl:if test="count(//group/item)=0">
		    <xsl:attribute name="select">row[count(.|key(&apos;<xsl:value-of select="concat('C',count(//group/item|//col/item) - count(//group/item))"/>&apos;,<xsl:value-of select="user:getstr((//group/item|//col/item))"/>)[1])=1]</xsl:attribute>
                    </xsl:if>
		 </xsl:element>
		 <xsl:value-of select="'&#x000A;'"/>
		 <xsl:element name="xsl:for-each">
		     <xsl:attribute name="select">$nodeex</xsl:attribute>
		     <xsl:for-each select="//data/item">
		        <xsl:value-of select="'&#x000A;'"/>
                        <th align="center" style="border:solid 0.5pt black; margin:1pt;background=#ececec">
		          <xsl:value-of select="'&#x000A;'"/>
   		          <xsl:value-of select="."></xsl:value-of>
		        </th>                
		      </xsl:for-each>
		  </xsl:element>
              </xsl:if>
   	      <xsl:value-of select="'&#x000A;'"/>
              <xsl:text disable-output-escaping = "yes">&lt;/tr&gt;</xsl:text>
              <xsl:value-of select="'&#x000A;'"/>
         </xsl:if>
         <xsl:value-of select="'&#x000A;'"/>
         <xsl:if test="count(//data/item) &gt; 0 and count(//col/item) &lt; 1"><xsl:text disable-output-escaping = "yes">&lt;/tr&gt;</xsl:text></xsl:if>
         <xsl:if test="count(//data/item) &lt; 1 and count(//col/item) &lt; 1"><xsl:text disable-output-escaping = "yes">&lt;/tr&gt;</xsl:text></xsl:if>
</xsl:template>

</xsl:stylesheet>
