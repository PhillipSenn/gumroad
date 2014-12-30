<cfscript>
include '/Inc/Paper.cfm'
Guess = new com.Pgm().WhereQuestionID(url)
request.fw.container = false
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="kb.css">
<cfinclude template="/Inc/body.cfm">
<form class="row" method="post" action="kbSave.cfm?ActSort=#url.ActSort#">
	<div class="col-sm-5" id="columnA">
		<fieldset>
			<legend>JavaScript</legend>
			<textarea id="GuessName" name="GuessName" rows="11" spellcheck="false">#GuessName#</textarea>
		</fieldset>
	</div>
	<div class="col-sm-6" id="columnB">
		<fieldset>
			<legend>Result</legend>
			<canvas id="myCanvas" width="400" height="300"></canvas>
		</fieldset>
	</div>
	<div class="col-sm-1">
		<p>
			<button name="Save" type="submit">Save</button>
		</p>
	</div>
	<input type="hidden" name="GuessID" value="#GuessID#">
</form>
<div class="row" id="bottom">
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
<img id="player" src="Player.png" hidden>
<script id="myScript">
function GuessName() {}
</script>
<cfinclude template="/Inc/foot.cfm">
<script src="//cdnjs.cloudflare.com/ajax/libs/keymaster/1.6.1/keymaster.js"></script>
<script src="requestAnimationFrame.js"></script>

<cfinclude template="/Inc/End.cfm">
</cfoutput>