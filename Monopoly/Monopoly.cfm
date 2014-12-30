<cfscript>
if (IsDefined('form.Save')) {
	new Monopoly().Save(form)
	new com.Attendance().Save(form) /* GuessID */
}

include '/Inc/Paper.cfm'
form.GuessName = Guess.GuessName
if (Guess.GuessName == '') {
	form.GuessName = Guess.AnswerName
}

Variables.ActSort = 50805
partA = new com.Guess().WhereActSort(Variables)

Variables.ActSort = 50806
partB = new com.Guess().WhereActSort(Variables)

Variables.ActSort = 50807
partC = new com.Guess().WhereActSort(Variables)

Variables.ActSort = 50808
partD = new com.Guess().WhereActSort(Variables)

/* But if there's no css, then supply a default */
Variables.ActSort = 50809
cssGuess = new com.Guess().WhereActSort(Variables)
cssGuessName = cssGuess.GuessName
if (cssGuessName == '') {
	Answer = new com.Answer().Where('ActSort',Variables)
	cssGuessName = Answer.AnswerName
}
request.fw.container = false
request.fw.msg = Guess.QuestionName
if (Guess.ActName != 'LRopoly CSS') {
} else if (!FindNoCase('background-color:##ED1B24',Guess.GuessName)) {
} else if (!FindNoCase('background-color:##1FB25A',Guess.GuessName)) {
} else if (!FindNoCase('background-color:##0072BB',Guess.GuessName)) {
} else {
	request.fw.msg = ''
}
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/html.cfm">
<style id="cssStyle">
#cssGuessName#
</style>
<cfinclude template="/Inc/body.cfm">
<div id="partA">
#partA.GuessName#
</div>
<div id="partB">
#partB.GuessName#
</div>
<form method="post">
	<textarea name="GuessName" rows="32" spellcheck="false" autofocus>#form.GuessName#</textarea>
	<div id="SaveArea">
		<button type="submit" name="Save" disabled>Save</button>
		<div id="otherAssignments">
			<h3>Navigate to</h3>
			<ul>
				<li><a href="Monopoly.cfm?ActSort=50805">Top Row</a> (Kentucky, Indiana, Illinois, Atlantic, Ventnor, Marvin Gardens)</li>
				<li><a href="Monopoly.cfm?ActSort=50806">Left Column</a> (St. Charles Place, States, Virginia, St. James Place, Tennesee, New York)</li>
				<li><a href="Monopoly.cfm?ActSort=50807">Right Column</a> (Pacific, North Carolina, Pennsylvania, Park Place, Boardwalk)</li>
				<li><a href="Monopoly.cfm?ActSort=50808">Bottom Row</a> (Mediterranean, Baltic, Oriental, Vermont, Connecticut)</li>
				<li><a href="Monopoly.cfm?ActSort=50809">Cascading Style Sheet</a> (Red, Green and Blue colors)</li>
			</ul>
		</div>
		<cfif ActName NEQ "LRopoly CSS">
		<cfelseif !FindNoCase('background-color:##ED1B24',GuessName)>
		<cfelseif !FindNoCase('background-color:##1FB25A',GuessName)>
		<cfelseif !FindNoCase('background-color:##0072BB',GuessName)>
		<cfelse>
			<a class="btn-success" href="MonopolyFinished.cfm">Finished</a>
		</cfif>
		<p>
			<a id="reset" href="JavaScript:;">Start Over</a>
		</p>
	</div>
	<input type="hidden" name="GuessID" value="#GuessID#">
</form>
<div id="partC"> <!-- right column -->
#partC.GuessName#
</div>
<div id="partD"> <!-- bottom row -->
#partD.GuessName#
</div>
<cfinclude template="/Inc/foot.cfm">
<div id="AnswerName" hidden>#AnswerName#</div>
<cfinclude template="/Inc/End.cfm">
</cfoutput>