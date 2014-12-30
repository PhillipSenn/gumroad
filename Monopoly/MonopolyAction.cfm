<cfscript>
dump(form)
abort;
new com.Guess().Save(form)
location('Monopoly.cfm?ActSort=' & form.ActSort,false)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">

<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>