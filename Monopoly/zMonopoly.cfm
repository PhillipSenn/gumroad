<cfscript>
include '/Inc/Paper.cfm'
form.PaperID = Paper.PaperID
form.QuestionSort = 1
partA = new Monopoly().WhereQuestionSort(form)
partAGuessName = partA.GuessName
if (partAGuessName == '') {
	partAGuessName = partA.AnswerName
}

form.QuestionSort = 2
partB = new Monopoly().WhereQuestionSort(form)
partBGuessName = partB.GuessName
if (partBGuessName == '') {
	partBGuessName = partB.AnswerName
}

form.QuestionSort = 3
partC = new Monopoly().WhereQuestionSort(form)
partCGuessName = partC.GuessName
if (partCGuessName == '') {
	partCGuessName = partC.AnswerName
}

form.QuestionSort = 4
partD = new Monopoly().WhereQuestionSort(form)
partDGuessName = partD.GuessName
if (partDGuessName == '') {
	partDGuessName = partD.AnswerName
}

Variables.ActSort = 50806
cssGuess = new com.Guess().WhereActSort(Variables)
cssGuessName = cssGuess.GuessName
if (cssGuessName == '') {
	cssGuessName = cssGuess.AnswerName
}
request.fw.container = false
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<style id="cssStyle">
#cssGuessName#
</style>
<cfinclude template="/Inc/body.cfm">
<div id="partA">
#partAGuessName#
</div>
<div id="partB">
#partBGuessName#
</div>
<form>
	<div id="htmlCode">
		<button type="submit" name="SaveA" class="no-lg pull-right btn-primary">Save the top row &uarr;</button>
		<textarea name="partAGuessName" rows="7" spellcheck="false"
		<cfif ActName EQ "LRopoly HTML">
		autofocus
		</cfif>
		>#partAGuessName#</textarea>
		<button type="submit" name="SaveB" class="no-lg btn-primary">&larr; Save the left column</button>
		<textarea name="partBGuessName" rows="7" spellcheck="false">#partBGuessName#</textarea>
		<button type="submit" name="SaveC" class="no-lg pull-right btn-primary">Save the right column &rarr;</button>
		<textarea name="partCGuessName" rows="6" spellcheck="false">#partCGuessName#</textarea>
		<textarea name="partDGuessName" rows="6" spellcheck="false">#partDGuessName#</textarea>
		<button type="submit" name="SaveD" class="no-lg pull-right btn-primary">Save the bottom row &darr;</button>
	</div>
	<div id="cssCode">
		<button type="submit" name="SaveCSS" class="no-lg pull-right btn-primary">Save the Cascading Style Sheet</button>
		<textarea name="cssGuessName" rows="31" spellcheck="false"
		<cfif ActName EQ "LRopoly CSS">
		autofocus
		</cfif>
		>#cssGuessName#</textarea>
	</div>
</form>
<div id="partC"> <!-- right column -->
#partCGuessName#
</div>
<div id="partD"> <!-- bottom row -->
#partDGuessName#
</div>
<div class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header label-primary">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times</button>
			<h4 class="modal-title">Assignment</h4>
		</div>
		<div class="modal-body">
			QuestionName
		</div>
		<div class="modal-footer">
		<button type="button" data-dismiss="modal">Close</button>
		</div>
		</div>
	</div>
</div>

<cfinclude template="/Inc/foot.cfm">
<input type="hidden" name="partAGuessID" value="#partA.GuessID#">
<input type="hidden" name="partBGuessID" value="#partB.GuessID#">
<input type="hidden" name="partCGuessID" value="#partC.GuessID#">
<input type="hidden" name="partDGuessID" value="#partD.GuessID#">
<input type="hidden" name="cssGuessID" value="#cssGuess.GuessID#">
<div id="partAAnswerName" hidden>
#partA.AnswerName#
</div>
<div id="partBAnswerName" hidden>
#partB.AnswerName#
</div>
<div id="partCAnswerName" hidden>
#partC.AnswerName#
</div>
<div id="partDAnswerName" hidden>
#partD.AnswerName#
</div>
<div id="cssAnswerName" hidden>
#cssGuess.AnswerName#
</div>
<cfinclude template="/Inc/End.cfm">
</cfoutput>