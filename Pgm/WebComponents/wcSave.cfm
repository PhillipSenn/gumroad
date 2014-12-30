<cfscript>
form.GuessName = form.cssCode & '
' & form.htmlCode & '
' & form.jsCode
new com.Guess().Save(form)
new com.Attendance().Save(form)
Guess = new com.Guess().get(form)
form.QuestionDesc = Replace(Guess.QuestionDesc,'##UsrName##',session.Usr.UsrName)
request.fw.container = false
form.jsCode = Replace(form.jsCode,'<invalidTag src="platform.js"></script>','<script src="platform.js"></script>')
// if (FindNoCase('voice-player',form.jsCode)) {
if (form.QuestionSort == 3) {	
	request.fw.msg = 'You should be hearing something, but your computer might not have speakers.'
}
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="wc.css">
#form.cssCode#
<cfinclude template="/Inc/body.cfm">
<div class="row">
	<form method="post">
		<div class="col-sm-5" id="columnA">
			<strong>CSS</strong>
			<textarea name="cssCode" rows="2" spellcheck="false">#form.cssCode#</textarea>
			<strong>HTML</strong>
			<cfif FindNoCase('<form',form.htmlCode)>
				<textarea name="htmlCode" rows="3" spellcheck="false">#HTMLEditFormat(form.htmlCode)#</textarea>
			<cfelse>
				<textarea name="htmlCode" rows="3" spellcheck="false">#form.htmlCode#</textarea>
			</cfif>
			<strong>JavaScript</strong>
			<textarea name="jsCode" rows="4" spellcheck="false">#form.jsCode#</textarea>
			<div id="bottom">
				#form.QuestionDesc#
			</div>
		</div>
		<div class="col-sm-1">
			<button type="submit" name="Save">Save</button>
			<p>
				<a href="WebComponentIntro.cfm?ActSort=#url.ActSort#" class="btn-success">Next!</a>
			</p>
		</div>
		<input type="hidden" name="GuessID" value="#form.GuessID#">
		<input type="hidden" name="QuestionSort" value="#form.QuestionSort#">
	</form>
	<div class="col-sm-6" id="columnB">
		#form.htmlCode#
		<fieldset>
			<legend>Lecture Notes:</legend>
			#AnswerName#
		</fieldset>
	</div>
</div>
<cfinclude template="/Inc/foot.cfm">
<cfif FindNoCase('clock-face.js',form.jsCode)>
	<script src="clock-face.js"></script>
	<script src="CustomElements/custom-elements.js"></script>
<cfelseif FindNoCase('platform.js',form.jsCode) AND FindNoCase('google-map',form.jsCode)>
	<script src="platform.js"></script>
	<link rel="import" href="GoogleWebComponents/google-map/google-map.html">
	<link rel="import" href="GoogleWebComponents/google-map/google-map-directions.html">
<cfelseif FindNoCase('platform.js',form.jsCode) AND FindNoCase('voice-player',form.jsCode)>
	<script src="platform.js"></script>
	<link rel="import" href="bower_components/voice-elements/dist/voice-player.html">
<cfelseif FindNoCase('recognition-input',form.jsCode)>
	<script src="platform.js"></script>
	<link rel="import" href="bower_components/voice-elements/dist/voice-recognition.html">
	<script>
	var form = document.querySelector('##recognition-form'),
		 input = document.querySelector('##recognition-input'),
		 element = document.querySelector('##recognition-element');
	
	form.addEventListener('submit', function(e) {
		 e.preventDefault();
		 element.start();
	});
	
	element.addEventListener('result', function(e) {
		 input.textContent = e.detail.result;
	});
	</script>
</cfif>

<cfinclude template="/Inc/End.cfm">
</cfoutput>