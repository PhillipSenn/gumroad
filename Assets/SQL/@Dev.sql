use LRDev
set nocount on
set statistics time off
set statistics io off
SET ANSI_NULL_DFLT_OFF ON /* All columns default to NOT NULL */
/*
Tables
*/
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
if exists (select * from sysobjects where id = object_id(N'Calendar') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Calendar
GO
if exists (select * from sysobjects where id = object_id(N'LogField') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE LogField
if exists (select * from sysobjects where id = object_id(N'LogTable') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE LogTable
if exists (select * from sysobjects where id = object_id(N'LogVarchar') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE LogVarchar
if exists (select * from sysobjects where id = object_id(N'LogInt') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE LogInt
if exists (select * from sysobjects where id = object_id(N'RemoteAddr') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE RemoteAddr
if exists (select * from sysobjects where id = object_id(N'KeyLog') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE KeyLog
if exists (select * from sysobjects where id = object_id(N'LogBackup') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE LogBackup
GO
/*
Logging
*/
CREATE TABLE RemoteAddr
(RemoteAddrID Int Identity Primary Key NONCLUSTERED
,RemoteAddrName Varchar(128) /* 123.123.123.123, but what about IPv6? */
)
GO
SET IDENTITY_INSERT RemoteAddr ON
INSERT INTO RemoteAddr(RemoteAddrID,RemoteAddrName)
SELECT RemoteAddrID,RemoteAddrName
FROM LR2014Fall2..RemoteAddr
SET IDENTITY_INSERT RemoteAddr OFF
GO
CREATE TABLE LogTable
(LogTableID Int Identity(101,1) Primary Key NONCLUSTERED
,LogTableName Varchar(128)
)
GO
SET IDENTITY_INSERT LogTable ON
INSERT INTO LogTable(LogTableID,LogTableName)
SELECT LogTableID,LogTableName
FROM LR2014Fall2..LogTable
SET IDENTITY_INSERT LogTable OFF
GO
CREATE TABLE LogField
(LogFieldID Int Identity(1001,1) Primary Key NONCLUSTERED
,LogField_TableID Int
,LogFieldName Varchar(128)
)
GO
SET IDENTITY_INSERT LogField ON
INSERT INTO LogField(LogFieldID,LogField_TableID,LogFieldName)
SELECT LogFieldID,LogField_TableID,LogFieldName
FROM LR2014Fall2..LogField
SET IDENTITY_INSERT LogField OFF
GO

CREATE TABLE LogVarchar
(LogVarcharID Int Identity Primary Key NONCLUSTERED
,LogVarcharDateTime DateTime2 default getdate() /* Use datetime2 for new work. It aligns with the SQL Standard and is more portable. */
,LogVarchar_UsrID Int
,LogVarchar_FieldID Int
,LogVarcharPK Int
,LogVarcharName Varchar(max)
,LogVarchar_RemoteAddrID Int
)
GO
SET IDENTITY_INSERT LogVarchar ON
INSERT INTO LogVarchar(LogVarcharID,LogVarcharDateTime,LogVarchar_UsrID,LogVarchar_FieldID,LogVarcharPK,LogVarcharName,LogVarchar_RemoteAddrID)
SELECT LogVarcharID,LogVarcharDateTime,LogVarchar_UsrID,LogVarchar_FieldID,LogVarcharPK,LogVarcharName,LogVarchar_RemoteAddrID
FROM LR2014Fall2..LogVarchar
SET IDENTITY_INSERT LogVarchar OFF
GO
CREATE TABLE LogInt
(LogIntID Int Identity Primary Key NONCLUSTERED
,LogIntDateTime DateTime2 default getdate()
,LogInt_UsrID Int
,LogInt_FieldID Int
,LogIntPK Int
,LogIntSort Int /* Ex: QuestionSort */
,LogInt_RemoteAddrID Int
)
GO
SET IDENTITY_INSERT LogInt ON
INSERT INTO LogInt(LogIntID,LogIntDateTime,LogInt_UsrID,LogInt_FieldID,LogIntPK,LogIntSort,LogInt_RemoteAddrID)
SELECT LogIntID,LogIntDateTime,LogInt_UsrID,LogInt_FieldID,LogIntPK,LogIntSort,LogInt_RemoteAddrID
FROM LR2014Fall2..LogInt
SET IDENTITY_INSERT LogInt OFF
GO
CREATE TABLE KeyLog
(KeyLogID Int Identity Primary Key NONCLUSTERED
,KeyLog_GuessID Int
,KeyLogSort Int /* a=65 */
,KeyLogDateTime DateTime2 default getdate()
)
GO
SET IDENTITY_INSERT KeyLog ON
INSERT INTO KeyLog(KeyLogID,KeyLog_GuessID,KeyLogSort,KeyLogDateTime)
SELECT KeyLogID,KeyLog_GuessID,KeyLogSort,KeyLogDateTime
FROM LR2014Fall2..KeyLog
SET IDENTITY_INSERT KeyLog OFF
GO








/*
Backup
*/
GO
CREATE TABLE LogBackup
(LogBackupID Int Identity Primary Key NONCLUSTERED
,LogBackupDateTime DateTime2 default getdate()
,LogBackup_TableID Int
,LogBackupSort Int -- The last primary key that was used for this table.
)
GO
SET IDENTITY_INSERT LogBackup ON
INSERT INTO LogBackup(LogBackupID,LogBackupDateTime,LogBackup_TableID,LogBackupSort)
SELECT LogBackupID,LogBackupDateTime,LogBackup_LogTableID,LogBackupSort
FROM LR2014Fall2..LogBackup
SET IDENTITY_INSERT LogBackup OFF
GO

/*
Lenoir-Rhyne University
*/
CREATE TABLE Calendar(
CalendarID Int Identity Primary Key
,CalendarDate Date
)
GO
SET IDENTITY_INSERT Calendar ON
INSERT INTO Calendar(CalendarID,CalendarDate)
SELECT CalendarID,CalendarDate
FROM LR2014Fall2..Calendar
SET IDENTITY_INSERT Calendar OFF
GO
create table Grade
(GradeID Int Identity Constraint GradeID PRIMARY KEY
,GradeName Varchar(2)
,GradeSort Int
)
GO
SET IDENTITY_INSERT Grade ON
INSERT INTO Grade(GradeID,GradeName,GradeSort)
SELECT GradeID,GradeName,GradeSort
FROM LR2014Fall2..Grade
SET IDENTITY_INSERT Grade OFF
GO
/*
Term
*/
CREATE TABLE Term
(TermID Int Identity(2,1) Constraint TermID Primary Key NONCLUSTERED
,TermName Varchar(128)
,TermStart smalldatetime
,LastDayOfClasses smalldatetime
,FinalStart smalldatetime
,FinalStop smalldatetime
,GradesDueGrad smalldatetime
,FinalGradesDue smalldatetime
)
GO
SET IDENTITY_INSERT Term ON
INSERT INTO Term(TermID,TermName,TermStart,LastDayOfClasses,FinalStart,FinalStop,GradesDueGrad,FinalGradesDue)
SELECT TermID,TermName,TermStart,LastDayOfClasses,FinalStart,FinalStop,GradesDueGrad,FinalGradesDue
FROM LR2014Fall2..Term
SET IDENTITY_INSERT Term OFF
GO
/*
Course
*/
CREATE TABLE Course
(CourseID Int Identity Constraint CourseID Primary Key NONCLUSTERED
,Course_TermID Int
,CourseName Varchar(128) default ''
,CourseDesc Varchar(128)
,CourseSort Int default 0
,[Online] Int default 0
)
GO
ALTER TABLE Course WITH CHECK
ADD CONSTRAINT Course_TermID FOREIGN KEY(Course_TermID)
REFERENCES Term
ALTER TABLE Course CHECK CONSTRAINT Course_TermID
GO
SET IDENTITY_INSERT Course ON
INSERT INTO Course(CourseID,Course_TermID,CourseName,CourseDesc,CourseSort,Online) 
SELECT CourseID,Course_TermID,CourseName,CourseDesc,CourseSort,Online
FROM LR2014Fall2..Course
SET IDENTITY_INSERT Course OFF
GO
/*
CSC 115. PERSPECTIVES ON TECHNOLOGY.
This course covers the relationships between the individual, society, and technologies.
It will include such topics as the legal, moral, and ethical ramifications of technology use- including security, privacy, health concerns, web use, and intellectual property.
Students will develop simple 3-D programs and write a paper on a selected topic from the course and present it to the class.
One credit. (Fall, Spring, Summer)


Category
*/
CREATE TABLE Cat
(CatID Int Identity Constraint CatID Primary Key NONCLUSTERED
,CatName Varchar(128)
,CatSort Int default 0
)
GO
SET IDENTITY_INSERT Cat ON
INSERT INTO Cat(CatID,CatName,CatSort) 
SELECT CatID,CatName,CatSort
FROM LR2014Fall2..Cat
SET IDENTITY_INSERT Cat OFF
GO
/*
Grading Scale
*/
CREATE TABLE Scale
(ScaleID Int Identity Constraint ScaleID Primary Key NONCLUSTERED
,Scale_CourseID Int
,Scale_CatID Int
,ScaleSort Int default 0 /* Weight */
)
GO
CREATE CLUSTERED INDEX CourseID ON Scale(Scale_CourseID)
GO
ALTER TABLE Scale WITH CHECK
ADD CONSTRAINT Scale_CourseID FOREIGN KEY(Scale_CourseID)
REFERENCES Course
ALTER TABLE Scale CHECK CONSTRAINT Scale_CourseID
GO
SET IDENTITY_INSERT Scale ON
INSERT INTO Scale(ScaleID,Scale_CourseID,Scale_CatID,ScaleSort)
SELECT ScaleID,Scale_CourseID,Scale_CatID,ScaleSort
FROM LR2014Fall2..Scale
SET IDENTITY_INSERT Scale OFF
GO
/*
Activity
*/
CREATE TABLE Act
(ActID Int Identity Constraint ActID Primary Key NONCLUSTERED
,ActName Varchar(128) default '' /* Name on the menu */
,ActDesc Varchar(Max) default '' /* Description of the activity.  Justification for why it's an activity. */
,ActSort Int Constraint ActSort default 0  /* url.ActSort */
,ActLink Varchar(max) default '' /* Paper/Paper.cfm */
,Questions Int default 9999
,ActOnline Varchar(max) default '' /* More instructions for the online students */
,KeepWorkingOnIt Int default 0 /* 1=You can keep working until you make 100%, so the PctComplete is measured by Earned, not by whether you've simply answered the question. */
)
GO
CREATE UNIQUE Clustered INDEX ActName ON Act(ActName)
CREATE INDEX ActSort on Act(ActSort)
GO
SET IDENTITY_INSERT Act ON
INSERT INTO Act(ActID,ActName,ActDesc,ActSort,ActLink,Questions,ActOnline,KeepWorkingOnIt) 
SELECT ActID,ActName,ActDesc,ActSort,ActLink,Questions,ActOnline,KeepWorkingOnIt
FROM LR2014Fall2..Act
SET IDENTITY_INSERT Act OFF
GO
/* Attendance */
CREATE TABLE Att
(AttID Int Identity Constraint AttID Primary Key NONCLUSTERED
,For_ActID Int /* The ActID that this attendance activity is for. */
,Att_ActID Int /* The Attendance Activity itself */
)
GO
CREATE UNIQUE Clustered INDEX ForAct ON Att(For_ActID)
GO
SET IDENTITY_INSERT Att ON
INSERT INTO Att(AttID,For_ActID,Att_ActID)
SELECT AttID,For_ActID,Att_ActID
FROM LR2014Fall2..Att
SET IDENTITY_INSERT Att OFF
GO
/*
Question
*/
CREATE TABLE Question
(QuestionID Int Identity Constraint QuestionID Primary Key NONCLUSTERED
,Question_ActID Int
,QuestionName nVarchar(1600) default '' /* The question itself */
,QuestionDesc Varchar(Max) default '' /* I don't really get the purpose of this question. */
,QuestionSort Int default 0 /* ORDER BY QuestionSort,NewID() */
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
GO
SET IDENTITY_INSERT Question ON
INSERT INTO Question(QuestionID,Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points,Ref,Obj)
SELECT QuestionID,Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points,Ref,Obj
FROM LR2014Fall2..Question
SET IDENTITY_INSERT Question OFF
GO
/*
Answer
*/
CREATE TABLE Answer
(AnswerID Int Identity Constraint AnswerID Primary Key NONCLUSTERED
,Answer_QuestionID Int
,AnswerName nVarchar(max) default '' /* The answer */
/* ,AnswerDesc Varchar(max) default '' Programming css default answer */
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
GO
SET IDENTITY_INSERT Answer ON
INSERT INTO Answer(AnswerID,Answer_QuestionID,AnswerName,AnswerSort,Correct)
SELECT AnswerID,Answer_QuestionID,AnswerName,AnswerSort,Correct
FROM LR2014Fall2..Answer
SET IDENTITY_INSERT Answer OFF
GO
/*
XWord
*/
CREATE TABLE XWord
(XWordID Int Identity Constraint XWordID Primary Key NONCLUSTERED
,XWord_QuestionID Int
,XWordRow Int
,XWordCol Int
)
GO
CREATE CLUSTERED INDEX QuestionID ON XWord(XWord_QuestionID,XWordRow)
GO
ALTER TABLE XWord WITH CHECK
ADD CONSTRAINT XWord_QuestionID FOREIGN KEY(XWord_QuestionID)
REFERENCES Question
ALTER TABLE XWord CHECK CONSTRAINT XWord_QuestionID
GO
SET IDENTITY_INSERT XWord ON
INSERT INTO XWord(XWordID,XWord_QuestionID,XWordRow,XWordCol)
SELECT XWordID,XWord_QuestionID,XWordRow,XWordCol
FROM LR2014Fall2..XWord
SET IDENTITY_INSERT XWord OFF
GO
/*
Person
*/
CREATE TABLE Person
(PersonID Int Identity Constraint PersonID Primary Key NONCLUSTERED
,FirstName Varchar(128) default ''
,LastName Varchar(128) default ''
,PersonName Varchar(128) default ''
,Email Varchar(128)
,isSenior Int default 0
)
GO
create unique clustered index Email ON Person(Email)
GO
SET IDENTITY_INSERT Person ON
INSERT INTO Person(PersonID,FirstName,LastName,Email,PersonName,isSenior)
SELECT PersonID,FirstName,LastName,Email,PersonName,isSenior
FROM LR2014Fall2..Person
SET IDENTITY_INSERT Person OFF
GO
/*
Usr
*/
CREATE TABLE Usr
(UsrID Int Identity Constraint UsrID Primary Key NONCLUSTERED
,Usr_CourseID Int
,Usr_PersonID Int
,UsrName Varchar(128) default ''
,GloballyUniqueIdentifier Varchar(36) default newid()
,isAdmin Int default 0
,RemindMe Int default 2 -- Every 2 days
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
GO
SET IDENTITY_INSERT Usr ON
INSERT INTO Usr(UsrID,Usr_CourseID,Usr_PersonID,GloballyUniqueIdentifier,isAdmin,UsrName)
SELECT UsrID,Usr_CourseID,Usr_PersonID,GloballyUniqueIdentifier,isAdmin,UsrName
FROM LR2014Fall2..Usr
SET IDENTITY_INSERT Usr OFF
GO
/*
Assignment
*/
CREATE TABLE Assignment
(AssignmentID Int Identity Constraint AssignmentID Primary Key NONCLUSTERED
,Assignment_ActID Int
,Assignment_ScaleID Int
,AssignmentStart smalldatetime default getdate()
,AssignmentStop smalldatetime default getdate()
)
GO
CREATE UNIQUE CLUSTERED INDEX ActID ON Assignment(Assignment_ActID,Assignment_ScaleID)
CREATE INDEX ScaleID ON Assignment(Assignment_ScaleID)
GO
ALTER TABLE Assignment WITH CHECK
ADD CONSTRAINT Assignment_ScaleID FOREIGN KEY(Assignment_ScaleID)
REFERENCES Scale
ALTER TABLE Assignment CHECK CONSTRAINT Assignment_ScaleID

ALTER TABLE Assignment WITH CHECK
ADD CONSTRAINT Assignment_ActID FOREIGN KEY(Assignment_ActID)
REFERENCES Act
ALTER TABLE Assignment CHECK CONSTRAINT Assignment_ActID
GO
SET IDENTITY_INSERT Assignment ON
INSERT INTO Assignment(AssignmentID,Assignment_ActID,Assignment_ScaleID,AssignmentStart,AssignmentStop)
SELECT AssignmentID,Assignment_ActID,Assignment_ScaleID,AssignmentStart,AssignmentStop
FROM LR2014Fall2..Assignment
SET IDENTITY_INSERT Assignment OFF
GO
/*
Paper
The student turns in a paper
*/
CREATE TABLE Paper
(PaperID Int Identity Constraint PaperID Primary Key NONCLUSTERED
,Paper_UsrID Int /* 7/22/2014 The user always comes first */
,Paper_AssignmentID Int 
,PaperName Varchar(max) default '' /* A quote of what they said, or their caption for the picture assignment. */
,PaperDesc Varchar(max) default '' /* Instructor's comment about the paper as a whole, or their description for the picture assignment. */
,Attachment Varchar(max) default '' /* GUID.docx */
,StudentFileName Varchar(max) default '' /* My %#!.docx */
,isComplete Int default 0
/* ,Grading Int default 0 1=I am in the process of grading this paper */
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
GO
SET IDENTITY_INSERT Paper ON
INSERT INTO Paper(PaperID,Paper_UsrID,Paper_AssignmentID,PaperName,PaperDesc,Attachment,StudentFileName)
SELECT PaperID,Paper_UsrID,Paper_AssignmentID,PaperName,PaperDesc,Attachment,StudentFileName
FROM LR2014Fall2..Paper
SET IDENTITY_INSERT Paper OFF
GO
/*
Guess
*/
CREATE TABLE Guess
(GuessID Int Identity(2000,1) Constraint GuessID Primary Key NONCLUSTERED
,Guess_PaperID Int
,Guess_AnswerID Int
,GuessName Varchar(Max) default '' /* Student's freeform field */
,GuessDateTime DateTime2 null /* 7/25/2014 removed default getdate() */
,Earned Int default 0
,GradeDateTime smalldatetime default getdate() null /* I'm going to assume it's graded unless there's a special circumstance. */
,GuessComment Varchar(max) default '' /* Instructor's comment about this 1 item */
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
GO
SET IDENTITY_INSERT Guess ON
INSERT INTO Guess(GuessID,Guess_PaperID,Guess_AnswerID,GuessName,GuessDateTime,Earned,GradeDateTime,GuessComment)
SELECT GuessID,Guess_PaperID,Guess_AnswerID,GuessName,GuessDateTime,Earned,GradeDateTime,GuessComment
FROM LR2014Fall2..Guess
SET IDENTITY_INSERT Guess OFF
GO
/*
Vote
*/
CREATE TABLE Vote
(VoteID Int Identity(1000,1) Constraint VoteID Primary Key NONCLUSTERED
,Vote_UsrID Int /* The person who voted */
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
GO
SET IDENTITY_INSERT Vote ON
INSERT INTO Vote(VoteID,Vote_UsrID,Vote_GuessID,VoteDateTime)
SELECT VoteID,Vote_UsrID,Vote_GuessID,VoteDateTime
FROM LR2014Fall2..Vote
SET IDENTITY_INSERT Vote OFF
GO

/*
Views
*/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'GradeView'))
DROP View GradeView
go
CREATE VIEW GradeView AS
SELECT *
FROM Grade
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'TermView'))
DROP View TermView
go
CREATE VIEW TermView AS
SELECT *
FROM Term
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'CourseView'))
DROP View CourseView
go
CREATE VIEW CourseView AS
SELECT *
FROM Course
join TermView
ON Course_TermID = TermID
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'CatView'))
DROP View CatView
GO
CREATE VIEW CatView AS
SELECT *
FROM Cat
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'ScaleView'))
DROP View ScaleView
GO
CREATE VIEW ScaleView AS
SELECT *
FROM Scale
JOIN CatView
ON Scale_CatID = CatID
join CourseView
ON Scale_CourseID = CourseID
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'ActView'))
DROP View ActView
go
CREATE VIEW ActView AS
SELECT *
FROM Act
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'AttView'))
DROP View AttView
go
CREATE VIEW AttView AS
SELECT Att.*
,Act.*
,Fore.ActName AS For_ActName
,Fore.ActSort AS For_ActSort
FROM Att
JOIN Act
ON Att_ActID = ActID
JOIN Act Fore
ON For_ActID = Fore.ActID
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'QuestionView'))
DROP View QuestionView
GO
CREATE View QuestionView AS
SELECT *
FROM Question
join ActView
ON Question_ActID=ActID
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'AnswerView'))
DROP View AnswerView
GO
CREATE View AnswerView AS
SELECT *
FROM Answer
join QuestionView
ON Answer_QuestionID=QuestionID
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'XWordView'))
DROP View XWordView
GO
CREATE View XWordView AS
SELECT *
FROM XWord
join QuestionView
ON XWord_QuestionID=QuestionID
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'PersonView'))
DROP View PersonView
go
CREATE VIEW PersonView AS
SELECT *
FROM Person
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'UsrView'))
DROP View UsrView
go
CREATE VIEW UsrView AS
SELECT *
FROM Usr
join PersonView
ON Usr_PersonID = PersonID
join CourseView
ON Usr_CourseID = CourseID
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'AssignmentView'))
DROP View AssignmentView
GO
CREATE VIEW AssignmentView AS
SELECT *
FROM Assignment
join ScaleView
ON Assignment_ScaleID = ScaleID
join ActView
ON Assignment_ActID = ActID
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'PaperView'))
DROP View PaperView
GO
CREATE VIEW PaperView AS
SELECT *
FROM Paper
join UsrView
ON Paper_UsrID = UsrID
join Assignment
ON Paper_AssignmentID = AssignmentID
join Scale
ON Assignment_ScaleID = ScaleID
JOIN Cat
ON Scale_CatID = CatID
join ActView
ON Assignment_ActID = ActID
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'GuessView'))
DROP View GuessView
GO
CREATE VIEW GuessView AS
SELECT *
FROM Guess
join PaperView
ON Guess_PaperID=PaperID
join Answer
ON Guess_AnswerID = AnswerID
join Question
ON Answer_QuestionID = QuestionID
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'VoteView'))
DROP View VoteView
GO
CREATE VIEW VoteView AS
SELECT Vote.*
,GuessView.*
,Vote_Person.FirstName AS Vote_FirstName
FROM Vote
JOIN GuessView
ON Vote_GuessID = GuessID
JOIN Usr Vote_Usr
ON Vote_UsrID = Vote_Usr.UsrID
JOIN Person Vote_Person
ON Vote_Usr.Usr_PersonID = Vote_Person.PersonID
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'LogTableView'))
DROP View LogTableView
GO
CREATE VIEW LogTableView AS
SELECT *
FROM LogTable
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'LogFieldView'))
DROP View LogFieldView
GO
CREATE VIEW LogFieldView AS
SELECT *
FROM LogField
JOIN LogTable
ON LogField_TableID = LogTableID
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'LogVarcharView'))
DROP View LogVarcharView
GO
CREATE VIEW LogVarcharView AS
SELECT *
FROM LogVarchar
JOIN LogFieldView
ON LogVarchar_FieldID = LogFieldID
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'LogIntView'))
DROP View LogIntView
GO
CREATE VIEW LogIntView AS
SELECT *
FROM LogInt
JOIN LogFieldView
ON LogInt_FieldID = LogFieldID
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'KeyLogView'))
DROP View KeyLogView
GO
CREATE VIEW KeyLogView AS
SELECT *
FROM KeyLog
JOIN GuessView
ON KeyLog_GuessID = GuessID
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'CalendarView'))
DROP View CalendarView
go
CREATE VIEW CalendarView AS
SELECT *
FROM Calendar
GO
DECLARE @CalendarDate Date
DECLARE @FinalGradesDue Date
SELECT @CalendarDate = TermStart
,@FinalGradesDue = FinalGradesDue
FROM Term
--while @CalendarDate <= @FinalGradesDue begin
--	INSERT INTO Calendar(CalendarDate) VALUES(@CalendarDate)
--	SET @CalendarDate = Dateadd(day,1,@CalendarDate)
--END
/*
Procs
*/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'InsertQuestionAnswerO') AND type in (N'P', N'PC'))
DROP PROC InsertQuestionAnswerO
GO
CREATE PROC InsertQuestionAnswerO
(@ActID Int
,@QuestionName nVarchar(1600)
,@AnswerName nVarchar(1024)
,@QuestionSort Int=1
,@AnswerSort Int=0
,@QuestionID Int OUTPUT
) AS
SET NOCOUNT ON
IF NOT EXISTS(SELECT QuestionID FROM Question WHERE QuestionName=@QuestionName AND Question_ActID=@ActID) BEGIN
	INSERT INTO Question(Question_ActID,QuestionName,QuestionSort) VALUES(@ActID,@QuestionName,@QuestionSort)
