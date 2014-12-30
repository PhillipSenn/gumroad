<cfscript>
include "Begin.cfm";

sqlTable = "if exists (select * from sysobjects where id = object_id(N'#form.TableName#') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE #form.TableName#
GO
CREATE TABLE #form.TableName#
(AnswerID Int Identity(4000,1) Constraint AnswerID Primary Key NONCLUSTERED
,Answer_QuestionID Int
,AnswerName nVarchar(1024) default '' -- The answer
,AnswerSort Int Constraint AnswerSort default 0 
,Correct Int default 0
)
GO
CREATE CLUSTERED INDEX QuestionID ON Answer(Answer_QuestionID,AnswerSort)
GO
ALTER TABLE Answer WITH CHECK
ADD CONSTRAINT Answer_QuestionID FOREIGN KEY(Answer_QuestionID)
REFERENCES Question
ALTER TABLE Answer CHECK CONSTRAINT Answer_QuestionID
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

INSERT INTO #form.TableName#(AnswerID,Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES";
		Values = " ";
	}
	sql &= "
";
	sql &= Values;
	sql &= "(";
	sql &= "#qry.AnswerID#,";
	sql &= "#qry.Answer_QuestionID#,";
	sql &= "'" & Replace(qry.AnswerName,"'","''","all") & "',";
	sql &= "#qry.AnswerSort#,";
	sql &= "#qry.Correct#";
	sql &= ")";
	Values=",";
}
sql &= "
SET IDENTITY_INSERT #form.TableName# OFF
SELECT * FROM #form.TableName#

";
include "End.cfm";
// location('XWord.cfm',false)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<a href="XWord.cfm">XWord.cfm</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
