<cfscript>
form.GuessComment = ''
Guess = new IntervieweeAction().Save(form)
new com.Attendance().Save(form)
if (Guess.recordCount) {
	location('Interviewee.cfm?ActSort=' & Guess.ActSort & '&QuestionSort=' & Guess.QuestionSort,false)
}
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>Good luck with your interview!</h1>
<p>Make sure that you listen as they're speaking.</p>
<h1>Listen!</h1>
<a href="http://bigthink.com/videos/big-think-interview-with-james-lipton">James Lipton on the importance of listening</a> (start at 10m30s)
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>