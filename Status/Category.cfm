<cfscript>
Cat = new com.Cat().get(form)
Assignment = new Category().WhereCatID(form)
tEarned = 0
tPerfect =0
for (qry in Assignment) {
	tEarned += qry.Earned
	tPerfect += qry.Perfect
}
</cfscript>

<cfoutput query="Cat">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>#CatName#</h1>
<table>
	<thead>
		<tr>
		<th>Start<br>Date</th>
		<th class="date">Date<br>Submitted</th>
		<th class="date">Date<br>Due</th>
		<th>Assignment</th>
		<th class="num">Your Score</th>
		<cfif CatName NEQ "Attendance">
			<th>Graded</th>
		</cfif>
		<th class="num">Perfect</th>
		<th>Deadline</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="Assignment">
			<tr>
			<td class="date">#DateFormat(AssignmentStart,"mm/dd")#</td>
			<td class="date">#DateFormat(GuessDateTime,"mm/dd")#</td>
			<td class="date">#DateFormat(AssignmentStop,"mm/dd")#</td>
			<td>
				<cfif CatName EQ "Attendance">
					<a href="Attendance.cfm?ActSort=#ActSort#">#ActName#</a>
				<cfelse>
					<a href="#request.fw.home#/#ActLink#?ActSort=#ActSort#">#ActName#</a>
				</cfif>
			</td>
			<td class="num">
				<cfif Val(Earned)>
					<a href="Paper.cfm?PaperID=#PaperID#">
					#Earned#
					</a>
				<cfelse>
					#Earned#
				</cfif>
			</td>
			<cfif CatName EQ "Attendance">
			<cfelseif GuessID EQ "">
				<td>&nbsp;</td>
			<cfelse>
				<td>#Graded#</td>
			</cfif>
			<td class="num">#Perfect#</td>
			<td>
				<cfif Earned LT 100>
					<cfif AssignmentStop GT now()>
						#DateDiff('d',Now(),AssignmentStop)# days
					<cfelse>
						#DateFormat(AssignmentStop,"mm/dd")#
					</cfif>
				</cfif>
			</td>
			</tr>
		</cfloop>
	</tbody>
	<tfoot>
		<tr>
			<td>#DateFormat(session.Usr.TermStart,"mm/dd")#</td>
			<td></td>
			<td>#DateFormat(session.Usr.LastDayOfClasses,"mm/dd")#</td>
			<td>Total</td>
			<td class="num">#tEarned#</td>
			<td>&nbsp;</td>
			<td class="num">#tPerfect#</td>
			<td></td>
		</tr>
	</tfoot>
</table>
<cfif tPerfect>
	<cfset Score = Int(tEarned / tPerfect * 100)>
	You scored #tEarned# out of #tPerfect#, giving you a #Score#%.
	<p>But "#CatName#" is only #Assignment.ScaleSort#% of the grade.</p>
	<p>#Score# &times; #Assignment.ScaleSort# = #Int(tEarned / tPerfect * Assignment.ScaleSort)#.</p>
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
