<cfscript>
include '/Inc/Paper.cfm'
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<p>#ActDesc#</p>
<a href="#request.fw.home#" class="btn-warning">This assignment begins #DateFormat(AssignmentStart,"mm/dd")#.</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>