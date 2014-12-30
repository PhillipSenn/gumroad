<cfscript>
form.EmailSubject = 'Progress Report'
Usr = new com.Usr().Where('CourseID',session.Usr)
form.Silent = true
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<cfloop query="Usr">
	#UsrName#<br>
	<cfset form.UsrID = UsrID>
	<!---
	<cfif form.UsrID EQ session.Usr.UsrID>
	--->
		<cfset Calendar = new ProgressEmail().ByDate(form)>
		<cfsavecontent variable="form.EmailBody">
		#FirstName#:
		<p>I thought I would send a progress report out to every student.
		Because I use GMail, your progress has been recorded in my sent items folder,
		just in case the primary server fails.
		</p>
		<table border="1">
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
					<th align="right">Earned</th>
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
						<td align="right">#Earned#</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
		</cfsavecontent>
		<cfset new com.Email().Send(form)>
	<!---
	</cfif>
	--->
</cfloop>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
