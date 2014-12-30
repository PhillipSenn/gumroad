<cfscript>
if (IsDefined('form.Save')) {
	new Reset().Save()
	location(request.fw.home,false)
}
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
Some students have asked if they could retake the quizzes.
<p>This will reset all 6 so that you can take them over again.</p>
<form method="post">
	<p>
		<button type="submit" name="Save">Reset them all to 0!</button>
	</p>
</form>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>