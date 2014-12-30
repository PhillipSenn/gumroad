<cfscript>
include "Begin.cfm";

sqlTable = "if exists (select * from sysobjects where id = object_id(N'#form.TableName#') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE #form.TableName#
GO
CREATE TABLE #form.TableName#
(ScaleID Int Identity Constraint ScaleID Primary Key NONCLUSTERED
,Scale_CourseID Int
,Scale_CatID Int
,ScaleSort Int default 0 -- Weight
)
GO
CREATE CLUSTERED INDEX CourseID ON Scale(Scale_CourseID)
GO
ALTER TABLE Scale WITH CHECK
ADD CONSTRAINT Scale_CourseID FOREIGN KEY(Scale_CourseID)
REFERENCES Course
ALTER TABLE Scale CHECK CONSTRAINT Scale_CourseID
";
sql = "
GO
SET IDENTITY_INSERT #form.TableName# ON
";
currentRow = 0;
for (qry in response) {
	currentRow += 1;
	if (currentRow MOD 1000 == 1) {
		sql &= "

INSERT INTO #form.TableName#(ScaleID,Scale_CourseID,Scale_CatID,ScaleSort) VALUES";
		Values = " ";
	}
	sql &= "
";
	sql &= Values;
	sql &= "(";
	sql &= "#qry.ScaleID#,";
	sql &= "#qry.Scale_CourseID#,";
	sql &= "#qry.Scale_CatID#,";
	sql &= "#qry.ScaleSort#";
	sql &= ")";
	Values=",";
}
sql &= "
SET IDENTITY_INSERT #form.TableName# OFF
SELECT * FROM #form.TableName#

";
include "End.cfm";
// location('Act.cfm',false)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<a href="Act.cfm">Act.cfm</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
