<cfscript>
if (IsDefined('form.Save')) {
	new Profile().Save(form)
	session.Usr = new com.Usr().get(session.Usr)
	location(request.fw.home,false)
}
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<form method="post">
	<label for="UsrName">Display Name:</label>
	<input name="UsrName" value="#session.Usr.UsrName#" autofocus>
	<label for="FirstName">First Name:</label>
	<input name="FirstName" value="#session.Usr.FirstName#">
	<label for="LastName">Last Name:</label>
	<input name="LastName" value="#session.Usr.LastName#">
	<label for="PersonName">Registrar's Name:</label>
	<input id="PersonName" disabled value="#session.Usr.PersonName#">
	<p>
		<button type="submit" name="Save">Save</button>
	</p>
</form>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>