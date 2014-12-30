<cfscript>
Cat = new Final().SumByCategory()

GrandPossible = 0
GrandEarned = 0
GrandScaleSort = 0
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table>
<thead>
	<tr>
		<th>Category</th>
		<th class="num">Earned</th>
		<th class="num">Possible</th>
		<th class="num">Grade</th>
	</tr>
</thead>
<tbody>
<cfloop query="Cat">
	<cfset myGrade = Int(Earned / Perfect*1000)/10>
	<tr>
		<td>
			<a href="Category.cfm?CatID=#CatID#">#CatName#</a>
		</td>
		<td class="num">#Earned#</td>
		<td class="num">#Perfect#</td>
		<td class="num">#NumberFormat(myGrade,"999")#%</td>
	</tr>
	<cfset GrandScaleSort += ScaleSort>
	<cfset GrandEarned += Earned>
	<cfset GrandPossible += Perfect>
</cfloop>
</tbody>
<tfoot>
	<cfset form.GradeSort = Int(100 * GrandEarned/GrandPossible)>
	<cfset Grade = new Final().WhereGradeSortLE(form)>
	<cfif GrandEarned>
		<cfset Guess = new Final().Graded()>
		<tr>
			<th>Grade</th>
			<th class="num">#NumberFormat(GrandEarned,"99,999")#</th>
			<th class="num">#NumberFormat(GrandPossible,"99,999")#</th>
			<th class="num">#form.GradeSort#%</th>
		</tr>
		<tr>
			<th colspan="3">
				<cfif now() GT session.Usr.FinalStop>
					Final Grade
				<cfelse>
					Mini-term ends #DateFormat(session.Usr.FinalStop,'mm/dd')#
					<!---
					#TimeFormat(session.Usr.FinalStop,'hh:mmtt')#
					--->
				</cfif>
			</th>
			<th class="num">#Grade.GradeName#</th>
		</tr>
	</cfif>
</tfoot>
</table>
<p>
I want to reassure students that they are doing ok, but I don't want to give them the misimpression that they can stop working.
In most classes, the majority of the grade comes the last week of the semester.
This is natural because the final comes the last week, presentations come near the end, and projects that you've been working on all semester long come due.
</p>
<p>
So a student could in theory be making an A all semester long, stumble the last week, and end up making a B.
</p>

<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
