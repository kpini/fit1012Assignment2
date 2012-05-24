<!--- Get Data --->
<cfif isDefined("url.id") is "" or !isDefined("url.id")><cfset url.id = "BH22"></cfif>
<cfquery name="getProductCode" datasource="fit1012" username="fit1012" password="fit1012">
	select * from PP_PARTS where PART_NUMBER = '#ucase(url.id)#'
</cfquery>
<cffile action="read" file="#GetDirectoryFromPath( GetCurrentTemplatePath() )#txt/products/#url.id#.txt"  variable="productDetails" />

<!--- Header --->
<cfoutput query="getProductCode">
<cfset pageTitle="Products - #PART_DESCRIPTION#" />
<cfset bodyClass="products pid-#PART_NUMBER#" />
</cfoutput>
<cfinclude template="header.cfm" />

<!--- Page contents can go here --->
<div id="breadcrumbs">
    <p>Breadcrumbs</p>
    <ul>
        <li><a href="index.cfm">Fitness Movement</a></li>
        <li><a href="products.cfm">Products</a></li>
		<cfoutput query="getProductCode"><li><a href="productPage.cfm?id=#url.id#">#PART_DESCRIPTION#</a></li></cfoutput>
    </ul>
</div>

<!-- It is span here because we want h2 to be the product title not the section -->
<span id="page-title">Products</span>

<div id="page-wrap">
	
	<cfoutput query="getProductCode">
	<div id="products-details">
		<div id="item-header">
			<img src="img/products/full/#lcase(PART_NUMBER)#.JPG" alt="Image of #PART_DESCRIPTION#" width="420" height="350" />
			<h2>#PART_DESCRIPTION#</h2>
			<p class="itemNumber">Product Code: #PART_NUMBER#</p>
			<p class="priceItem">Our Price: <span>$#UNIT_PRICE#</span></p>
			<p class="qtyOnHand">Quantity on Hand: <span>#UNITS_ON_HAND# available</span></p>
		</div>
		<div id="item-description">
			<h3>Product Description</h3>
			#productDetails#
		</div>
		<div id="item-sidebar">
			<h3>Item Details</h3>
			<dl id="item-details">
			
				<dt>Category</dt>
        <cfif #ITEM_CLASS# is "SG">
				<dd>Equipment</dd>
        <cfelseif #ITEM_CLASS# is "AP">
				<dd>Shoes</dd>
        <cfelseif #ITEM_CLASS# is "HW">
				<dd>Apparel</dd>
        </cfif>
                
				<dt>Country:</dt>
				<cfif #WAREHOUSE_NUMBER# is 1>
				<dd>Australia</dd>
				<cfelseif #WAREHOUSE_NUMBER# is 2>
				<dd>Germany</dd>
				<cfelseif #WAREHOUSE_NUMBER# is 3>
				<dd>China</dd>
				</cfif>

				<cfif #ITEM_CLASS# is "HW">
				<dt>Sizes</dt>
				<dd>S, M, L, XL, XXL</dd>
				<dt>Colour</dt>
				<dd>Red, Black, Blue, White, Orange, Green</dd>
				</cfif>
				
				<cfif #ITEM_CLASS# is "AP">
				<dt>Sizes</dt>
				<dd>6, 7, 8, 9, 10, 11, 12</dd>
				<dt>Colour</dt>
				<dd>Black, Red, Blue</dd>
				</cfif>
				
			</dl>
			<div id="how-to-order">
				<h3>How to Order?</h3>
				<p>Call <strong>1300 123 456</strong> and quote the product code <strong>#PART_NUMBER#</strong> when ordering.</p>
			</div>
		</div>
	</div>
	</cfoutput>
	
	<div id="products-categories">
		<h4>Product Categories</h4>
		<ul>
			<li><a href="products.cfm">All Products</a></li>
			<li><a href="products.cfm?cat=HW">Apparel</a></li>
			<li><a href="products.cfm?cat=AP">Shoes</a></li>
			<li><a href="products.cfm?cat=SG">Equipment</a></li>
		</ul>
	</div>
</div>



<cfinclude template="footer.cfm" />