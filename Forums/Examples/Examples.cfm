<cfscript>
if (IsDefined('form.Save')) {
	new Examples().Save(form)
	new com.Attendance().Save(form)
}
Paper = new com.Paper().WhereActSort(url)
if (IsDefined('url.QuestionID')) {
	Guess = new ExamplesDone().WhereQuestionID(url)
} else {
	Guess = new Examples().FirstUnansweredQuestion(Paper)
	if (!Guess.Recordcount) {
		location('ExamplesDone.cfm?Actsort=#url.ActSort#',false)
	}
}
// Chats = new ChatVideo().ExistingChats()
Others = new Examples().Others(Guess)
request.fw.ShowProgress = true
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
	<h1>Question #QuestionSort# of 10</h1>
	<p>#ActDesc#</p>
	<p><strong>#QuestionName#</strong></p>
	<p>
		<button class="pull-right btn-info" type="button" data-toggle="modal" data-target=".modal">Help for question #QuestionSort#</button>
	</p>
	<form method="post" action="Examples.cfm?ActSort=#url.ActSort#">
		<textarea name="GuessName" rows="6" autofocus>#GuessName#</textarea>
		<p>
			<button name="Save" type="submit">Save</button>
		</p>
		<input type="hidden" name="GuessID" value="#GuessID#">
		<input type="hidden" name="QuestionName" value="#QuestionName#">
	</form>
	<cfif QuestionSort EQ 9>
		<p><span class="label-warning">Don't post one that's been posted already!</span></p>
		Here's how to fashion a hyperlink:
		<ol>
			<li>Start the anchor tag with &lt;a href="</li>
			<li>Paste your url so that now you have: &lt;a href="http://www.Google.com</li></li>
			<li>Enclose the url so that now you have: &lt;a href="http://www.Google.com"></li>
			<li>Give the human readable text: &lt;a href="http://www.Google.com">Google</li>
			<li>End the anchor tag: &lt;a&nbsp;href="http://www.Google.com">Google&lt;/a></li>
	<cfelse>
		<p>Here's what others have posted:</p>
	</cfif>
	<table>
		<tbody>
			<cfloop query="Others">
				<tr>
					<td title="#UsrName#">#FirstName#</td>
					<td>#GuessName#</td>
					<td>#DateFormat(GuessDateTime,'mm/dd')#</td>
					<td>#TimeFormat(GuessDateTime,'h:mmtt')#</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
	<div class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-header label-primary">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">Thoughts and ideas</h4>
			</div>
			<div class="modal-body">
			<p>#AnswerName#</p>
			</div>
			<div class="modal-footer">
			<button type="button" data-dismiss="modal">Close</button>
			</div>
			</div>
		</div>
	</div>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>