END
SELECT @QuestionID=QuestionID
FROM Question
WHERE QuestionName=@QuestionName
AND Question_ActID=@ActID
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct,AnswerSort) VALUES(@QuestionID,@AnswerName,1,@AnswerSort)
RETURN
GO
/*
Calls InsertQuestionAnswerO and ignores the output variable
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'InsertQuestionAnswer') AND type in (N'P', N'PC'))
DROP PROC InsertQuestionAnswer
GO
CREATE PROC InsertQuestionAnswer
(@ActID Int
,@QuestionName nVarchar(1600)
,@AnswerName nVarchar(1024)=''
,@QuestionSort Int=1
,@AnswerSort Int=0
) AS
SET NOCOUNT ON
DECLARE @QuestionID Int
exec InsertQuestionAnswerO @ActID,@QuestionName,@AnswerName,@QuestionSort,@AnswerSort,@QuestionID Output
RETURN
GO

/* Used by XWord */
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'InsertAnswerQuestionO') AND type in (N'P', N'PC'))
DROP PROC InsertAnswerQuestionO
GO
CREATE PROC InsertAnswerQuestionO
(@ActID Int
,@AnswerName nVarchar(1024)
,@QuestionName nVarchar(1600)
,@QuestionSort Int=1
,@AnswerSort Int=0
,@QuestionID Int OUTPUT
) AS
SET NOCOUNT ON
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort) VALUES(@ActID,@QuestionName,@QuestionSort)
SELECT @QuestionID=QuestionID
FROM Question
WHERE QuestionName=@QuestionName
AND Question_ActID=@ActID
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct,AnswerSort) VALUES(@QuestionID,@AnswerName,1,@AnswerSort)
RETURN
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'ClearAct') AND type in (N'P', N'PC'))
DROP PROC ClearAct
GO
CREATE PROC ClearAct
(@ActSort Int
) AS
SET NOCOUNT ON
DELETE FROM Vote
WHERE VoteID IN(
	SELECT VoteID
	FROM VoteView
	WHERE ActSort=@ActSort
)

