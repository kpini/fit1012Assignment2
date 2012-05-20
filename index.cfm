<!--- Header --->
<cfinclude template="header.cfm" />

<!--- Page contents can go here --->
<cfquery name="getNewProducts" datasource="fit1012" username="fit1012" password="fit1012"> 	
select * from PP_PARTS where PART_NUMBER like 'A%' OR  PART_NUMBER like 'BA%' 
</cfquery>
<cfquery name="getSaleProducts" datasource="fit1012" username="fit1012" password="fit1012"> 	
select * from PP_PARTS where UNITS_ON_HAND > 90
</cfquery>
<cfquery name="getBestProducts" datasource="fit1012" username="fit1012" password="fit1012"> 	
select * from PP_PARTS where UNIT_PRICE > 200
</cfquery>
<cffile action="read"  file="#GetDirectoryFromPath( GetCurrentTemplatePath() )#headline1.txt"  variable="headline1" />
<cffile action="read"  file="#GetDirectoryFromPath( GetCurrentTemplatePath() )#headline2.txt"  variable="headline2" />
<cffile action="read"  file="#GetDirectoryFromPath( GetCurrentTemplatePath() )#headline3.txt"  variable="headline3" />
 
<div id="homeSlider">
	<cfoutput>#headline1#</cfoutput>
    <cfoutput>#headline2#</cfoutput>
    <cfoutput>#headline3#</cfoutput>
</div>
	
<div id="featured" class="threeCol">
	<div class="col first">
		<img src="http://placehold.it/300x120/" alt="Placeholder" />
	</div>
	<div class="col">
		<img src="http://placehold.it/300x120/" alt="Placeholder" />
	</div>
	<div class="col">
		<img src="http://placehold.it/300x120/" alt="Placeholder" />
	</div>
</div>
	
<div id="shop" class="threeCol">
	<div class="col first">
		<h3>New Products</h3>
		<ul>
			<cfoutput query="getNewProducts">
            <li>
                    <img src="img/products/thumbnails/#lcase(PART_NUMBER)#.JPG" alt="#PART_DESCRIPTION#" />
                    <p class="productName">#PART_DESCRIPTION#</p>
                    <p class="productPrice">$#UNIT_PRICE#</p>
            </li>
            </cfoutput>
		</ul>
	</div>
	<div class="col">
		<h3>On Sale</h3>
		<ul>
			<cfoutput query="getSaleProducts">
            <li>
                    <img src="img/products/thumbnails/#lcase(PART_NUMBER)#.JPG" alt="#PART_DESCRIPTION#" />
                    <p class="productName">#PART_DESCRIPTION#</p>
                    <p class="productPrice">$#UNIT_PRICE#</p>
            </li>
            </cfoutput>
		</ul>
	</div>
	<div class="col">
		<h3>Best Sellers</h3>
		<ul>
			<cfoutput query="getBestProducts">
            <li>
                    <img src="img/products/thumbnails/#lcase(PART_NUMBER)#.JPG" alt="#PART_DESCRIPTION#" />
                    <p class="productName">#PART_DESCRIPTION#</p>
                    <p class="productPrice">$#UNIT_PRICE#</p>
            </li>
            </cfoutput>
		</ul>
	</div>
</div>

<cfinclude template="footer.cfm" />