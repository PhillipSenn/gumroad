<cfscript>
Calendar = new ProgressEmail().ByDate(session.Usr)
form.UsrID = session.Usr.UsrID
form.EmailSubject = 'Progress Report'
form.Silent = true
request.fw.msg = 'Check your inbox.'
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<cfsavecontent variable="form.EmailBody">
<table>
	<thead>
		<tr>
			<th>Day</th>
			<th>Start</th>
			<th>Deadline</th>
			<th>Textbook</th>
			<th>Forums</th>
			<th>Research</th>
			<th>Programming</th>
			<th>Presentation<br>&amp; Final</th>
			<th class="num">Earned</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="Calendar">
			<tr>
				<td>#Left(DayOfWeekAsString(DayOfWeek(CalendarDate)),3)#</td>
				<td>#DateFormat(CalendarDate,"mm/dd")#</td>
				<td>#DateFormat(AssignmentStop,"mm/dd")#</td>
				<cfif CatSort EQ 20000>
					<td colspan="5">
						<a href="http://Lenoir-Rhyne.com#request.fw.home#/#ActLink#?ID=#session.Usr.GloballyUniqueIdentifier#&ActSort=#ActSort#">#ActName#</a>
					</td>
				<cfelseif CatSort EQ 30000>
					<td></td>
					<td colspan="4">
						<a href="http://Lenoir-Rhyne.com#request.fw.home#/#ActLink#?ID=#session.Usr.GloballyUniqueIdentifier#&ActSort=#ActSort#">#ActName#</a>
					</td>
				<cfelseif CatSort EQ 40000>
					<td></td>
					<td></td>
					<td colspan="3">
						<a href="http://Lenoir-Rhyne.com#request.fw.home#/#ActLink#?ID=#session.Usr.GloballyUniqueIdentifier#&ActSort=#ActSort#">#ActName#</a>
					</td>
				<cfelseif CatSort EQ 50000>
					<td></td>
					<td></td>
					<td></td>
					<td colspan="2">
						<a href="http://Lenoir-Rhyne.com#request.fw.home#/#ActLink#?ID=#session.Usr.GloballyUniqueIdentifier#&ActSort=#ActSort#">#ActName#</a>
					</td>
				<cfelse>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>
						<a href="http://Lenoir-Rhyne.com#request.fw.home#/#ActLink#?ID=#session.Usr.GloballyUniqueIdentifier#&ActSort=#ActSort#">#ActName#</a>
					</td>
				</cfif>
				<td class="num">#Earned#</td>
			</tr>
		</cfloop>
	</tbody>
</table>
</cfsavecontent>
#form.EmailBody#
<cfset new com.Email().Send(form)>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