DELETE FROM Guess
WHERE GuessID IN(
	SELECT GuessID
	FROM GuessView
	WHERE ActSort=@ActSort
)
DELETE FROM XWord
WHERE XWordID IN(
	SELECT XWordID
	FROM XWordView
	WHERE ActSort=@ActSort
)

DELETE FROM Paper
WHERE PaperID IN(
	SELECT PaperID
	FROM PaperView
	WHERE ActSort=@ActSort
)

DELETE FROM Assignment
WHERE AssignmentID IN(
	SELECT AssignmentID
	FROM AssignmentView
	WHERE ActSort=@ActSort
)

DELETE FROM Answer
WHERE AnswerID IN(
	SELECT AnswerID
	FROM AnswerView
	WHERE ActSort=@ActSort
);
DELETE FROM Question
WHERE QuestionID IN(
	SELECT QuestionID
	FROM QuestionView
	WHERE ActSort=@ActSort
)
DELETE from Att
WHERE For_ActID = (
	SELECT ActID
	FROM Act
	WHERE ActSort = @ActSort
);

DELETE FROM Act
WHERE ActSort=@ActSort
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'AddAssignment') AND type in (N'P', N'PC'))
DROP PROC AddAssignment
GO
CREATE PROC AddAssignment
(@ActID Int
,@CatSort Int
,@AssignmentStart smalldatetime
,@AssignmentStop smalldatetime
,@CourseSort Int) AS
SET NOCOUNT ON
DECLARE @ScaleID Int = (
	SELECT ScaleID 
	FROM Scale
	JOIN Cat
	ON Scale_CatID = CatID
	JOIN Course
	ON Scale_CourseID = CourseID 
	WHERE CatSort = @CatSort
	AND CourseSort = @CourseSort
)
INSERT INTO Assignment(Assignment_ScaleID,Assignment_ActID,AssignmentStart,AssignmentStop) VALUES(@ScaleID,@ActID,@AssignmentStart,@AssignmentStop)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'AddAssignments') AND type in (N'P', N'PC'))
DROP PROC AddAssignments
GO
CREATE PROC AddAssignments
(@ActID Int
,@CatSort Int
,@AssignmentStart smalldatetime
,@AssignmentStop smalldatetime
) AS
SET NOCOUNT ON
DECLARE @AssignmentStart31 smalldatetime = dateadd(day,1,@AssignmentStart)
DECLARE @AssignmentStop31 smalldatetime = dateadd(day,1,@AssignmentStop)
exec AddAssignment @ActID,@CatSort,@AssignmentStart,@AssignmentStop,35
exec AddAssignment @ActID,@CatSort,@AssignmentStart,@AssignmentStop,71
exec AddAssignment @ActID,@CatSort,@AssignmentStart,@AssignmentStop,72
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'LevelUp') AND type in (N'P', N'PC'))
DROP PROC LevelUp
GO
Create proc LevelUp
(@ActID Int
,@QuestionID Int
) AS
SET NOCOUNT ON
UPDATE Question SET Points=100/(
	SELECT COUNT(*)
	FROM Question
	WHERE Question_ActID=@ActID
)
WHERE Question_ActID=@ActID
UPDATE Question SET POINTS=100-(
	SELECT SUM(Points)
	FROM Question
	WHERE Question_ActID=@ActID
	AND QuestionID <> @QuestionID
)
WHERE QuestionID = @QuestionID
RETURN 0
GO



IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'PostGuess') AND type in (N'P', N'PC'))
DROP Proc PostGuess
GO
CREATE Proc PostGuess
(@GuessName Varchar(max)
,@GuessComment Varchar(max)
,@ActID Int
,@QuestionSort Int
,@CourseSort Int
) AS
SET NOCOUNT ON
DECLARE @AssignmentID Int
DECLARE @UsrID Int
DECLARE @PaperID Int
DECLARE @AnswerID Int

SELECT @AssignmentID = AssignmentID FROM AssignmentView
WHERE ActID = @ActID AND CourseSort=@CourseSort
SELECT @UsrID = UsrID FROM UsrView WHERE PersonName='Phillip Senn' AND CourseSort=@CourseSort
IF NOT EXISTS(SELECT * FROM PaperView WHERE UsrID=@UsrID AND AssignmentID=@AssignmentID) BEGIN
	INSERT INTO Paper(Paper_UsrID,Paper_AssignmentID) VALUES(@UsrID,@AssignmentID)
END
SELECT @PaperID = PaperID FROM PaperView WHERE UsrID=@UsrID AND AssignmentID=@AssignmentID
SELECT @AnswerID = AnswerID FROM AnswerView
WHERE ActID=@ActID AND QuestionSort=@QuestionSort
INSERT INTO Guess(Guess_PaperID,Guess_AnswerID,GuessName,GuessComment,GuessDateTime,Earned) VALUES
(@PaperID,@AnswerID,@GuessName,@GuessComment,getdate()
,(
	SELECT Points
	FROM QuestionView
	WHERE ActID=@ActID
	AND QuestionSort=@QuestionSort
)
)
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'PostGuesses') AND type in (N'P', N'PC'))
DROP Proc PostGuesses
GO
CREATE Proc PostGuesses
(@GuessName Varchar(max)
,@GuessComment Varchar(max)
,@ActID Int
,@QuestionSort Int
) AS
SET NOCOUNT ON
exec PostGuess @GuessName,@GuessComment,@ActID,@QuestionSort,35
exec PostGuess @GuessName,@GuessComment,@ActID,@QuestionSort,71
exec PostGuess @GuessName,@GuessComment,@ActID,@QuestionSort,72
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'PostAttendance') AND type in (N'P', N'PC'))
DROP Proc PostAttendance
GO
CREATE PROC PostAttendance
(@ActID Int
,@QuestionID Int
,@AttendanceActSort Int
,@ActName Varchar(max)
,@Att_ActID Int OUTPUT
) AS
SET NOCOUNT ON
DECLARE @QuestionName Varchar(128) /* We're going to cursor through every QuestionName */

