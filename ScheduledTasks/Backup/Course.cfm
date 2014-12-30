<cfscript>
include "Begin.cfm"

sqlTable = "if exists (select * from sysobjects where id = object_id(N'#form.TableName#') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE #form.TableName#
GO
CREATE TABLE #form.TableName#
(CourseID Int Identity(30,1) Constraint CourseID Primary Key NONCLUSTERED
,Course_TermID Int
,CourseName Varchar(128) default ''
,CourseDesc Varchar(128)
,CourseSort Int default 0
,Online Int default 0
)
GO
ALTER TABLE Course WITH CHECK
ADD CONSTRAINT Course_TermID FOREIGN KEY(Course_TermID)
REFERENCES Term
ALTER TABLE Course CHECK CONSTRAINT Course_TermID
"
sql = "
GO
SET IDENTITY_INSERT #form.TableName# ON
INSERT INTO #form.TableName#(CourseID,Course_TermID,CourseName,CourseDesc,CourseSort,Online) VALUES"
Values = " "
for (qry in response) {
	sql &= "
"
	sql &= Values
	sql &= "("
	sql &= "#qry.CourseID#,"
	sql &= "'#qry.Course_TermID#',"
	sql &= "'#qry.CourseName#',"
	sql &= "'#qry.CourseDesc#',"
	sql &= "#qry.CourseSort#,"
	sql &= "#qry.Online#"
	sql &= ")"
	Values=","
}
sql &= "
SET IDENTITY_INSERT #form.TableName# OFF
SELECT * FROM #form.TableName#

"
include "End.cfm"
// location('Cat.cfm',false)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<a href="Cat.cfm">Cat.cfm</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
