<cfscript>
include '/Inc/Paper.cfm'
Guess = new com.Pgm().WhereQuestionID(url)
request.fw.container = false
request.fw.msg = "Press Save before seeing the result"
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="kb.css">
<cfinclude template="/Inc/body.cfm">

<form class="row" method="post" action="CollSave.cfm?ActSort=#url.ActSort#">
	<div class="col-sm-7" id="columnA">
		<textarea id="GuessName" name="GuessName" rows="9" spellcheck="false">#GuessName#</textarea>
	</div>
	<div class="col-sm-4" id="columnB">
		<canvas id="myCanvas" width="400" height="300"></canvas>
	</div>
	<div class="col-sm-1">
		<button name="Save" type="submit">Save</button>
	</div>
	<input type="hidden" name="GuessID" value="#GuessID#">
</form>
<div class="row">
	<div class="col-sm-5">
		<fieldset>
			<legend>Assignment</legend>
			#QuestionDesc#
		</fieldset>
	</div>
	<div class="col-sm-6">
		<fieldset>
			<legend>Instructions</legend>
			#AnswerName#
		</fieldset>
	</div>
</div>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>