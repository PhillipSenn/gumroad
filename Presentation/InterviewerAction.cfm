<cfscript>
new Interviewer().Save(form)
new com.Attendance().Save(form)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
OK, thanks.<br>
You'll get an email when I grade the presentations.
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>