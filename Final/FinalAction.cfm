<cfscript>
if (Len(form.Attachment)) {
	new com.Paper().Upload(form)
	Guess = new com.Guess().Where('PaperID',form.PaperID)
	for (qry in Guess) {
		new com.Attendance().Save(qry)
	}
	request.fw.msg = 'Thank you!'
} else {
	request.fw.msg = 'No file was attached'
}
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<cfif Len(form.Attachment)>
	<p>You'll get an email when I grade it.</p>
	<p>Phillip Senn</p>
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>