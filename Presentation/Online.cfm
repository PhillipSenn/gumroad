<cfscript>
include '/Inc/Paper.cfm'
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<p>#ActDesc#</p>
It's ok for your presentation to be entertaining! A good presentation is informative <em>and</em> entertaining.
<dl>
	<cfloop query="Guess">
		<dt>#QuestionName#</dt>
		<dd>#AnswerName#</dd>
	</cfloop>
</ul>
<form method="post" action="OnlineAction.cfm">
	<label for="PaperName">Please paste the url to your presentation here:</label>
	<input name="PaperName" value="#PaperName#">
	<p>
		<button name="Save" type="submit">Save</button>
	</p>
	<input type="hidden" name="PaperID" value="#PaperID#">
</form>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>