<cfscript>
if (IsDefined('form.Save')) {
	if (!Len(form.Attachment)) {
		location(request.fw.home,false)
	}
	new com.Paper().Upload(form)
	Guess = new com.Guess().Where("PaperID",form.PaperID)
	for (qry in Guess) {
		new com.Attendance().Save(qry)
	}
	location('../Fireworks-master',false)
}
include '/Inc/Paper.cfm'

include '/Inc/StudentPath.cfm'
SavedDocuments = new APA().SavedDocuments()
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<fieldset>
	<legend>#ActName#</legend>
	#ActDesc#
	<hr>
	<dl>
		<cfloop query="Guess">
			<dt>
				#QuestionName#
				<cfif AnswerName NEQ "">
					<dd>#AnswerName#</dd>
				</cfif>
			</dt>
		</cfloop>
	</dl>
	<form method="post" action="#cgi.SCRIPT_NAME#?#cgi.QUERY_STRING#" enctype="multipart/form-data">
		<input type="file" name="Attachment">
		<p>
			<button name="Save" type="submit">Save</button>
		</p>
		<cfif session.Usr.online OR DateDiff('d',AssignmentStart,now()) GT 1>
			<p>
				#ActOnline#
			</p>
		</cfif>
		<input type="hidden" name="PaperID" value="#PaperID#">
	</form>
</fieldset>

<table>
	<thead>
		<tr>
			<th>File name</th>
			<th>Assignment</th>
			<th>Date</th>
			<th>Time</th>
			<th class="num">Score</th>
			<th>Graded</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="SavedDocuments">
			<tr>
				<td><a href="#StudentPath#/#Attachment#">#StudentFileName#</a></td>
				<td>#ActName#</td>
				<td>#DateFormat(GuessDateTime,"mm/dd")#</td>
				<td>#TimeFormat(GuessDateTime,"h:mm:ss.ltt")#</td>
				<td class="num">#Earned#</td>
				<td>
					<cfif GradeDateTime EQ "">
						Not Yet
					<cfelse>
						#DateFormat(GradeDateTime,'mm/dd')#
					</cfif>
				</td>
			</tr>
		</cfloop>
	</tbody>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>