exec ClearAct @AttendanceActSort
INSERT INTO Act(ActName,ActSort,ActLink,Questions) VALUES(
	 'Attendance for ' + @ActName
	,@AttendanceActSort
	,'Attendance.cfm'
	,(
		SELECT Questions
		FROM Act 
		WHERE ActID = @ActID
	)
)
SELECT @Att_ActID = Scope_Identity()



INSERT INTO Att(For_ActID,Att_ActID) VALUES(@ActID,@Att_ActID)
DECLARE curseAttendance Cursor FOR
SELECT QuestionID,QuestionName
FROM QuestionView
WHERE ActID = @ActID
ORDER BY QuestionID
OPEN curseAttendance
FETCH NEXT FROM curseAttendance
INTO @QuestionID,@QuestionName
WHILE @@Fetch_Status = 0 BEGIN
	INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Points) VALUES(
		 @Att_ActID
		,'Attendance: ' + @QuestionName
		,@QuestionID /* The QuestionSort is actually the QuestionID from the original question. */
		,(
			SELECT Points
			FROM Question
			WHERE QuestionID=@QuestionID
		)
	)
	INSERT INTO Answer(Answer_QuestionID) VALUES(Scope_Identity())
	FETCH NEXT FROM curseAttendance
	INTO @QuestionID,@QuestionName
