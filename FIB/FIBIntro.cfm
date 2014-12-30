<cfscript>
include '/Inc/Paper.cfm'

Guess = new FIB().Next(Paper)
if (!Guess.Recordcount) {
	location('FIB.cfm?ActSort=' & url.ActSort,false)
}
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>Fill in the Blank</h1>
<p>Points are deducted for wrong guesses with this assignment, so be careful.</p>
<p>Inspired by Wheel of Fortune, you can click on a letter and it will show you where that letter is used, but if you click
on a letter that isn't used anywhere, it will count off 1 point.</p>
<p>Vowels cost 2 points if they're not used in the word or phrase.</p>
<p>
<cfif now() LT Paper.AssignmentStart>
	<a class="btn-warning" href="#request.fw.home#">Assignment begins 
	#DayOfWeekAsString(DayOfWeek(Paper.AssignmentStart))#
	#DateFormat(Paper.AssignmentStart,"mm/dd")#</a>
<cfelse>
	<a class="btn-primary" href="Question.cfm?ActSort=#url.ActSort#&GuessID=#GuessID#">Ready!</a>
</cfif>
</p>
<p>
<button class="btn-info" type="button" data-toggle="modal" data-target=".modal">Pedagogy</button>
</p>
<div class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header label-primary">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times</button>
			<h4 class="modal-title">Pedagogy for this assignment</h4>
		</div>
		<div class="modal-body">
If you can come up with a way that allows the student to earn a 100 despite
getting letters wrong, let me know.  I'm always concerned with students 'gaming' the system
by apply a brute force strategy (you know: typing QWERTYUIPASDFGHJKLZXCVBNM).
But I want to allow students to make 100 if they're willing to work for it.
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