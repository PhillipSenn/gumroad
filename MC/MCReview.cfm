<cfscript>
Guess = new MCReview().WhereActSort(url)
TotalEarned = 0
for (qry in Guess) {
	TotalEarned += qry.Earned
}
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table>
	<thead>
		<tr>
			<th>Question</th>
			<th class="num">Earned</th>
			<th>Correct<br>Answer</th>
			<th>Your<br>Answer</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="Guess">
			<tr>
				<td>#QuestionName#</td>
				<td class="num">#Earned#</td>
				<td>#CorrectAnswerName#</td>
				<td>
					<cfif AnswerName NEQ CorrectAnswerName>
						#AnswerName#
					</cfif>
				</td>
			</tr>
		</cfloop>
	</tbody>
	<tfoot>
		<tr>
			<th>Total</th>
			<th class="num">#TotalEarned#</th>
			<th>&nbsp;</th>
			<th>&nbsp;</th>
		</tr>
	</tfoot>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>