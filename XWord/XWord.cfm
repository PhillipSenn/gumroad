<cfscript>
Paper = new com.Paper().WhereActSort(url)
Guess = new XWord().WherePaperID(Paper)
arrWord = ArrayNew(2)
arrQuestionName = ArrayNew(2)
arrDisplay = ArrayNew(2)
arrGuessIDs = ArrayNew(2)
for (row=1; row<=21; row++) {
	for (col=1; col<=21; col++) {
		arrWord[row][col] = '&nbsp'
		arrQuestionName[row][col] = ''
		arrDisplay[row][col] = '&nbsp' // 1 Across
		arrGuessIDs[row][col] = "" // This is the GuessID that you will update when you complete the word.
	}
}
for (qry in Guess) {
	row = qry.XWordRow
	col = qry.XWordCol
	if (qry.AnswerSort == 1) {
		arrDisplay[row][col] = qry.QuestionSort
		arrGuessIDs[row][col] = qry.GuessID
		for (I=1; I <= Len(qry.AnswerName); I++) {
			letter = UCASE(Mid(qry.AnswerName,I,1))
			if (qry.Earned) {
				arrDisplay[row][I+col-1] = '<div class="btn btn-success">#letter#</div>'
			}
			arrWord[row][I+col-1] = letter
			arrQuestionName[row][I+col-1] = qry.QuestionName
		}
	} else {
		if (arrDisplay[row][col] == '&nbsp') {
			 arrDisplay[row][col] = qry.QuestionSort
		}
		if (arrGuessIDs[row][col] NEQ "") {
			 arrGuessIDs[row][col] &= ',' & qry.GuessID
		} else {
			 arrGuessIDs[row][col] = qry.GuessID
		}
		for (I=1; I <= Len(qry.AnswerName); I++) {
			letter = UCASE(Mid(qry.AnswerName,I,1))
			if (qry.Earned) {
				arrDisplay[I+row-1][col] = '<div class="btn btn-success">#letter#</div>'
			}
			arrWord[I+row-1][col] = letter
			if (arrQuestionName[I+row-1][col] == '') {
				arrQuestionName[I+row-1][col] = qry.QuestionName
			} else {
				// if (I == 1 AND col > 1) { //  AND arrGuessIDs[row][col-1] == ''?
				// 	arrQuestionName[I+row-1][col] = '<strong>Down: </strong>' & qry.QuestionName
				// } else {
					arrQuestionName[I+row-1][col] = '<strong>Across: </strong>' 
						& arrQuestionName[I+row-1][col]
						& Chr(10) & Chr(10)
						& '<strong>Down: </strong>' & qry.QuestionName
				// }
			}
		}
	}
}
request.fw0.Container = false
request.fw.ShowProgress = true;
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="XWord.css">
<cfinclude template="/Inc/body.cfm">
<table id="myTable" class="no-striped no-hover">
	<cfloop from="1" to="21" index="row">
		<tr>
		<cfloop from="1" to="21" index="col">
			<td
				<cfif arrWord[row][col] EQ "&nbsp">
					class="empty"
				<cfelse>
					class="letter"
					data-letter ="#Asc(arrWord[row][col])#" 
					data-guessids="#arrGuessIDs[row][col]#"
					title="#arrQuestionName[row][col]#"
				</cfif>
				>#arrDisplay[row][col]#
			</td>
		</cfloop>
		</tr>
	</cfloop>
</table>

<div id="Words">
	<!-- A big part of learning how to program involves looking at other people's code. -->
	<cfloop query="Guess">
		<input type="hidden" value="#UCase(AnswerName)#">
	</cfloop>
	<!-- So props for viewing the source code! -->
</div>
<cfinclude template="/Inc/foot.cfm">
<input type="hidden" id="row" value="#Guess.XWordRow#">
<input type="hidden" id="col" value="#Guess.XWordCol#">
<input type="hidden" id="PaperID" value="#PaperID#">
<input type="hidden" id="ActSort" value="#url.ActSort#">
<cfinclude template="/Inc/End.cfm">
</cfoutput>