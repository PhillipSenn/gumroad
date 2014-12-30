<cfscript>
Paper = new com.Paper().WhereActSort(url)
Guess = new ExamplesDone().AlreadyAnswered(url)
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<p>#ActDesc#</p>
<table>
	<thead>
		<tr>
			<th>Question</th>
			<th class="date">Date</th>
			<th class="time">Time</th>
			<th class="num">Answers</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="Guess">
			<tr>
				<td>
					<dl>
						<dt>
							<a href="Examples.cfm?ActSort=#url.ActSort#&QuestionID=#QuestionID#">#QuestionDesc#</a>
						</dt>
						<dd>#GuessName#</dd>
					</dl>
				</td>
				<td class="date" data-date="#DateFormat(GuessDateTime,'yyyymmdd')#T#TimeFormat(GuessDateTime,'HHmmss.l')#">#DateFormat(GuessDateTime,'mm/dd')#</td>
				<td class="time" data-time="#TimeFormat(GuessDateTime,'HHmmss.l')#">#TimeFormat(GuessDateTime,'h:mmtt')#</td>
				<td class="num">#Guesses#</td>
			</tr>
		</cfloop>
	</tbody>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>