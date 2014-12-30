<cfscript>
new com.Guess().Save(form)
new com.Attendance().Save(form)
Guess = new com.Guess().get(form)
request.fw.container = false
if (form.GuessName == '<invalidTag src="HelloWorld.js"></script>') {
	form.GuessName = '<script src="HelloWorld.js"></script>'
}
Answer = new HTMLSave().LectureNotes(Guess)
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="html.css">
<link rel="stylesheet" href="HTMLSave.css">
<cfinclude template="/Inc/body.cfm">
<form class="row" method="post">
	<div class="col-sm-5" id="columnA">
		<fieldset>
			<legend>HTML</legend>
			<textarea id="GuessName" name="GuessName" rows="10">#GuessName#</textarea>
		</fieldset>
	</div>
	<div class="col-sm-6" id="columnB">
		<fieldset id="result">
			<legend>Result</legend>
			<iframe width="100%" height="300px" src="iFrame.cfm?GuessID=#GuessID#"></iframe>
		</fieldset>
	</div>
	<div class="col-sm-1">
	<p>
		<a href="htmlIntro.cfm?ActSort=#url.ActSort#" class="btn-success">Next!</a>
	</p>
	<p>
		<button type="submit" name="Save">Save</button>
	</p>
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
		<fieldset id="LectureNotes">
			<legend>#QuestionName#</legend>
			#Answer.AnswerName#
		</fieldset>
	</div>
</div>
<cfinclude template="/Inc/foot.cfm">
<script src="html.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>