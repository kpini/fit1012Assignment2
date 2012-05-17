<!--- Header --->
<cfinclude template="header.cfm" />

<!--- Page contents can go here --->
<div id="breadcrumbs">
    <p>Breadcrumbs</p>
    <ul>
        <li><a href="#">Fitness Movement</a></li>
        <li><a href="#">Products</a></li>
    </ul>
</div>

<h2 id="page-title">Products</h2>

<form id="store-search" method="get" action="">
<p>
	<label for="q">Product Name:</label>
    <input type="text" name="q" id="q" />
</p>
<p>
	<span>Search by price range:</span><label for="priceMin">Min</label>
	<input type="text" name="priceMin" id="priceMin" />
	<label for="priceMax">Max</label>
	<input type="text" name="priceMax" id="priceMax" />
</p>
<p>
	<label for="productCat">Search Category</label>
	<select name="productCat">
		<option value="all">All Products</option>
		<option value="AP">Appliances</option>
		<option value="HW">Homewares</option>
		<option value="SG">Sporting Goods</option>
	</select>
</p>
<p>
	<button id="search-btn">Search Now</button>
</p>
</form>



<div id="search-query">
	<h3>Search Results</h3>
	<cfquery name="getParts" datasource="fit1012" username="fit1012" password="fit1012">
		select * from PP_PARTS
		<!--- Start with Name --->
		<cfif IsDefined("URL.productName") >
			where ucase(PART_DESCRIPTION) like ucase('%#URL.productName#%')	
			<!--- If price range is also used --->
			<cfif isDefined("URL.priceMin") or IsDefined("URL.priceMax")>
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
			<!--- Starting with Price Range --->
		<cfelseif isDefined("URL.priceMin") or IsDefined("URL.priceMax")>
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
		</cfif>
	</cfquery>
    
    <ul id="productList">
    <cfoutput query="getParts">
    <li>
    	<img src="http://placehold.it/90x90/" alt="Placeholder" />
		<p class="productName">#PART_DESCRIPTION#</p>
        <p class="productCode">#PART_NUMBER#</p>
		<p class="productPrice">#UNIT_PRICE#</p>
    </li>
    </cfoutput>
    </ul>
</div>

<cfinclude template="footer.cfm" />