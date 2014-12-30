<cfscript>
include "Begin.cfm";

sqlTable = "if exists (select * from sysobjects where id = object_id(N'#form.TableName#') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE #form.TableName#
GO
CREATE TABLE #form.TableName#
(QuestionID Int Identity(3000,1) Constraint QuestionID Primary Key NONCLUSTERED
,Question_ActID Int
,QuestionName nvarchar(1600) default '' -- The question itself
,QuestionDesc Varchar(Max) default '' -- Professor Senn: I don't really get the purpose of this question.
,QuestionSort Int default 0 -- ORDER BY QuestionSort,NewID()
,Points Int default 100
,Ref Varchar(128) default ''
,Obj Int default 0
)
GO
CREATE CLUSTERED INDEX ActID on Question(Question_ActID,QuestionSort)
GO
ALTER TABLE Question WITH CHECK
ADD CONSTRAINT Question_ActID FOREIGN KEY(Question_ActID)
REFERENCES Act
ALTER TABLE Question CHECK CONSTRAINT Question_ActID
";
sql = "
GO
SET IDENTITY_INSERT #form.TableName# ON
INSERT INTO #form.TableName#(QuestionID,Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points,Ref,Obj) VALUES";
Values = " ";
for (qry in response) {
	sql &= "
";
	sql &= Values;
	sql &= "(";
	sql &= "#qry.QuestionID#,";
	sql &= "#qry.Question_ActID#,";
	sql &= "'" & Replace(qry.QuestionName,"'","''","all") & "',";
	sql &= "'" & Replace(qry.QuestionDesc,"'","''","all") & "',";
	sql &= "#qry.QuestionSort#,";
	sql &= "#qry.Points#,";
	sql &= "'" & Replace(qry.Ref,"'","''","all") & "',";
	sql &= "#qry.Obj#";
	sql &= ")";
	Values=",";
}
sql &= "
SET IDENTITY_INSERT #form.TableName# OFF
SELECT * FROM #form.TableName#

";
include "End.cfm";
// location('Answer.cfm',false)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<a href="Answer.cfm">Answer.cfm</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
