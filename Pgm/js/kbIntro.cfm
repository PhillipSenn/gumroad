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
<p>#ActDesc#</p>
<table>
	<thead>
		<tr>
			<th class="num">##</th>
			<th>Which JavaScript program do you want to learn about?</th>
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
						<a href="kb.cfm?ActSort=#url.ActSort#&QuestionID=#QuestionID#">#QuestionName#</a>
					<cfelseif QuestionSort EQ 2>
						<a href="kb.cfm?ActSort=#url.ActSort#&QuestionID=#QuestionID#">#QuestionName#</a>
					<cfelse>
						<a href="Collision.cfm?ActSort=#url.ActSort#&QuestionID=#QuestionID#">#QuestionName#</a>
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
<p>
<iframe src="//player.vimeo.com/video/74008847?title=0&amp;byline=0&amp;portrait=0" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> <p><a href="http://vimeo.com/74008847">Making a Simple Game in JavaScript Step-By-Step</a> from <a href="http://vimeo.com/jsla">JSLA</a> on <a href="https://vimeo.com">Vimeo</a>.</p>
</p>
<div class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header label-primary">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">Pedagogy for this assignment</h4>
			</div>
			<div class="modal-body">
				<p>JavaScript? It's all greek to me.
				</p>
				<p>While I can't necessarily teach you JavaScript, one method of learning programming is to
				take someone else's already working code and break it down into smaller pieces.
				If you start with something that works, and then you proceed to something that you <em>think should work</em>
				then that's where true learning begins.  Verifying that your new process is actually working <strong>as 
				planned</strong>, or can now be explained, is just as much work as the work is work. But being able to back out to a baseline that does
				work makes your work a little less work.
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