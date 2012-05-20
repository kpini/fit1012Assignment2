<!--- Header --->
<cfquery name="getProductCode" datasource="fit1012" username="fit1012" password="fit1012">
	select * from PP_PARTS where PART_NUMBER = 'BH22'
</cfquery>
<cfinclude template="header.cfm" />

<!--- Page contents can go here --->
<div id="breadcrumbs">
    <p>Breadcrumbs</p>
    <ul>
        <li><a href="index.cfm">Fitness Movement</a></li>
        <li><a href="products.cfm">Products</a></li>
				<li><a href="productPage.cfm?id=BH22">Dartboard</a></li>
    </ul>
</div>

<!-- It is span here because we want h2 to be the product title not the section -->
<span id="page-title">Products</span>

<div id="page-wrap">
	
	<cfoutput query="getProductCode">
	<div id="products-details">
		<div id="item-header">
			<img src="http://placehold.it/420x250/" alt="Placeholder" />
			<h2>"#PART_DESCRIPTION#"</h2>
			<p class="itemNumber">Product Code: #PART_NUMBER#</p>
			<p class="priceItem">Our Price: <span>$#UNIT_PRICE#</span></p>
			<p class="qtyOnHand">Quantity on Hand: <span>#UNITS_ON_HAND# available</span></p>
		</div>
		<div id="item-description">
			<h3>Product Description</h3>
			<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
			<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
		</div>
		<div id="item-sidebar">
			<h3>Item Details</h3>
			<dl id="item-details">
				<dt>Category</dt>
				<dd>#ITEM_CLASS#</dd>
				<dt>Country:</dt>
				<cfif #WAREHOUSE_NUMBER# = 1>
				<dd>Australia</dd>
				<cfelseif #WAREHOUSE_NUMBER# = 1>
				<dd>Germany</dd>
				<cfelseif #WAREHOUSE_NUMBER# = 3>
				<dd>China</dd>
				</cfif>
				<!--- Depending on item --->
				<dt>Sizes</dt>
				<dd>S, M, L, XL, XXL</dd>
				<dt>Colour</dt>
				<dd>Red, Black, Blue, White</dd>
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
			<li><a href="products.cfm?cat=AP">Applications</a></li>
			<li><a href="products.cfm?cat=HW">Homewares</a></li>
			<li><a href="products.cfm?cat=SG">Sporting Goods</a></li>
		</ul>
	</div>
</div>

<cfinclude template="footer.cfm" />