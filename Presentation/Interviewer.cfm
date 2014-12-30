<cfscript>
include '/Inc/Paper.cfm'
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<p>#ActDesc#</p>
<p>#QuestionName#</p>
<p>#AnswerName#</p>
<form method="post" action="InterviewerAction.cfm">
	<textarea name="GuessName" rows="10" autofocus>#GuessName#</textarea>
	<p>
		<button type="submit" name="Save">Save</button>
	</p>
	<input type="hidden" name="GuessID" value="#GuessID#">
</form>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>