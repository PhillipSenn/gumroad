<cfscript>
Paper = new com.Paper().get(url)
Guess = new com.Guess().Where("PaperID",url)
TotalPoints = 0
TotalEarned = 0
for (qry in Guess) {
	TotalEarned += qry.Earned
	TotalPoints += qry.Points
}
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<table>
	<thead>
		<tr>
			<th>Question</th>
			<th class="num">Earned</th>
			<th class="num">Possible</th>
			<th class="date">Date</th>
			<th class="time">Time</th>
		</tr>
	</thead>
	<cfloop query="Guess">
		<tr>
			<td>#QuestionName#</td>
			<td class="num">
				<cfif GuessDateTime NEQ "">
					#Earned#
				</cfif>
			</td>
			<td class="num">#Points#</td>
			<td class="date">
				#DateFormat(GuessDateTime,"mm/dd")#
			</td>
			<td class="time">
				#TimeFormat(GuessDateTime,"hh:mmtt")#
			</td>
		</tr>
	</cfloop>
	<tfoot>
		<tr>
			<th>Total and Date Due</th>
			<th class="num">#TotalEarned#</th>
			<th class="num">#TotalPoints#</th>
			<th class="date">
				#DateFormat(AssignmentStop,"mm/dd")#
			</th>
			<th class="time">
				#TimeFormat(AssignmentStop,"hh:mmtt")#
			</th>
		</tr>
	</tfoot>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>