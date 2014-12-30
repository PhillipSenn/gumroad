<cfscript>
include '/Inc/Paper.cfm'
param name='url.QuestionSort' default=1;
Guess = new Interviewee().WhereQuestionSort(url)
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/m/html.cfm">
<cfinclude template="/Inc/m/body.cfm">
<div data-role="page">
	<div data-role="header">
		<h1>#QuestionName#</h1>
	</div>
	<div data-role="main" class="ui-content">
		<form method="post" action="IntervieweeAction.cfm">
			<input name="GuessName" autofocus>
			<button type="submit" name="Save">Save</button>
			<input type="hidden" name="GuessID" value="#GuessID#">
			(#Points# points)
		</form>
	</div>
</div> 
<cfinclude template="/Inc/m/foot.cfm">
<cfinclude template="/Inc/m/End.cfm">
</cfoutput>