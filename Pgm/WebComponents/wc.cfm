<cfscript>
include '/Inc/Paper.cfm'
Guess = new com.Pgm().WhereQuestionID(url)
form.QuestionDesc = Replace(Guess.QuestionDesc,'##UsrName##',session.Usr.UsrName)
request.fw.container = false
cssCode = ''
htmlCode = ''
jsCode = ''
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="wc.css">
<cfinclude template="/Inc/body.cfm">

<div class="row">
	<cfset myPgm = "wcSave">
	<cfif QuestionName EQ "Google Maps">
		<cfset myPgm = "GoogleMap">
	</cfif>
	<form method="post" action="#myPgm#.cfm?ActSort=#url.ActSort#">
		<div class="col-sm-5" id="columnA">
			<strong>CSS</strong>
			<textarea name="cssCode" rows="2" spellcheck="false">#cssCode#</textarea>
			<strong>HTML</strong>
			<textarea name="htmlCode" rows="3" spellcheck="false">#htmlCode#</textarea>
			<strong>JavaScript</strong>
			<textarea name="jsCode" rows="4" spellcheck="false">#jsCode#</textarea>
			<div id="bottom">
				#form.QuestionDesc#
			</div>
		</div>
		<div class="col-sm-6" id="columnB">
		</div>
		<div class="col-sm-1">
			<button name="Save" type="submit">Save</button>
			<cfif QuestionName EQ "Google Maps">
				<p>
					<a href="WebComponentIntro.cfm?ActSort=#url.ActSort#" class="btn-success">Next!</a>
				</p>
			</cfif>
		</div>
		<input type="hidden" name="GuessID" value="#GuessID#">
		<input type="hidden" name="QuestionSort" value="#QuestionSort#">
	</form>
</div>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>