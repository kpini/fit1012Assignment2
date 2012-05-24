<!--- Header --->
<cfinclude template="header.cfm" />

<!--- Queries --->
<cfquery name="getNewProducts" datasource="fit1012" username="fit1012" password="fit1012">
select * from PP_PARTS where PART_NUMBER like 'A%' OR PART_NUMBER like 'BA%'
</cfquery>
<cfquery name="getSaleProducts" datasource="fit1012" username="fit1012" password="fit1012">
select * from PP_PARTS where UNITS_ON_HAND > 90
</cfquery>
<cfquery name="getBestProducts" datasource="fit1012" username="fit1012" password="fit1012">
select * from PP_PARTS where UNIT_PRICE > 200
</cfquery>
<cffile action="read"  file="#GetDirectoryFromPath( GetCurrentTemplatePath() )#txt/slider.txt"  variable="slides" />

<!--- Page contents can go here --->
<div id="homeSlider">
	<cfoutput>#slides#</cfoutput>
</div>
	
<div id="featured" class="threeCol">
	<div class="col first">
		<a href="products.cfm?cat=HW"><img src="img/homepage/clothing-clearance.jpg" width="300" height="120" alt="Clothing Clearance - now on at Fitness Movement" /></a>
	</div>
	<div class="col">
		<a href="productPage.cfm?id=cb03"><img src="img/homepage/new-bike.jpg" width="300" height="120" alt="Get a brand new bike for $299.99" /></a>
	</div>
	<div class="col">
		<a href="products.cfm?cat=AP"><img src="img/homepage/need-shoes.jpg" width="300" height="120" alt="Need Shoes? Fitness Movement has got you covered. View our collection!" /></a>
	</div>
</div>
	
<div id="shop" class="threeCol">
	<div class="col first">
		<h3>New Products</h3>
		<ul>
			<cfoutput query="getNewProducts">
				<li>
					<a href="productPage.cfm?id=#lcase(PART_NUMBER)#"><img src="img/products/thumbnails/#lcase(PART_NUMBER)#.JPG" alt="#PART_DESCRIPTION#" /></a>
					<p class="productName"><a href="productPage.cfm?id=#lcase(PART_NUMBER)#">#PART_DESCRIPTION#</a></p>
					<p class="productCode">#PART_NUMBER#</p>
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
					<a href="productPage.cfm?id=#lcase(PART_NUMBER)#"><img src="img/products/thumbnails/#lcase(PART_NUMBER)#.JPG" alt="#PART_DESCRIPTION#" /></a>
					<p class="productName"><a href="productPage.cfm?id=#lcase(PART_NUMBER)#">#PART_DESCRIPTION#</a></p>
					<p class="productCode">#PART_NUMBER#</p>
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
					<a href="productPage.cfm?id=#lcase(PART_NUMBER)#"><img src="img/products/thumbnails/#lcase(PART_NUMBER)#.JPG" alt="#PART_DESCRIPTION#" /></a>
					<p class="productName"><a href="productPage.cfm?id=#lcase(PART_NUMBER)#">#PART_DESCRIPTION#</a></p>
					<p class="productCode">#PART_NUMBER#</p>
					<p class="productPrice">$#UNIT_PRICE#</p>
				</li>
			</cfoutput>
		</ul>
	</div>
</div>

<cfinclude template="footer.cfm" />