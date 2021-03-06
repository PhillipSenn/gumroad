<cfscript>
include "Begin.cfm";

sqlTable = "if exists (select * from sysobjects where id = object_id(N'#form.TableName#') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE #form.TableName#
GO
CREATE TABLE #form.TableName#
(PersonID Int Identity Constraint PersonID Primary Key NONCLUSTERED
,FirstName Varchar(128) default ''
,LastName Varchar(128) default ''
,DisplayName Varchar(128) default '' -- Professor Senn
,Email Varchar(128)
,RegistrarName Varchar(128) default '' -- Phillip Senn
,isSenior Int default 0
)
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

INSERT INTO #form.TableName#(PersonID,FirstName,LastName,DisplayName,Email,RegistrarName,isSenior) VALUES";
		Values = " ";
	}
	sql &= "
";
	sql &= Values;
	sql &= "(";
	sql &= "#qry.PersonID#,";
	sql &= "'" & Replace(qry.FirstName,"'","''","all") & "',";
	sql &= "'" & Replace(qry.LastName,"'","''","all") & "',";
	sql &= "'" & Replace(qry.DisplayName,"'","''","all") & "',";
	sql &= "'#qry.Email#',";
	sql &= "'" & Replace(qry.RegistrarName,"'","''","all") & "',";
	sql &= "#qry.isSenior#";
	sql &= ")";
	Values=",";
}
sql &= "
SET IDENTITY_INSERT #form.TableName# OFF
SELECT * FROM #form.TableName#

";
include "End.cfm";
// location('Usr.cfm',false)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<a href="Usr.cfm">Usr.cfm</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
