<cfscript>
form.LogTableName = 'Paper'
form.LogFieldName = 'Sum(Earned)'
form.LogIntPK = 1
form.LogIntSort = 2
new com.LogInt().Save(form)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">

<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>