END
CLOSE curseAttendance
DEALLOCATE curseAttendance
GO
IF EXISTS(SELECT * FROM sys.synonyms WHERE name = 'Q')
DROP SYNONYM Q
GO
CREATE SYNONYM Q FOR QuestionView
GO
IF EXISTS(SELECT * FROM sys.synonyms WHERE name = 'A')
DROP SYNONYM A
GO
CREATE SYNONYM A FOR AnswerView
GO
IF EXISTS(SELECT * FROM sys.synonyms WHERE name = 'X')
DROP SYNONYM X
GO
CREATE SYNONYM X FOR XWordView
GO
IF EXISTS(SELECT * FROM sys.synonyms WHERE name = 'P')
DROP SYNONYM P
GO
CREATE SYNONYM P FOR PersonView
GO
IF EXISTS(SELECT * FROM sys.synonyms WHERE name = 'U')
DROP SYNONYM U
GO
CREATE SYNONYM U FOR UsrView
GO
IF EXISTS(SELECT * FROM sys.synonyms WHERE name = 'G')
DROP SYNONYM G
GO
CREATE SYNONYM G FOR GuessView
GO
IF EXISTS(SELECT * FROM sys.synonyms WHERE name = 'V')
DROP SYNONYM V
GO
CREATE SYNONYM V FOR VoteView
GO
select *
from information_schema.tables
WHERE TABLE_TYPE='BASE TABLE'


