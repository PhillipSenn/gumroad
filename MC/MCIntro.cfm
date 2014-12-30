<cfscript>
include '/Inc/Paper.cfm'
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
#ActDesc#
<p>
And <a href="https://vimeo.com/user24059963/videos">Here's all 9 videos on 1 page</a>.
</p>
<p>
	<a class="btn-primary" href="MC.cfm?ActSort=#url.ActSort#">Ready!</a>
</p>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>