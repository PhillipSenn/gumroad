<cfscript>
if (IsDefined('url.UsrID')) {
	new Attendance().Save(url)
}
Usr = new Attendance().WhereCourseID(session.Usr)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table>
	<thead>
		<tr>
			<th>Student</th>
			<th>First</th>
			<th>Last</th>
			<th class="date">Date</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="Usr">
			<tr>
				<td>
					<a href="Attendance.cfm?UsrID=#UsrID#">#UsrName#</a>
				</td>
				<td>#FirstName#</td>
				<td>#LastName#</td>
				<td class="date">#DateFormat(Usr.CalendarDate,"mm/dd")#</td>
			</tr>
		</cfloop>
	</tbody>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>