<cfscript>
setting showDebugOutput=true;
if (Now() > session.Usr.FinalStart) {
	location('Final.cfm',false)
}

Cat = new Progress().SumByCategory()
GrandPossible = 0
GrandEarned = 0
GrandScaleSort = 0
</cfscript>

<cfoutput query="session.Usr">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table>
<thead>
	<tr>
		<th>Category</th>
		<cfif Now() LT LastDayOfClasses>
			<th class="num">Weight</th>
		</cfif>
		<th class="num">Earned</th>
		<th class="num">Possible</th>
		<th class="num">Grade</th>
	</tr>
</thead>
<tbody>
<cfloop query="Cat">
	<cfif Perfect>
		<cfset TotalPossible = ScaleSort>
		<cfset TotalEarned = Int(10 * TotalPossible * Earned / Perfect) / 10>
		<cfset myGrade = Int(Earned / Perfect*1000)/10>
	<cfelse>
		<cfset TotalPossible = 0>
		<cfset TotalEarned = 0>
		<cfset myGrade = 0>
	</cfif>
	<tr>
		<td>
			<a href="Category.cfm?CatID=#CatID#">#CatName#</a>
		</td>
		<cfif Now() LT LastDayOfClasses>
			<td class="num">#ScaleSort#</td>
		</cfif>
		<td class="num">#NumberFormat(TotalEarned,"999.9")#</td>
		<td class="num">#TotalPossible#</td>
		<td class="num">#NumberFormat(myGrade,"999.9")#%</td>
	</tr>
	<cfset GrandScaleSort += ScaleSort>
	<cfset GrandEarned += TotalEarned>
	<cfset GrandPossible += TotalPossible>
</cfloop>
</tbody>
<cfif GrandPossible> <!--- Nothing is due the first day of class --->
	<cfset form.GradeSort = Int(1000 * GrandEarned/GrandPossible)/10>
<cfelse>
	<cfset form.GradeSort = 0>
</cfif>
<cfset Grade = new Progress().WhereGradeSortLE(form)>
<cfif !GrandEarned>
<cfelse>
	<tfoot>
		<tr>
			<th>Progress</th>
			<cfif Now() LT LastDayOfClasses>
				<th class="num">#GrandScaleSort#</th>
			</cfif>
			<th class="num">#NumberFormat(GrandEarned,"999.9")#</th>
			<th class="num">#GrandPossible#</th>
			<th class="num">#form.GradeSort#%</th>
		</tr>
		<tr>
			<cfif Now() LT LastDayOfClasses>
				<th colspan="4">As of #DateFormat(now(),"mm/dd")# at #TimeFormat(now(),"hh:mmtt")#</th>
			<cfelse>
				<th colspan="3">As of #DateFormat(now(),"mm/dd")# at #TimeFormat(now(),"hh:mmtt")#</th>
			</cfif>
			<th class="num">#Grade.GradeName#</th>
		</tr>
		<!--- LastDayOfClasses
		<tr>
			<th colspan="5">
				<span class="pull-right">
					<a href="Final.cfm">But if class were to end today...</a>
				</span>
			</th>
		</tr>
		--->
	</tfoot>
</cfif>
</table>
<p>
	<a href="ProgressEmail.cfm">Send Email</a>
</p>
#session.Usr.UsrID#
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
