<cfscript>
setting requesttimeout=300;
form.EmailData=false
include "Begin.cfm"

sqlTable = "if exists (select * from sysobjects where id = object_id(N'#form.TableName#') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE #form.TableName#
GO
CREATE TABLE #form.TableName#
(VoteID Int Identity(10000,1) Constraint VoteID Primary Key NONCLUSTERED
,Vote_UsrID Int -- The person who voted
,Vote_GuessID Int
,VoteDateTime DateTime2 default getdate()
)
GO
CREATE CLUSTERED INDEX UsrID ON Vote(Vote_UsrID,Vote_GuessID)
GO
ALTER TABLE Vote WITH CHECK
ADD CONSTRAINT Vote_GuessID FOREIGN KEY(Vote_GuessID)
REFERENCES Guess
ALTER TABLE Vote CHECK CONSTRAINT Vote_GuessID
"

/*
sql = "
GO
SET IDENTITY_INSERT #form.TableName# ON
"
CurrentRow = 0
for (qry in response) {
	CurrentRow += 1
	if (CurrentRow MOD 1000 == 1) {
		sql &= "

INSERT INTO #form.TableName#(VoteID,Vote_UsrID,Vote_GuessID,VoteDateTime) VALUES"
		Values = " "
	}
	sql &= "
"
	sql &= Values
	sql &= "("
	sql &= "#qry.VoteID#,"
	sql &= "#qry.Vote_UsrID#,"
	sql &= "#qry.Vote_GuessID#,"
	sql &= "'" & DateFormat(qry.VoteDateTime,"mm/dd/yyyy ") & TimeFormat(qry.VoteDateTime,"HH:mm:ss") & "'"
	sql &= ")"
	Values=","
}
sql &= "
SET IDENTITY_INSERT #form.TableName# OFF
SELECT * FROM #form.TableName#

"
*/


sql = "
SELECT * FROM #form.TableName#

"

include "End.cfm"
// location('Views.cfm',false)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<a href="Views.cfm">Finish up</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
