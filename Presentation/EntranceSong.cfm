<cfscript>
include '/Inc/Paper.cfm'
OtherGuess = new EntranceSong().WhereActID(Paper)
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<p>#ActDesc#</p>
<form method="post" action="EntranceSongAction.cfm">
	<label for="GuessName">#QuestionName#</label>
	<input name="GuessName" placeholder="#AnswerName#" value="#GuessName#">
	<p>#QuestionDesc#</p>
	<label for="GuessComment">Beginning at what minute and second?</label>
	<input name="GuessComment" placeholder="10 seconds" value="#GuessComment#">
	<p>
		<button type="submit" name="Save">Save</button>
	</p>
	<input type="hidden" name="GuessID" value="#GuessID#">
</form>
<fieldset>
	<legend>Here's what other students are using:</legend>
	<table>
		<cfloop query="OtherGuess">
			<tr>
				<td title="#DisplayName#">#FirstName#</td>
				<td>#GuessName#</td>
				<td>#GuessComment#</td>
			</tr>
		</cfloop>
	</table>
</fieldset>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>