<cfscript>
new com.Guess().Save(form)
new com.Attendance().Save(form)
Guess = new com.Guess().get(form)
Answer = new com.Pgm().LectureNotes(Guess)
request.fw.container = false
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="kb.css">
<style id="myCSS">
</style>
<cfinclude template="/Inc/body.cfm">
<div class="row">
	<div class="col-sm-7" id="columnA">
		<fieldset>
			<legend>HTML</legend>
			<textarea name="htmlCode" rows="9" spellcheck="false">&lt;canvas id="myCanvas" width="400" height="300">
&lt;/canvas>
&lt;img id="player" src="Player.png" hidden>
&lt;script src="//cdnjs.cloudflare.com/ajax/libs/keymaster/1.6.1/keymaster.js">
&lt;/script></textarea>
		</fieldset>
	</div>
	<div class="col-sm-4" id="columnB">
		<div id="htmlOutput">
			<canvas id="myCanvas" width="400" height="300"></canvas>
		</div>
	</div>
	<div class="col-sm-1">
		<a href="kbIntro.cfm?ActSort=#url.ActSort#" class="btn-success">Next!</a>
	</div>
</div>
<div class="row" id="bottom">
	<div class="col-sm-6">
		<fieldset>
			<legend>CSS</legend>
			<textarea name="cssCode" rows="5" spellcheck="false">canvas {
	border:10px groove gray
}</textarea>
		</fieldset>
	</div>
	<div class="col-sm-5">
		<fieldset>
			<legend>Lecture Notes:</legend>
			#Answer.AnswerName#
		</fieldset>
	</div>
</div>
<img id="player" src="Player.png" hidden>
<cfinclude template="/Inc/foot.cfm">
<script src="//cdnjs.cloudflare.com/ajax/libs/keymaster/1.6.1/keymaster.js"></script>
<script src="Oscillator.js"></script>
<script src="CollSave2.js"></script>
<script id="myScript">
#GuessName#
</script>
<script src="keyup.js"></script>
<script src="kbSave.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>