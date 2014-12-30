<cfscript>
include '/Inc/Paper.cfm'
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
The layout of these puzzles were done by <a href="http://www.crossword-compiler.com/">Crossword-Compiler.com</a>,
and the content is from the textbook.
<p>
<cfif now() LT Paper.AssignmentStart>
	<a class="btn-warning" href="#request.fw.home#">Assignment begins 
	#DayOfWeekAsString(DayOfWeek(Paper.AssignmentStart))#
	#DateFormat(Paper.AssignmentStart,"mm/dd")#</a>
<cfelse>
	<a class="btn-primary" href="XWord.cfm?ActSort=#url.ActSort#">Ready!</a>
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
		Well, it looks like they removed
		the crossword puzzle from <a target="_blank" href="http://www.cengagebrain.com/">cengagebrain.com</a>,
		but when I first received the textbook 
<blockquote>Discovering Computers: Essentials<br>
Misty E. Vermaat<br>
ISBN-10: 1-285-16178-5<br>
ISBN-13: 978-1-285-16178-5<br>
</blockquote>
		it had a crossword puzzle for each of the 5 chapters in the Student Companion Site. <br>
		The only problem was:
		<ol>
			<li>It required Java to be installed</li>
			<li>It wasn't graded</li>
			<li>It revealed all the answers</li>
		</ol>
		Who's going to do a crossword puzzle for a subject that's not in their major just for fun?
		I mean, if it were in your major you might, but certainly not for an elective class.
		So I wrote one that posts your score to the grading system.
		Now I can make my own rules for it such as when to reveal letters.
		</p>
		<a href="BruteForce.cfm">More&hellip;</a>
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