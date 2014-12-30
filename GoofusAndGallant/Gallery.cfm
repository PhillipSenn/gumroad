<cfscript>
Paper = new com.Paper().WhereActSort(url)
Guess = new com.Paper().Where("AssignmentID",Paper.AssignmentID)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="Gallery.css">
<cfinclude template="/Inc/body.cfm">
<table>
	<thead>
		<tr>
			<th>Student</th>
			<th>Text from the article</th>
			<th>pdf</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="Guess">
			<cfset myPath = request.fw.home & '/Students/' & CourseName & '.' & CourseSort>
			<cfset myPath &= '/' & Replace(PersonName,' ','','all')>
			<tr>
				<td>#UsrName#</td>
				<td class="pre">#PaperName#</td>
				<td><a href="#myPath#/#Attachment#">#StudentFileName#</td>
			</tr>
		</cfloop>
	</tbody>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>