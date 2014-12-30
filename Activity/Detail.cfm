<cfscript>
Guess = new Detail().WhereGuessDate(url)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table>
	<thead>
		<tr>
			<th class="date">Date</th>
			<th class="time">Time</th>
			<th>Activity</th>
			<th>Question</th>
			<th class="num">Earned</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="Guess">
			<tr>
				<td class="date">#DateFormat(GuessDateTime,'mm/dd')#</td>
				<td class="time">#TimeFormat(GuessDateTime,'hh:mmtt')#</td>
				<td>#ActName#</td>
				<td>#QuestionName#</td>
				<td class="num">#Earned#</td>
			</tr>
		</cfloop>
	</tbody>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>