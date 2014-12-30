<cfscript>
include '/Inc/Paper.cfm'
Guess = new com.Guess().get(form)
AnswerName = Guess.AnswerName
GuessName = Guess.GuessName
NumericKeyboard = false
for (i=1;i<=Len(AnswerName);i++) {
	if (Find(Mid(AnswerName,i,1),"0123456789")) {
		NumericKeyboard = true
	}
}

QuestionDisplay = replace(Guess.QuestionName,'_','(Blank)')
QuestionDisplay = Replace(QuestionDisplay,'_','','all') // Remove the trailing dashes
QuestionDisplay = Replace(QuestionDisplay,'img src="','img src="gif/')
if (Left(QuestionDisplay,4) == 'A(n)') {
	QuestionDisplay = Replace(QuestionDisplay,'A(n)','A<span id="n">(n)</span>')
}
i = FindNoCase('a(n)',QuestionDisplay)
if (i) {
	if (FindNoCase(Left(AnswerName,1),'AEIOU')) {
		if (FindNoCase(Left(AnswerName,1),GuessName)) {
			QuestionDisplay = Left(QuestionDisplay,i) & Mid(QuestionDisplay,i+4,999)
		}
	}
}
request.fw.ShowProgress = true
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="Question.css">
<cfinclude template="/Inc/body.cfm">
<br>
<div id="UsrName"></div>
<div class="row">
	<div class="col-md-9">
		<hr>
		<div id="spinner">
			<div class="keyboard">
			<cfloop from="65" to="73" index="A">
				<a id="Letter#Chr(a)#" class="btn-lg available" href="JavaScript:;">#Chr(a)#</a>
			</cfloop>
			</div>
			
			<div class="keyboard">
				<cfloop from="74" to="82" index="A">
					<a id="Letter#Chr(a)#" class="btn-lg available" href="JavaScript:;">#Chr(a)#</a>
				</cfloop>
			</div>
			
			<div class="keyboard">
				<cfloop from="83" to="90" index="A">
					<a id="Letter#Chr(a)#" class="btn-lg available" href="JavaScript:;">#Chr(a)#</a>
				</cfloop>
				<a id="Letter-" class="btn-lg available" href="JavaScript:;">-</a>
			</div>
			
			<cfif NumericKeyboard>
				<div class="keyboard">
					<cfloop from="48" to="57" index="A">
						<a id="Letter#Chr(a)#" class="btn-lg available" href="JavaScript:;">#Chr(a)#</a>
					</cfloop>
				</div>
			</cfif>
		</div>
		<p>#QuestionDisplay#</p>
		<p>
		Answer: <a target="_blank" href="http://books.google.com/books?id=CQ1xnbYcvc8C&lpg=PA515&ots=bAIGM07Skr&dq=discovering%20computers%202013&pg=PA#Guess.Ref###v=onepage&q&f=false">Page #Guess.Ref#</a>
		</p>
		<form method="post" action="Answer.cfm?ActSort=#url.ActSort#">
			<button class="btn-block" type="submit" id="Save" name="Save" disabled>Save</button>
			<input type="hidden" name="GuessID" value="#url.GuessID#">
			<input type="hidden" name="Earned">
		</form>
	</div>
	<div id="Earned" class="col-md-3">10</div>
</div>
<div class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header label-primary">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">Pedagogy for this assignment</h4>
			</div>
			<div class="modal-body">
				<p>The instructor resources include 20 <strong>Completion</strong> questions.<br>
				If you login to <a target="_blank" href="http://www.cengagebrain.com/">cengagebrain.com</a>, 
				and search for 
				<blockquote>Discovering Computers: Essentials<br>
				Misty E. Vermaat<br>
				ISBN-10: 1-285-16178-5<br>
				ISBN-13: 978-1-285-16178-5<br>
				</blockquote>
				you will see a link to a MindTap Reader. <br>
				That should help you find the answers.  In addition, I've included a link to
				<a target="_blank" href="http://books.google.com/books?id=CQ1xnbYcvc8C&lpg=PA515&ots=bAIGM07Skr&dq=discovering%20computers%202013&pg=PP1##v=onepage&q&f=false">
				Google books for this textbook</a>. However, due to the Fair Use clause of Copyright law,
				Google has restrictions on how much of the book can be shown.
				</p>
			</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!--- #AnswerName# --->
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>
	<button class="btn-info" type="button" data-toggle="modal" data-target=".modal">Pedagogy</button>
</p>
<audio autoplay src="ucategory.wav">

<cfinclude template="/Inc/foot.cfm">
<script src="//cdnjs.cloudflare.com/ajax/libs/keymaster/1.6.1/keymaster.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>