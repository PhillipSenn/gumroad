<cfscript>
new Answer().Save(form)
new com.Attendance().Save(form) // The only thing I know is the GuessID
Paper = new com.Paper().WhereActSort(url)
Guess = new FIB().Next(Paper)
if (Guess.Recordcount) {
	location('Question.cfm?ActSort=' & url.ActSort & '&GuessID=' & Guess.GuessID,false)
} else {
	location('FIB.cfm?ActSort=' & url.ActSort,false)
}
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">

<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>