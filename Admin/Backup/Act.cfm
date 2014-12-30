<cfscript>
include "Begin.cfm";

sqlTable = "if exists (select * from sysobjects where id = object_id(N'#form.TableName#') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE #form.TableName#
GO
CREATE TABLE #form.TableName#
(ActID Int Identity(2000,1) Constraint ActID Primary Key NONCLUSTERED
,ActName Varchar(128) default '' -- Name on the menu
,ActDesc varchar(Max) default '' -- Description of the activity.  Justification for why it's an activity.
,ActSort Int Constraint ActSort default 0  -- url.ActSort
,ActLink varchar(max) default '' -- Paper/Paper.cfm
,Questions Int default 9999
,ActOnline Varchar(max) default '' -- More instructions for the online students
,KeepWorkingOnIt Int default 0 -- 1=You can keep working until you make 100%, so the PctComplete is measured by Earned, not by whether you've simply answered the question.
)
GO
CREATE UNIQUE Clustered INDEX ActName ON Act(ActName)
CREATE INDEX ActSort on Act(ActSort)
";
sql = "
GO
SET IDENTITY_INSERT #form.TableName# ON
INSERT INTO #form.TableName#(ActID,ActName,ActDesc,ActSort,ActLink,Questions,ActOnline,KeepWorkingOnIt) VALUES";
Values = " ";
for (qry in response) {
	sql &= "
";
	sql &= Values;
	sql &= "(";
	sql &= "#qry.ActID#,";
	sql &= "'#qry.ActName#',";
	sql &= "'" & Replace(qry.ActDesc,"'","''","all") & "',";
	sql &= "#qry.ActSort#,";
	sql &= "'#qry.ActLink#',";
	sql &= "#qry.Questions#,";
	sql &= "'" & Replace(qry.ActOnline,"'","''","all") & "',";
	sql &= "#qry.KeepWorkingOnIt#";
	sql &= ")";
	Values=",";
}
sql &= "
SET IDENTITY_INSERT #form.TableName# OFF
SELECT * FROM #form.TableName#

";
include "End.cfm";
// location('Att.cfm',false)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<a href="Att.cfm">Att.cfm</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
