<cfscript>
include "Begin.cfm"

sqlTable = "if exists (select * from sysobjects where id = object_id(N'#form.TableName#') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE #form.TableName#
GO
CREATE TABLE #form.TableName#
(CatID Int Identity Constraint CatID Primary Key NONCLUSTERED
,CatName varchar(128)
,CatSort Int default 0
)
GO
"
sql = "
GO
SET IDENTITY_INSERT #form.TableName# ON
INSERT INTO #form.TableName#(CatID,CatName,CatSort) VALUES"
Values = " "
for (qry in response) {
	sql &= "
"
	sql &= Values
	sql &= "("
	sql &= "#qry.CatID#,"
	sql &= "'#qry.CatName#',"
	sql &= "#qry.CatSort#"
	sql &= ")"
	Values=","
}
sql &= "
SET IDENTITY_INSERT #form.TableName# OFF
SELECT * FROM #form.TableName#

"
include "End.cfm"
// location('Scale.cfm',false)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<a href="Scale.cfm">Scale.cfm</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
