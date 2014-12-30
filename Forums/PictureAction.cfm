<cfscript>
new PictureAction().Save(form)
new PictureAction().SavePhotoBy(form)
if (!Len(form.Attachment)) {
	location(request.fw.home,false)
}
new com.Paper().Upload(form)
Guess = new com.Guess().Where("PaperID",form.PaperID)
for (qry in Guess) {
	new com.Attendance().Save(qry)
}
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>Thanks!</h1>

<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>