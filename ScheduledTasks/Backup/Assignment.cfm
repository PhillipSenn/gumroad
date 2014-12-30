<cfscript>
include "Begin.cfm"

sqlTable = "if exists (select * from sysobjects where id = object_id(N'#form.TableName#') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE #form.TableName#
GO
CREATE TABLE #form.TableName#
(AssignmentID Int Identity Constraint AssignmentID Primary Key NONCLUSTERED
,Assignment_ActID Int
,Assignment_ScaleID Int
,AssignmentStart smalldatetime default getdate()
,AssignmentStop smalldatetime default getdate()
)
GO
CREATE UNIQUE CLUSTERED INDEX ActID ON Assignment(Assignment_ActID,Assignment_ScaleID)
CREATE INDEX ScaleID ON Assignment(Assignment_ScaleID)
GO
ALTER TABLE Assignment WITH CHECK
ADD CONSTRAINT Assignment_ScaleID FOREIGN KEY(Assignment_ScaleID)
REFERENCES Scale
ALTER TABLE Assignment CHECK CONSTRAINT Assignment_ScaleID

ALTER TABLE Assignment WITH CHECK
ADD CONSTRAINT Assignment_ActID FOREIGN KEY(Assignment_ActID)
REFERENCES Act
ALTER TABLE Assignment CHECK CONSTRAINT Assignment_ActID
"
sql = "
GO
SET IDENTITY_INSERT #form.TableName# ON
"
CurrentRow = 0
for (qry in response) {
	CurrentRow += 1
	if (CurrentRow MOD 1000 == 1) {
		sql &= "

INSERT INTO #form.TableName#(AssignmentID,Assignment_ActID,Assignment_ScaleID,AssignmentStart,AssignmentStop) VALUES"
		Values = " "
	}
	sql &= "
"
	sql &= Values
	sql &= "("
	sql &= "#qry.AssignmentID#,"
	sql &= "#qry.Assignment_ActID#,"
	sql &= "#qry.Assignment_ScaleID#,"
	sql &= "'" & DateFormat(qry.AssignmentStart,"mm/dd/yyyy ") & TimeFormat(qry.AssignmentStart,"HH:mm") & "',"
	sql &= "'" & DateFormat(qry.AssignmentStop,"mm/dd/yyyy ") & TimeFormat(qry.AssignmentStop,"HH:mm") & "'"
	sql &= ")"
	Values=","
}
sql &= "
SET IDENTITY_INSERT #form.TableName# OFF
SELECT * FROM #form.TableName#

"
include "End.cfm"
// location('Paper.cfm',false)
</cfscript>


<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<a href="Paper.cfm">Paper.cfm</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
