<cfscript>
Scale = new com.Scale().get(url)
Assignment = new Scale().WhereScaleID(form)
tEarned = 0
tPerfect =0
for (qry in Assignment) {
	tEarned += qry.Earned
	tPerfect += 100
}
</cfscript>

<cfoutput query="Scale">
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
		<th class="num">Points</th>
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
			<td class="num">100</td>
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
			<th class="date">#DateFormat(session.Usr.TermStart,"mm/dd")#</th>
			<th></th>
			<th class="date">#DateFormat(session.Usr.LastDayOfClasses,"mm/dd")#</th>
			<th>#CatName#</th>
			<th class="num">#tEarned#</th>
			<th>&nbsp;</th>
			<th class="num">#tPerfect#</th>
			<th></th>
		</tr>
	</tfoot>
</table>
<cfif tPerfect>
	<cfset Score = NumberFormat(tEarned / tPerfect * 100,"99.9")>
	You scored #tEarned# out of #tPerfect#, giving you a #Score#%.
	<p>But "#CatName#" is only #Assignment.ScaleSort#% of the grade.</p>
	<p>#Assignment.ScaleSort# &times; #Score/100# = #Int(tEarned / tPerfect * Assignment.ScaleSort)#.</p>
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
