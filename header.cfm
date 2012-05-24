<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Fitness Movement <cfif isDefined('pageTitle')><cfoutput> - #pageTitle#</cfoutput></cfif></title>
<link type="text/css" rel="stylesheet" href="css/reset.css" />
<link type="text/css" rel="stylesheet" href="css/style.css" />

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#homeSlider').bxSlider({
		auto: true,
		tickerSpeed: 10000,
		controls: false,
		pager: true
	});
});
</script>
</head>

<body<cfif isDefined('bodyClass')><cfoutput> class="#bodyClass#"</cfoutput></cfif>>

<div id="header">
	<h1><a href="index.cfm">Fitness Movement</a></h1>
	<form id="search-form" action="products.cfm">
		<fieldset>
			<h2>Search the site</h2>
			<input type="text" name="q" id="q" />
			<button id="search-btn">Search Now</button>
		</fieldset>
	</form>
</div>

<div id="layout">