<cfscript>
include "Begin.cfm";

sqlTable = "if exists (select * from sysobjects where id = object_id(N'#form.TableName#') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE #form.TableName#
GO
CREATE TABLE #form.TableName#
(GradeID Int Identity(10,1) Constraint GradeID PRIMARY KEY
,GradeName Varchar(2)
,GradeSort Int
)
";
sql = "
GO
SET IDENTITY_INSERT #form.TableName# ON
INSERT INTO #form.TableName#(GradeID,GradeName,GradeSort) VALUES";
Values = " ";
for (qry in response) {
	sql &= "
";
	sql &= Values;
	sql &= "(";
	sql &= "#qry.GradeID#,";
	sql &= "'#qry.GradeName#',";
	sql &= "#qry.GradeSort#";
	sql &= ")";
	Values=",";
}
sql &= "
SET IDENTITY_INSERT #form.TableName# OFF
SELECT * FROM #form.TableName#

";
include "End.cfm";
// location('Term.cfm',false)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<a href="Term.cfm">Term.cfm</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
