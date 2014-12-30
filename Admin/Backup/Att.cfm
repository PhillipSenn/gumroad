<cfscript>
include "Begin.cfm";

sqlTable = "if exists (select * from sysobjects where id = object_id(N'#form.TableName#') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE #form.TableName#
GO
CREATE TABLE #form.TableName#
(AttID Int Identity Constraint AttID Primary Key NONCLUSTERED
,For_ActID Int -- The ActID that this attendance activity is for.
,Att_ActID Int -- The Attendance Activity itself
)
GO
CREATE UNIQUE Clustered INDEX ForAct ON Att(For_ActID)
GO
ALTER TABLE Att WITH CHECK
ADD CONSTRAINT Att_ActID FOREIGN KEY(Att_ActID)
REFERENCES Act
ALTER TABLE Att CHECK CONSTRAINT Att_ActID

ALTER TABLE Att WITH CHECK
ADD CONSTRAINT For_ActID FOREIGN KEY(For_ActID)
REFERENCES Act
ALTER TABLE Att CHECK CONSTRAINT For_ActID
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

INSERT INTO #form.TableName#(AttID,For_ActID,Att_ActID) VALUES";
		Values = " ";
	}
	sql &= "
";
	sql &= Values;
	sql &= "(";
	sql &= "#qry.AttID#,";
	sql &= "#qry.For_ActID#,";
	sql &= "#qry.Att_ActID#";
	sql &= ")";
	Values=",";
}
sql &= "
SET IDENTITY_INSERT #form.TableName# OFF
SELECT * FROM #form.TableName#

";
include "End.cfm";
// location('Question.cfm',false)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<a href="Question.cfm">Question.cfm</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
