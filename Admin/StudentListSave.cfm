<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<cfscript>
function myFunction(UsrID,i,UsrIDs) {
	form.UsrID = arguments.UsrID
	form.EmailBody = form.body
	form.EmailSubject = form.subject
	new com.Email().Send(form);
}

if (IsDefined('form.UsrIDs')) {
	arrUsrIDs = ListToArray(form.UsrIDs)
	arrUsrIDs.each(myFunction)
}
</cfscript>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>