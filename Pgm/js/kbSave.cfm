<cfscript>
new com.Guess().Save(form)
new com.Attendance().Save(form)
Guess = new com.Guess().get(form)
request.fw.container = false
Answer = new com.Pgm().LectureNotes(Guess)
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="kb.css">
<link rel="stylesheet" href="kbSave.css">
<style id="myCSS">
</style>
<cfinclude template="/Inc/body.cfm">
<form method="post">
	<div class="row">
		<div class="col-sm-5" id="columnA">
			<strong>HTML</strong>
			<textarea name="htmlCode" rows="6" spellcheck="false">&lt;canvas id="myCanvas" width="400" height="300">
&lt;/canvas>
&lt;img id="player" src="Player.png" hidden>
&lt;script src="//cdnjs.cloudflare.com/ajax/libs/keymaster/1.6.1/keymaster.js">&lt;/script>
	</textarea>
			<strong>CSS</strong>
			<textarea name="cssCode" rows="5" spellcheck="false">canvas {
	border:10px groove gray
}
			</textarea>
		</div>
		<div class="col-sm-6" id="columnB">
			<fieldset id="result">
				<legend>Result</legend>
				<div id="htmlOutput">
					<canvas id="myCanvas" width="400" height="300"></canvas>
				</div>
			</fieldset>
		</div>
		<div class="col-sm-1">
			<p>
				<a href="kbIntro.cfm?ActSort=#url.ActSort#" class="btn-success">Next!</a>
			</p>
			<!--- XSS Protection
			<p>
				<button type="submit" name="Save">Save</button>
			</p>
			--->
		</div>
	</div>
	<div class="row" id="bottom">
		<div class="col-sm-5 overflowHidden">
			<fieldset>
				<legend>JavaScript</legend>
				<textarea id="GuessName" name="GuessName" rows="6" spellcheck="false">#GuessName#</textarea>
			</fieldset>
		</div>
		<div class="col-sm-6">
			<fieldset id="LectureNotes">
				<legend>#QuestionName#</legend>
				#Answer.AnswerName#
			</fieldset>
		</div>
	</div>
	<input type="hidden" name="GuessID" value="#form.GuessID#">
</form>
<img id="player" src="Player.png" hidden>
<cfinclude template="/Inc/foot.cfm">
<script src="//cdnjs.cloudflare.com/ajax/libs/keymaster/1.6.1/keymaster.js"></script>
<script id="myScript">
function GuessName() {
	#GuessName#
}
</script>
<script src="kb.js"></script>
<script src="kbSave.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>