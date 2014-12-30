<cfscript>
Guess35 = new ChatCourse().WhereCourseSort(35)
Guess71 = new ChatCourse().WhereCourseSort(71)
Guess72 = new ChatCourse().WhereCourseSort(72)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table>
	<thead>
		<tr>
			<th rowspan="2">Description</th>
			<th class="num">Section 35</th>
			<th class="num">Section 71</th>
			<th class="num">Section 72</th>
		</tr>
		<tr>
			<td class="num">M Wed 9-9:50</td>
			<td class="num">online</td>
			<td class="num">online</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Students</td>
			<td class="num">#Guess35.Usrs#</td>
			<td class="num">#Guess71.Usrs#</td>
			<td class="num">#Guess72.Usrs#</td>
		</tr>
		<tr>
			<td>Chats</td>
			<td class="num">#Guess35.Chats#</td>
			<td class="num">#Guess71.Chats#</td>
			<td class="num">#Guess72.Chats#</td>
		</tr>
		<tr>
			<td>Upvotes</td>
			<td class="num">#Guess35.Votes#</td>
			<td class="num">#Guess71.Votes#</td>
			<td class="num">#Guess72.Votes#</td>
		</tr>
	</tbody>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>