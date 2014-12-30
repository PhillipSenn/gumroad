<cfscript>
include "Begin.cfm"

sqlTable = "if exists (select * from sysobjects where id = object_id(N'#form.TableName#') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE #form.TableName#
GO
CREATE TABLE #form.TableName#
(TermID Int Identity(20,1) Constraint TermID Primary Key NONCLUSTERED
,TermName Varchar(128)
,TermStart DateTime2
,LastDayOfClasses DateTime2
,FinalStart DateTime2
,FinalStop DateTime2
,GradesDueGrad DateTime2
,FinalGradesDue DateTime2
)
"
sql = "
GO
SET IDENTITY_INSERT #form.TableName# ON
INSERT INTO #form.TableName#(TermID,TermName,TermStart,LastDayOfClasses,FinalStart,FinalStop,GradesDueGrad,FinalGradesDue) VALUES"
Values = " "
for (qry in response) {
	sql &= "
"
	sql &= Values
	sql &= "("
	sql &= "#qry.TermID#,"
	sql &= "'#qry.TermName#',"
	sql &= "'" & DateFormat(qry.TermStart,"mm/dd/yyyy ") & TimeFormat(qry.TermStart,"HH:mm") & "',"
	sql &= "'" & DateFormat(qry.LastDayOfClasses,"mm/dd/yyyy ") & TimeFormat(qry.LastDayOfClasses,"HH:mm") & "',"
	sql &= "'" & DateFormat(qry.FinalStart,"mm/dd/yyyy ") & TimeFormat(qry.FinalStart,"HH:mm") & "',"
	sql &= "'" & DateFormat(qry.FinalStop,"mm/dd/yyyy ") & TimeFormat(qry.FinalStop,"HH:mm") & "',"
	sql &= "'" & DateFormat(qry.GradesDueGrad,"mm/dd/yyyy ") & TimeFormat(qry.GradesDueGrad,"HH:mm") & "',"
	sql &= "'" & DateFormat(qry.FinalGradesDue,"mm/dd/yyyy ") & TimeFormat(qry.FinalGradesDue,"HH:mm") & "'"
	sql &= ")"
	Values=","
}
sql &= "
SET IDENTITY_INSERT #form.TableName# OFF
SELECT * FROM #form.TableName#

"
include "End.cfm"
// location('Course.cfm',false)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<a href="Course.cfm">Course.cfm</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
