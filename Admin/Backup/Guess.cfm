<cfscript>
setting requesttimeout=3000;
form.EmailData=false
include "Begin.cfm"

sqlTable = "if exists (select * from sysobjects where id = object_id(N'#form.TableName#') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE #form.TableName#
GO
CREATE TABLE #form.TableName#
(GuessID Int Identity(9000,1) Constraint GuessID Primary Key NONCLUSTERED
,Guess_PaperID Int
,Guess_AnswerID Int
,GuessName Varchar(Max) default '' -- Student's freeform field
,GuessDateTime Datetime2 default getdate()
,Earned Int default 0
,GradeDateTime DateTime2 null
,GuessComment Varchar(max) default '' -- Instructor's comment about this 1 item
)
GO
CREATE CLUSTERED INDEX PaperAnswer ON Guess(Guess_PaperID,Guess_AnswerID)
GO
ALTER TABLE Guess WITH CHECK
ADD CONSTRAINT Guess_PaperID FOREIGN KEY(Guess_PaperID)
REFERENCES Paper
ALTER TABLE Guess CHECK CONSTRAINT Guess_PaperID

ALTER TABLE Guess WITH CHECK
ADD CONSTRAINT Guess_AnswerID FOREIGN KEY(Guess_AnswerID)
REFERENCES Answer
ALTER TABLE Guess CHECK CONSTRAINT Guess_AnswerID
"

/*
sql = "
GO
SET IDENTITY_INSERT #form.TableName# ON
"
currentRow = 0
for (qry in response) {
	currentRow += 1
	echo(currentRow & ' ')
	if (currentRow MOD 1000 == 1) {
		sql &= "

INSERT INTO #form.TableName#(GuessID,Guess_PaperID,Guess_AnswerID,GuessName,GuessDateTime,Earned,GradeDateTime,GuessComment) VALUES"
		Values = " "
	}
	sql &= "
"
	sql &= Values
	sql &= "("
	sql &= "#qry.GuessID#,"
	sql &= "#qry.Guess_PaperID#,"
	sql &= "#qry.Guess_AnswerID#,"
	sql &= "'" & Replace(qry.GuessName,"'","''","all") & "',"
	sql &= "'" & DateFormat(qry.GuessDateTime,"mm/dd/yyyy ") & TimeFormat(qry.GuessDateTime,"HH:mm:ss") & "',"
	sql &= "#qry.Earned#,"
	sql &= "'" & DateFormat(qry.GradeDateTime,"mm/dd/yyyy ") & TimeFormat(qry.GradeDateTime,"HH:mm") & "',"
	sql &= "'" & Replace(qry.GuessComment,"'","''","all") & "'"
	sql &= ")"
	Values=","
}
sql &= "
SET IDENTITY_INSERT #form.TableName# OFF
SELECT * FROM #form.TableName#

"
*/


sql = "SELECT * FROM #form.TableName#

"

include "End.cfm"
// location('Vote.cfm',false)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<a href="Vote.cfm">Vote.cfm</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
