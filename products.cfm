<!--- Header --->
<cfinclude template="header.cfm" />

<!--- Page contents can go here --->
<div id="breadcrumbs">
    <p>Breadcrumbs</p>
    <ul>
        <li><a href="index.cfm">Fitness Movement</a></li>
        <li><a href="products.cfm">Products</a></li>
    </ul>
</div>

<h2 id="page-title">Products</h2>

<div id="page-wrap">
	<div id="products-categories">
		<h3>Product Categories</h3>
		<ul>
			<li<cfif !IsDefined("URL.cat")> class="selected"</cfif>><a href="products.cfm">All Products</a></li>
			<li<cfif IsDefined("URL.cat") and #URL.cat# is "AP"> class="selected"</cfif>><a href="products.cfm?cat=AP">Applications</a></li>
			<li<cfif IsDefined("URL.cat") and #URL.cat# is "HW"> class="selected"</cfif>><a href="products.cfm?cat=HW">Homewares</a></li>
			<li<cfif IsDefined("URL.cat") and #URL.cat# is "SG"> class="selected"</cfif>><a href="products.cfm?cat=SG">Sporting Goods</a></li>
		</ul>
	</div>
	<div id="products-results">
		<form id="store-search" method="get" action="products.cfm" onsubmit="checkProductForm(this); return false;">
		<h3>Search</h3>
		<p class="name">
			<label for="q">By product name:</label>
			<input type="text" name="q" id="q" />
		</p>
		<p class="price">
			<span>Or by price:</span>
			<label for="priceMin">Min:</label>
			<input type="text" name="priceMin" id="priceMin" />
			<label for="priceMax">Max:</label>
			<input type="text" name="priceMax" id="priceMax" />
		</p>
		<p>
			<button id="search-btn" type="submit">Search Now</button>
		</p>
		</form>
		<div id="search-query">
			<cfif IsDefined("URL.q") or isDefined("URL.priceMin") or IsDefined("URL.priceMax")>
			<h3>Search Results</h3>
			<cfelseif IsDefined("URL.cat") and #URL.cat# is "AP">
			<h3>Viewing All Category 1</h3>
			<cfelseif IsDefined("URL.cat") and #URL.cat# is "HW">
			<h3>Viewing All Category 2</h3>
			<cfelseif IsDefined("URL.cat") and #URL.cat# is "SG">
			<h3>Viewing All Category 3</h3>
			<cfelse>
			<h3>Viewing All Products</h3>
			</cfif>
			<cfquery name="getParts" datasource="fit1012" username="fit1012" password="fit1012">
				select * from PP_PARTS
				<cfif IsDefined("URL.q") > <!--- Start with Name --->
					where ucase(PART_DESCRIPTION) like ucase('%#URL.q#%')	
					<cfif isDefined("URL.priceMin") or IsDefined("URL.priceMax")> <!--- If price range is also used --->
					AND UNIT_PRICE between
						<cfif IsDefined("URL.priceMin") >
							#URL.priceMin#
						<cfelse>
							0
						</cfif>			
						<cfif IsDefined("URL.priceMax") >
							and #URL.priceMax#
						<cfelse>
							and 500
						</cfif>
					</cfif>	
				<cfelseif isDefined("URL.priceMin") or IsDefined("URL.priceMax")> <!--- Starting with Price Range --->
					where UNIT_PRICE between
					<cfif IsDefined("URL.priceMin") >
						#URL.priceMin#
					<cfelse>
						0
					</cfif>				
					<cfif IsDefined("URL.priceMax") >
						and #URL.priceMax#
					<cfelse>
						and 500
					</cfif>
				<cfelseif IsDefined("URL.cat")>
					where ITEM_CLASS = '#URL.cat#'
				</cfif>
			</cfquery>
			<ul id="productList">
			<cfoutput query="getParts">
				<li>
					<img src="img/products/thumbnails/#lcase(PART_NUMBER)#.JPG" alt="#PART_DESCRIPTION#" />
					<p class="productName">#PART_DESCRIPTION#</p>
					<p class="productCode">#PART_NUMBER#</p>
					<p class="productPrice">$#UNIT_PRICE#</p>
				</li>
			</cfoutput>
			</ul>
		</div>
	</div>
</div>

<cfinclude template="footer.cfm" />