<cfscript>
Guess = new Activity().byDate()
</cfscript>

<cfoutput query="session.Usr">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>Processing...</h1>
<div id="visualization">
</div>
<table>
	<thead>
		<tr>
			<th>Day</th>
			<th class="date">Date</th>
			<th class="num">Earned</th>
			<th class="num">Possible</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="Guess">
		<tr>
			<td>#Left(DayOfWeekAsString(DayOfWeek(CalendarDate)),3)#</td>
			<td class="date">
				<cfif Val(Earned)>
					<a href="Detail.cfm?CalendarDate=#DateFormat(CalendarDate,'mm/dd/yyyy')#">#DateFormat(CalendarDate,'mm/dd')#</a>
				<cfelse>
					#DateFormat(CalendarDate,'mm/dd')#
				</cfif>
			</td>
			<td class="num">#Earned#</td>
			<td class="num">#Points#</td>
		</tr>
	</cfloop>
	</tbody>
</table>
<cfinclude template="/Inc/foot.cfm">
<input type="hidden" id="UsrName" value="#UsrName#">
<script src="http://www.google.com/jsapi"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>
