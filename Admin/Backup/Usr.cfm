<cfscript>
include "Begin.cfm"

sqlTable = "if exists (select * from sysobjects where id = object_id(N'#form.TableName#') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE #form.TableName#
GO
CREATE TABLE #form.TableName#
(UsrID Int Identity Constraint UsrID Primary Key NONCLUSTERED
,Usr_CourseID Int
,Usr_PersonID Int
,GloballyUniqueIdentifier Varchar(36) default newid()
,isAdmin Int default 0
)
GO
ALTER TABLE Usr WITH CHECK
ADD CONSTRAINT Usr_CourseID FOREIGN KEY(Usr_CourseID)
REFERENCES Course
ALTER TABLE Usr CHECK CONSTRAINT Usr_CourseID
GO
ALTER TABLE Usr WITH CHECK
ADD CONSTRAINT Usr_PersonID FOREIGN KEY(Usr_PersonID)
REFERENCES Person
ALTER TABLE Usr CHECK CONSTRAINT Usr_PersonID
"
sql = "
GO
SET IDENTITY_INSERT #form.TableName# ON
"
currentRow = 0
for (qry in response) {
	currentRow += 1
	if (currentRow MOD 1000 == 1) {
		sql &= "

INSERT INTO #form.TableName#(UsrID,Usr_CourseID,Usr_PersonID,GloballyUniqueIdentifier,isAdmin) VALUES"
		Values = " "
	}
	sql &= "
"
	sql &= Values
	sql &= "("
	sql &= "#qry.UsrID#,"
	sql &= "#qry.Usr_CourseID#,"
	sql &= "#qry.Usr_PersonID#,"
	sql &= "'#qry.GloballyUniqueIdentifier#',"
	sql &= "#qry.isAdmin#"
	sql &= ")"
	Values=","
}
sql &= "
SET IDENTITY_INSERT #form.TableName# OFF
SELECT * FROM #form.TableName#

"
include "End.cfm"
// location('Assignment.cfm',false)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<a href="Assignment.cfm">Assignment.cfm</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
