<!--- Get Article --->
<cfif isDefined("url.p")>
	<cffile action="read" file="#GetDirectoryFromPath( GetCurrentTemplatePath() )#txt/fitness-tips/#url.p#.txt" variable="articleContent" />
<cfelse>
	<cffile action="read" file="#GetDirectoryFromPath( GetCurrentTemplatePath() )#txt/fitness-tips/basic-exercise.txt" variable="articleContent" />
</cfif>

<!--- Header --->
<cfset pageTitle="Fitness Tips" />
<cfset bodyClass="fitness" />
<cfinclude template="header.cfm" />

<!--- Page contents can go here --->
<div id="breadcrumbs">
    <p>Breadcrumbs</p>
    <ul>
        <li><a href="index.cfm">Fitness Movement</a></li>
        <li><a href="fitness-tips.cfm">Fitness Tips</a></li>
		<cfoutput>
		<cfif isDefined("url.p")>
        <li><a href="fitness-tips.cfm?p=#url.p#">Article</a></li>
        <cfelse>
        <li><a href="fitness-tips.cfm">Article</a></li>
        </cfif>
		</cfoutput>
    </ul>
</div>

<!-- It is span here because we want h2 to be the product title not the section -->

<div id="page-wrap">
	
	<cfoutput>
	<div id="fitness-article">
		#articleContent#
	</div>
	</cfoutput>
	
	<div id="fitness-article-archives">
		<h4>More Fitness Tips</h4>
		<ul>
			<li>
				<p class="title"><a href="fitness-tips.cfm?p=basic-exercise">Exercise Basics</a></p>
				<p class="date">12/05/2012</p>
			</li>
			<li>
				<p class="title"><a href="fitness-tips.cfm?p=dumbells">Using Dumbells Effectively</a></p>
				<p class="date">11/05/2012</p>
			</li>
			<li>
				<p class="title"><a href="fitness-tips.cfm?p=plan-a-workout">How to Plan A Workout</a></p>
				<p class="date">10/05/2012</p>
			</li>
			<li>
				<p class="title"><a href="fitness-tips.cfm?p=healthy-eating">Healthy Eating</a></p>
				<p class="date">09/05/2012</p>
			</li>
		</ul>
	</div>
</div>

<cfinclude template="footer.cfm" />