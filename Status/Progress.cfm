<cfscript>
Scale = new Progress().DetailByCategory()
TotalEarned = 0
TotalPoints = 0
TotalScaleSort = 0
GradeSort = 0
</cfscript>

<cfoutput query="session.Usr">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table>
	<thead>
		<tr>
			<th>Category</th>
			<th class="num">Score</th>
			<th>Activity</th>
			<th class="num">Weight</th>
			<th class="num">Earned</th>
			<th class="num">Points</th>
		</tr>
	</thead>
	<tbody>
	
	<cfloop query="Scale">
		<tr>
			<td>#CatName#</td>
			<td></td>
			<td>
				<cfif CatName EQ "Attendance">
					#ActName#
				<cfelseif Earned LT 100>
					<a href="#request.fw.home#/#ActLink#?ActSort=#ActSort#">#ActName#</a>
				<cfelse>
					#ActName#
				</cfif>
			</td>
			<td></td>
			<td class="num">#Earned#</td>
			<td class="num">100</td>
		</tr>
		<cfset TotalEarned += Earned>
		<cfset TotalPoints += 100>
		<cfif recordCount EQ currentRow OR Scale.ScaleID[currentRow+1] NEQ ScaleID>
			<cfif TotalPoints>
				<cfset Score = Numberformat(ScaleSort * TotalEarned / TotalPoints,"99.9")>
			<cfelse>
				<cfset Score = 0>
			</cfif>
			<cfset GradeSort += Score>
			<tr>
				<th><a href="Scale.cfm?ScaleID=#ScaleID#">#CatName#</a></th>
				<th class="num">#Score#</th>
				<th>Total</th>
				<th class="num">#ScaleSort#</th>
				<th class="num">&times; #TotalEarned#</th>
				<th class="num">&divide; #TotalPoints#</th>
			</tr>
			<cfset TotalEarned = 0>
			<cfset TotalPoints = 0>
			<cfset TotalScaleSort += ScaleSort>
		</cfif>
	</cfloop>
	</tbody>
	<cfset Grade = new com.Grade().WhereGradeSortLE(GradeSort)>
	<tfoot>
		<tr>
			<th>Grade</th>
			<th class="num">#GradeSort#</th>
			<th>#Grade.GradeName#</th>
			<th class="num">#TotalScaleSort#</th>
			<th class="num">n/a</th>
			<th class="num">n/a</th>
		</tr>
	</tfoot>
</table>
<p id="bottom">
	<a href="ProgressEmail.cfm">Send Email</a>
</p>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
