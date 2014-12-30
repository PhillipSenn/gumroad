<cfscript>

</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<form action="Gallery.cfm">
	<select name="CourseSort">
		<option value="0">Which section?</option>
		<option value="35">35: Mon, Wed</option>
		<option value="71">71: online</option>
		<option value="72">72: online</option>
	</select>
</form>
<cfinclude template="/Inc/foot.cfm">
<script src="#request.fw.home#/Inc/js/fw/selectSubmit.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>