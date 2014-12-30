<cfscript>
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<ul>
	<li><a href="Attendance/Attendance.cfm">Attendance</a></li>
	<li>Grade
		<ul>
			<li><a href="Grade/Presentation/Presentation.cfm">Presentations</a></li>
			<li><a href="Grade/APA.cfm">Research Paper Assignments</a></li>
			<li><a href="Grade/APATemplate.cfm">APA Template</a></li>
		</ul>
	</li>
	<li><a href="Assignments/Assignments.cfm">Assignments</a></li>
	<li><a href="StudentList.cfm">Student List</a></li>
	<li><a href="Import.cfm">Import</a></li>
	<li><a href="Backup/Backup.cfm">Backup</a></li>
	<li><a href="Dashboard/Dashboard.cfm">Dashboard</a></li>
	<li><a href="Weekly/Weekly.cfm">Weekly</a> (?)</li>
	<li><a href="Grade/Picture.cfm">Grade the picture assignment</a></li>
	<li><a href="Compare/Compare.cfm">Dev v. Prod</a></li>
</ul>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>