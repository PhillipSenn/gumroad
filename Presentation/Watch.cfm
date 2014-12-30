<cfscript>
Usr = new com.Usr().Where("CourseSort",session.Usr)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
You need to watch every presentation.
<table>
	<thead>
		<tr>
			<th>Student</th>
			<th><span class="glyphicon glyphicon-check"></span></th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="Usr">
			<tr>
				<td>
					<a href="WatchThis.cfm?UsrID=#UsrID#">#UsrName#</a>
				</td>
				<td>
					<span class="glyphicon glyphicon-unchecked"></span>
				</td>
			</tr>
		</cfloop>
	</tbody>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>