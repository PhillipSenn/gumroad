<cfscript>
request.fw.Container = false
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="css/fireworks.css">
<link rel="stylesheet" href="Index.css">
<cfinclude template="/Inc/body.cfm">
<aside id="library">
	<img src="images/nightsky.png" id="nightsky" />
	<img src="images/big-glow.png" id="big-glow" />
	<img src="images/small-glow.png" id="small-glow" />
</aside>
<cfinclude template="/Inc/foot.cfm">
<script src="js/requestanimframe.js"></script>
<script src="js/fireworks.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>