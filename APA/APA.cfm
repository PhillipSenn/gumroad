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
	location('Yay.cfm',false)
}
include '/Inc/Paper.cfm'

include '/Inc/StudentPath.cfm'
Guess = new APA().SavedDocuments()
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<fieldset>
	<legend>Assignment</legend>
	#ActDesc#
	<cfif url.ActSort EQ 3090>
		<span class="label-danger">Don't use <em>my</em> research topic!  Look up your own!</span>
	</cfif>
	<hr>
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
		<cfloop query="Guess">
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