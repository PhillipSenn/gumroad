<cfscript>
myPath = ExpandPath('.');
myFile = myPath & '\LRDev.sql';
sql = "
USE LRDev
set nocount on
set statistics time off
set statistics io off
SET ANSI_NULL_DFLT_OFF ON -- All columns default to NOT NULL
if exists (select * from sysobjects where id = object_id(N'Vote') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Vote
if exists (select * from sysobjects where id = object_id(N'Guess') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Guess
if exists (select * from sysobjects where id = object_id(N'Paper') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Paper
if exists (select * from sysobjects where id = object_id(N'Assignment') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Assignment
if exists (select * from sysobjects where id = object_id(N'Usr') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Usr
if exists (select * from sysobjects where id = object_id(N'Person') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Person
if exists (select * from sysobjects where id = object_id(N'Answer') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Answer
if exists (select * from sysobjects where id = object_id(N'XWord') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE XWord
if exists (select * from sysobjects where id = object_id(N'Question') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Question
if exists (select * from sysobjects where id = object_id(N'Att') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Att
if exists (select * from sysobjects where id = object_id(N'Act') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Act
if exists (select * from sysobjects where id = object_id(N'Scale') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Scale
if exists (select * from sysobjects where id = object_id(N'Cat') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Cat
if exists (select * from sysobjects where id = object_id(N'Course') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Course
if exists (select * from sysobjects where id = object_id(N'Term') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Term
if exists (select * from sysobjects where id = object_id(N'Grade') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Grade
";
FileWrite(myFile,sql); 
// location('Grade.cfm',false);
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<a href="Grade.cfm">Grade.cfm</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
