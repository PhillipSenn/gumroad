<cfscript>
Variables.ActSort = 50805
Paper = new com.Paper().Create(Variables)
Guess = new com.Guess().Create(Paper)
AttPaper = new com.Attendance().InsertAssignment(Variables)
new com.Attendance().Create(AttPaper)
if (Guess.GuessName == '') {
	form.GuessID = Guess.GuessID
	form.GuessName = Guess.AnswerName
	new Monopoly().SaveDraft(form)
}

Variables.ActSort = 50806
Paper = new com.Paper().Create(Variables)
Guess = new com.Guess().Create(Paper)
AttPaper = new com.Attendance().InsertAssignment(Variables)
new com.Attendance().Create(AttPaper)
if (Guess.GuessName == '') {
	form.GuessID = Guess.GuessID
	form.GuessName = Guess.AnswerName
	new Monopoly().SaveDraft(form)
}

Variables.ActSort = 50807
Paper = new com.Paper().Create(Variables)
Guess = new com.Guess().Create(Paper)
AttPaper = new com.Attendance().InsertAssignment(Variables)
new com.Attendance().Create(AttPaper)
if (Guess.GuessName == '') {
	form.GuessID = Guess.GuessID
	form.GuessName = Guess.AnswerName
	new Monopoly().SaveDraft(form)
}

Variables.ActSort = 50808
Paper = new com.Paper().Create(Variables)
Guess = new com.Guess().Create(Paper)
AttPaper = new com.Attendance().InsertAssignment(Variables)
new com.Attendance().Create(AttPaper)
if (Guess.GuessName == '') {
	form.GuessID = Guess.GuessID
	form.GuessName = Guess.AnswerName
	new Monopoly().SaveDraft(form)
}

Variables.ActSort = 50809
Paper = new com.Paper().Create(Variables)
Guess = new com.Guess().Create(Paper)
AttPaper = new com.Attendance().InsertAssignment(Variables)
new com.Attendance().Create(AttPaper)
if (Guess.GuessName == '') {
	form.GuessID = Guess.GuessID
	form.GuessName = Guess.AnswerName
	new Monopoly().SaveDraft(form)
}
include '/Inc/Paper.cfm'
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<p>#ActDesc#</p>
<a class="btn-primary" href="Monopoly.cfm?ActSort=#url.ActSort#">Oh boy!</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>