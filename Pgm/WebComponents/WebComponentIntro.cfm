<cfscript>
include '/Inc/Paper.cfm'
Total = 0
for (qry in Guess) {
	Total += qry.Earned
}
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<fieldset>
	<legend><span class="label-info">Important</span></legend>
	Please use Google Chrome for this assignment.
	You can see <a href="http://caniuse.com/##search=components">here</a>
	that the Google Chrome browser has these new features whereas Internet Explorer and Firefox do not.
</fieldset>
<p>#ActDesc#</p>
<table>
	<thead>
		<tr>
			<th class="num">##</th>
			<th>Which Web Component do you want to learn about?</th>
			<th class="date">Date</th>
			<th class="time">Time</th>
			<th class="num">Score</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="Guess">
			<tr>
				<td class="num">#currentRow#</td>
				<td>
					<cfif QuestionSort EQ 1>
						<a href="wc.cfm?ActSort=#url.ActSort#&QuestionID=#QuestionID#">#QuestionName#</a>
					<cfelseif QuestionSort EQ 2>
						<a href="wc.cfm?ActSort=#url.ActSort#&QuestionID=#QuestionID#">#QuestionName#</a>
					<cfelse>
						<a href="wc.cfm?ActSort=#url.ActSort#&QuestionID=#QuestionID#">#QuestionName#</a>
					</cfif>
				</td>
				<td class="date">#DateFormat(GuessDateTime,"mm/dd")#</td>
				<td class="time">#TimeFormat(GuessDateTime,"h:mmtt")#</td>
				<td class="num">#Earned#</td>
			</tr>
		</cfloop>
	</tbody>
	<tfoot>
		<tr>
			<th></th>
			<th>Total</th>
			<th class="date">#DateFormat(now(),"mm/dd")#</th>
			<th class="time">#TimeFormat(now(),"h:mmtt")#</th>
			<th class="num">#Total#</th>
</table>
<button class="btn-info" type="button" data-toggle="modal" data-target=".modal">Pedagogy</button>
<div class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header label-primary">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">Pedagogy for this assignment</h4>
			</div>
			<div class="modal-body">
				<p>Web Components! What?
				</p>
				<p>I don't expect you to learn how to use web components.
				Just understand the concept that someone can write a component and publish it.
				It's not as easy as a <a href="http://cs.finescale.com/fsm/modeling_subjects/f/2/p/158668/1752605.aspx">snap-tite model</a>, but then again, those models are harder than they look too!
				</p> 
			</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>