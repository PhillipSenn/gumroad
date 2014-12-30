<cfscript>
new OnlineAction().SavePaper(form)
new OnlineAction().SaveGuess(form)
Guess = new com.Guess().Where("PaperID",form.PaperID)
for (qry in Guess) {
	new com.Attendance().Save(qry)
}
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>Thanks!</h1>
<p>Since it's the end of the mini-term, I'm going to preliminarily give it a 100.<br>
You will get an email when I actually <em>do</em> grade it.
</p>
<p>By temporarily giving it a 100 though, you can rest assured that you've turned it in and I've received it.</p>
<p><a href="../Status/Status.cfm">Click here to see your status</a></p>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>