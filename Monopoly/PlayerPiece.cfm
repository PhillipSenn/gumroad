<cfscript>
if (IsDefined('form.Save')) {
	new com.Guess().Save(form)
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
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="Monopoly.css">
<style id="cssStyle">
#cssGuessName#
</style>
<cfinclude template="/Inc/body.cfm">
<form method="post">

	<div id="partA">
	#partA.GuessName#
	</div>
	<div id="partB">
	#partB.GuessName#
	</div>
	<textarea name="GuessName" rows="32" spellcheck="false" autofocus>function roll() {
	return Math.floor(Math.random() * 6) + 1
}
var Variables = {}
Variables.die1 = roll()
Variables.die2 = roll()
	</textarea>
	<div id="SaveArea">
		<button type="submit" name="Save">Roll</button>
	</div>
	<input type="hidden" name="GuessID" value="#GuessID#">
	<input type="hidden" name="ActSort" value="#url.ActSort#">
</form>
<div id="partC"> <!-- right column -->
#partC.GuessName#
</div>
<div id="partD"> <!-- bottom row -->
#partD.GuessName#
</div>
<div class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header label-primary">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times</button>
			<h4 class="modal-title">Assignment</h4>
		</div>
		<div class="modal-body">
			#QuestionName#
		</div>
		<div class="modal-footer">
		<button type="button" data-dismiss="modal">Close</button>
		</div>
		</div>
	</div>
</div>

<cfinclude template="/Inc/foot.cfm">
<div id="AnswerName" hidden>
#AnswerName#
</div>
<cfinclude template="/Inc/End.cfm">
</cfoutput>