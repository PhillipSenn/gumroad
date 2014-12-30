<cfscript>
include '/Inc/Paper.cfm'
Guess = new MC().NextQuestion(Paper)
if (!Guess.recordCount) {
	if (Paper.Earned >= 100) {
		location('../Fireworks-master',false)
	} else {
		location('MCReview.cfm?ActSort=' & url.ActSort,false)
	}
}
Answer = new MC().WhereQuestionID(Guess)
request.fw.ShowProgress = true
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="MC.css">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<form method="post" action="MCAction.cfm?ActSort=#url.ActSort#">
	<fieldset>
		<legend>Q:</legend>
		#QuestionName#
		<cfloop query="Answer">
			<div class="radio">
				#Chr(currentRow+64)#.
				<label>
					<input type="radio" value="#AnswerID#" name="AnswerID">#AnswerName#
				</label>
			</div>
		</cfloop>
	</fieldset>
	<p>
		<button name="Save" type="submit">Save</button>
	</p>
	<input type="hidden" name="GuessID" value="#GuessID#">
	<input type="hidden" name="AnswerIDs" value="#ValueList(Answer.AnswerID)#">
</form>

<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>