<cfscript>
include '/Inc/Paper.cfm'
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<p>#ActDesc#</p>
<p>Click and drag to highlight the word or phrase- <em>simple</em>!</p>
<p>
<cfif now() LT Paper.AssignmentStart>
	<a class="btn-warning" href="#request.fw.home#">Assignment begins 
	#DayOfWeekAsString(DayOfWeek(Paper.AssignmentStart))#
	#DateFormat(Paper.AssignmentStart,"mm/dd")#</a>
<cfelse>
	<a class="btn-primary" href="WordSearch.cfm?ActSort=#url.ActSort#">Ready!</a>
</cfif>
</p>
<p>
	<button class="btn-info" type="button" data-toggle="modal" data-target=".modal">Pedagogy</button>
</p>
<div class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header label-primary">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Pedagogy for this assignment</h4>
		</div>
		<div class="modal-body">
		<p>This one's a little harder to justify over a crossword puzzle where the names
		<strong>and</strong> definitions are given.
		I was just looking at the list of primary terms and secondary terms, trying to think
		of how I could make it "fun".
		</p>
		<p>I was in Barnes &amp; Noble when I saw an entire shelf devoted to word search books.
		Clearly it must be a popular pastime.
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
