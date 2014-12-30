<cfscript>
Usr = new ChatStats().Stats()
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table class="no-striped no-hover">
	<thead>
		<tr>
			<th>Student Name</th>
			<th class="num">Likes<br>Bestowed</th>
			<th class="num">Chats<br>Posted</th>
			<th class="num">Likes<br>Earned</th>
			<th class="num">Points<br>Earned</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="Usr">
			<tr>
				<td>#UsrName#</td>
				<td class="num">#Liked#</td>
				<td class="num"><a href="Chat.cfm?ActSort=30601&OtherUsrID=#UsrID#&hideMyUpVotes=false">#Guesses#</a></td>
				<td class="num">#Likes#</td>
				<td class="num">#Earned#</td>
			</tr>
		</cfloop>
	</tbody>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>