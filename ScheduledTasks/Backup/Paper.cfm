<cfscript>
include "Begin.cfm"

sqlTable = "if exists (select * from sysobjects where id = object_id(N'#form.TableName#') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE #form.TableName#
GO
CREATE TABLE #form.TableName#
(PaperID Int Identity(8000,1) Constraint PaperID Primary Key NONCLUSTERED
,Paper_UsrID Int
,Paper_AssignmentID Int 
,PaperName Varchar(max) default '' -- A quote of what they said, or their caption for the picture assignment.
,PaperDesc Varchar(max) default '' -- Instructor's comment about the paper as a whole, or their description for the picture assignment.
,Attachment Varchar(max) default '' -- GUID.docx
,StudentFileName Varchar(max) default '' -- My %!.docx
)
GO
CREATE UNIQUE CLUSTERED INDEX UsrID ON Paper(Paper_UsrID,Paper_AssignmentID)
CREATE INDEX AssignmentID ON Paper(Paper_AssignmentID,Paper_UsrID)
GO
ALTER TABLE Paper WITH CHECK
ADD CONSTRAINT Paper_UsrID FOREIGN KEY(Paper_UsrID)
REFERENCES Usr
ALTER TABLE Paper CHECK CONSTRAINT Paper_UsrID

ALTER TABLE Paper WITH CHECK
ADD CONSTRAINT Paper_AssignmentID FOREIGN KEY(Paper_AssignmentID)
REFERENCES Assignment
ALTER TABLE Paper CHECK CONSTRAINT Paper_AssignmentID
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

INSERT INTO #form.TableName#(PaperID,Paper_UsrID,Paper_AssignmentID,PaperName,PaperDesc,Attachment,StudentFileName) VALUES"
		Values = " "
	}
	sql &= "
"
	sql &= Values
	sql &= "("
	sql &= "#qry.PaperID#,"
	sql &= "#qry.Paper_UsrID#,"
	sql &= "#qry.Paper_AssignmentID#,"
	sql &= "'" & Replace(qry.PaperName,"'","''","all") & "',"
	sql &= "'" & Replace(qry.PaperDesc,"'","''","all") & "',"
	sql &= "'" & Replace(qry.Attachment,"'","''","all") & "',"
	sql &= "'" & Replace(qry.StudentFileName,"'","''","all") & "'"
	sql &= ")"
	Values=","
}
sql &= "
SET IDENTITY_INSERT #form.TableName# OFF
SELECT * FROM #form.TableName#

"
include "End.cfm"
// location('Guess.cfm',false)
</cfscript>



<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<a href="Guess.cfm">Guess.cfm</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>