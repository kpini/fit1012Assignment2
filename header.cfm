<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Fitness Movement</title>
<link type="text/css" rel="stylesheet" href="css/reset.css" />
<link type="text/css" rel="stylesheet" href="css/style.css" />

<script type="text/javascript" src="js/jquery.js"></script>
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

<body>

<div id="header">
	<h1>Fitness Movement</h1>
	<form id="search-form" action="products.cfm">
		<h2>Search the site</h2>
		<input type="text" name="q" id="q" />
		<button id="search-btn">Search Now</button>
	</form>
</div>

<div id="layout">