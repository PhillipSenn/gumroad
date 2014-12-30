<cfscript>
include '/Inc/Paper.cfm'
Total = 0
for (qry in Guess) {
	Total += qry.Earned
}
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="htmlIntro.css">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<p>#ActDesc#</p>

<table>
	<thead>
		<tr>
			<th class="num">##</th>
			<th>Which html tag do you want to learn about?</th>
			<th class="date">Date</th>
			<th class="time">Time</th>
			<th class="num">Score</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="Guess">
			<tr>
				<td class="num">#currentRow#</td>
				<td>
					<cfif QuestionSort EQ 1>
						<a href="showClassmates.cfm?ActSort=#url.ActSort#&QuestionID=#QuestionID#">#QuestionName#</a>
					<cfelse>
						<a href="html.cfm?ActSort=#url.ActSort#&QuestionID=#QuestionID#">#QuestionName#</a>
					</cfif>
				</td>
				<td class="date">#DateFormat(GuessDateTime,"mm/dd")#</td>
				<td class="time">#TimeFormat(GuessDateTime,"h:mmtt")#</td>
				<td class="num">#Earned#</td>
			</tr>
		</cfloop>
	</tbody>
	<tfoot>
		<tr>
			<th></th>
			<th>Total</th>
			<th class="date">#DateFormat(now(),"mm/dd")#</th>
			<th class="time">#TimeFormat(now(),"h:mmtt")#</th>
			<th class="num">#Total#</th>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>