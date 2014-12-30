<cfscript>
include "Begin.cfm";

sqlTable = "if exists (select * from sysobjects where id = object_id(N'#form.TableName#') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE #form.TableName#
GO
CREATE TABLE #form.TableName#
(XWordID Int Identity(4000,1) Constraint XWordID Primary Key NONCLUSTERED
,XWord_QuestionID Int
,XWordRow Int
,XWordCol Int
)
GO
CREATE CLUSTERED INDEX QuestionID ON XWord(XWord_QuestionID,XWordRow)
GO
ALTER TABLE XWord WITH CHECK
ADD CONSTRAINT XWord_QuestionID FOREIGN KEY(XWord_QuestionID)
REFERENCES Question
ALTER TABLE XWord CHECK CONSTRAINT XWord_QuestionID
";
sql = "
GO
SET IDENTITY_INSERT #form.TableName# ON
";
CurrentRow = 0;
for (qry in response) {
	CurrentRow += 1;
	if (CurrentRow MOD 1000 == 1) {
		sql &= "

INSERT INTO #form.TableName#(XWordID,XWord_QuestionID,XWordRow,XWordCol) VALUES";
		Values = " ";
	}
	sql &= "
";
	sql &= Values;
	sql &= "(";
	sql &= "#qry.XWordID#,";
	sql &= "#qry.XWord_QuestionID#,";
	sql &= "#qry.XWordRow#,";
	sql &= "#qry.XWordCol#";
	sql &= ")";
	Values=",";
}
sql &= "
SET IDENTITY_INSERT #form.TableName# OFF
SELECT * FROM #form.TableName#

";
include "End.cfm";
// location('Person.cfm',false)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<a href="Person.cfm">Person.cfm</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
