<cfscript>
include '/Inc/Paper.cfm'
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
Drag the answer from the left-hand side to the right-hand side.

<p>I've found that it's easiest to read what's in the the right-hand column and
then go down the list of words on the left to find the answer.</p>
<p>
<cfif now() LT Paper.AssignmentStart>
	<a class="btn-warning" href="#request.fw.home#">Assignment begins 
	#DayOfWeekAsString(DayOfWeek(Paper.AssignmentStart))#
	#DateFormat(Paper.AssignmentStart,"mm/dd")#</a>
<cfelse>
	<a class="btn-primary" href="Matching.cfm?ActSort=#url.ActSort#">Ready!</a>
</cfif>
<p>
	<button class="btn-info" type="button" data-toggle="modal" data-target=".modal">Pedagogy</button>
</p>
<!---
<a class="btn" href="/jqm/Matching/Matching.cfm?ActSort=#url.ActSort#">jQuery Mobile</a>
--->
<div class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header label-primary">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">Pedagogy for this assignment</h4>
			</div>
			<div class="modal-body">
				<div>These questions came from 
				<blockquote>Discovering Computers: Essentials<br>
					Misty E. Vermaat<br>
					ISBN-10: 1-285-16178-5<br>
					ISBN-13: 978-1-285-16178-5<br>
				</blockquote>
				Here it is in <a href="http://books.google.com/books?id=CQ1xnbYcvc8C&printsec=frontcover">Google books</a>.
				</div>
				<p>Don't give up if you get the wrong answer!  Just keep working on it until you've made a 100! Yay!</p>
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