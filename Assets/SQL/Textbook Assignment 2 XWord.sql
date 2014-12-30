-- AnswerSort:1 = Across
-- AnswerSort:2 = Down
set nocount on
set statistics time off
set statistics io off
SET ANSI_NULL_DFLT_OFF ON -- All columns default to NOT NULL

DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Textbook'
)
DECLARE @Chapter Int = 1
DECLARE @Assignment Int = 2
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Crossword'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'Digital Literacy'
,@ActSort
,'XWord/XWordIntro.cfm'
,30)
SELECT @ActID = Scope_Identity()
exec InsertQuestionAnswerO @ActID,'Wireless network that provides Internet connections to mobile devices','HOTSPOT',1,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,2)
exec InsertQuestionAnswerO @ActID,'Personal computer designed to be in a stationary location','DESKTOP',5,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,2,10)
exec InsertQuestionAnswerO @ActID,'Worldwide collection of computer networks','INTERNET',7,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,3,1)
exec InsertQuestionAnswerO @ActID,'Matching the files in two or more locations with each other','SYNCHRONIZE',9,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,4,11)
exec InsertQuestionAnswerO @ActID,'Pointing device that fits under the palm of your hand comfortably','MOUSE',10,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,5,1)
exec InsertQuestionAnswerO @ActID,'Conveys meaning to users','INFORMATION',11,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,6,7)
exec InsertQuestionAnswerO @ActID,'Input device that converts printed text into a form a computer can process','SCANNER',13,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,8,14)
exec InsertQuestionAnswerO @ActID,'An understanding of computers, mobile devices, and the Internet','DIGITALLITERACY',14,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,10,3)
exec InsertQuestionAnswerO @ActID,'Short note sent to or from a smartphone or other mobile device','TEXTMESSAGE',16,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,12,2)
exec InsertQuestionAnswerO @ActID,'Programs on a smartphone','APPS',19,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,13,14)
exec InsertQuestionAnswerO @ActID,'Mobile computer with a screen in its lid and a keyboard in its base','LAPTOP',21,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,15,13)
exec InsertQuestionAnswerO @ActID,'Electronic document on the web','WEBPAGE',23,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,16,1)
exec InsertQuestionAnswerO @ActID,'Stores instructions waiting to be executed and data needed by those instructions','MEMORY',24,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,19,1)
exec InsertQuestionAnswerO @ActID,'Motion made on a touch screen with tip of fingers or hand','GESTURE',25,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,19,15)
exec InsertQuestionAnswerO @ActID,'Computer that delivers requested webpages to your computer or mobile device','WEBSERVER',26,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,21,10)


exec InsertQuestionAnswerO @ActID,'Computer dedicated to providing services to other computers on a network','server',2,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,5)
exec InsertQuestionAnswerO @ActID,'Computing device small enough to hold in your hand','mobiledevice',3,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,19)
exec InsertQuestionAnswerO @ActID,'Named collection of stored data, instructions, or information','file',4,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,21)
exec InsertQuestionAnswerO @ActID,'Can perform input, processing, output, and storage activities by itself','personalcomputer',6,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,2,16)
exec InsertQuestionAnswerO @ActID,'Small, flat, rectangular pointing device that is sensitive to pressure/motion','touchpad',8,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,3,3)
exec InsertQuestionAnswerO @ActID,'Accessing media content while it downloads','streaming',9,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,4,11)
exec InsertQuestionAnswerO @ActID,'Allows you to enter data and instructions into a computer or mobile device','inputdevice',11,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,6,7)
exec InsertQuestionAnswerO @ActID,'Allows you to take photos and store the photographed images digitally','digitalcamera',12,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,8,5)
exec InsertQuestionAnswerO @ActID,'Internet-capable phone','smartphone',15,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,10,21)
exec InsertQuestionAnswerO @ActID,'Thin, lighterweight mobile computer that has a touch screen','tablet',16,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,12,2)
exec InsertQuestionAnswerO @ActID,'Instructions that tell a computer tasks to perform and how to perform them','software',17,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,12,9)
exec InsertQuestionAnswerO @ActID,'Collection of unprocessed items','data',18,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,12,14)
exec InsertQuestionAnswerO @ActID,'The electric, electronic, and mechanical components contained in computers','hardware',20,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,14,11)
exec InsertQuestionAnswerO @ActID,'Built-in connection to other documents, graphics, webpages, or websites','link',21,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,15,13)
exec InsertQuestionAnswerO @ActID,'Output device that produces text and graphics on a physical medium','printer',22,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,15,18)
UPDATE Question SET Points=4 WHERE Question_ActID = @ActID
UPDATE Question SET Points=2 WHERE QuestionID IN(
	SELECT TOP 10 QuestionID
	FROM Question
	WHERE Question_ActID = @ActID
	ORDER BY QuestionID DESC
)



--
-- Attendance
--
DECLARE @Att_ActID Int
DECLARE @AttendanceCatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Attendance'
)
DECLARE @AttendanceActSort Int = @AttendanceCatSort + @Chapter*100 + @Assignment

exec PostAttendance @ActID,@QuestionID,@AttendanceActSort,@ActName,@Att_ActID OUTPUT
--
-- Assignments
--
DECLARE @AssignmentStart smalldatetime = (
	SELECT TermStart
	FROM Term
)
DECLARE @AssignmentStop  smalldatetime
DECLARE @CourseSort Int

SET @AssignmentStop = '11/2/2014 23:59'
exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop
GO


DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Textbook'
)
DECLARE @Chapter Int = 2
DECLARE @Assignment Int = 2
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Crossword'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES('Chapter 2, Crossword','The Internet'
,@ActSort
,'XWord/XWordIntro.cfm'
,29)
SELECT @ActID = Scope_Identity()
exec InsertQuestionAnswerO @ActID,'Consists of a worldwide collection of electronic documents','WorldWideWeb',1,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,2)
exec InsertQuestionAnswerO @ActID,'Equal to approximately one million characters','megabyte',6,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,2,14)
exec InsertQuestionAnswerO @ActID,'Appearance of motion created by displaying a series of still images in sequence','animation',7,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,3,1)
exec InsertQuestionAnswerO @ActID,'Includes music, speech, or any other sound','audio',8,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,4,9)
exec InsertQuestionAnswerO @ActID,'Each electronic document on the web','webpage',9,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,5,1)
exec InsertQuestionAnswerO @ActID,'Allows a customer to collect purchases','shoppingcart',12,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,7,1)
exec InsertQuestionAnswerO @ActID,'Application stored on a web server that you access through a browser','webapp',14,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,10,7)
exec InsertQuestionAnswerO @ActID,'Equal to approximately one billion characters','gigabyte',15,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,10,14)
exec InsertQuestionAnswerO @ActID,'Online area in which users have written discussions about a particular subject','messageboard',16,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,12,5)
exec InsertQuestionAnswerO @ActID,'Computer that delivers requested webpages to your computer or mobile device','webserver',21,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,14,2)
exec InsertQuestionAnswerO @ActID,'Consists of images displayed in motion','video',22,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,15,17)
exec InsertQuestionAnswerO @ActID,'Small version of a larger object that you can click to display a larger image','thumbnail',23,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,16,1)
exec InsertQuestionAnswerO @ActID,'Group of email addresses used for mass distribution of a message','emaillist',24,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,18,1)
exec InsertQuestionAnswerO @ActID,'Connects millions of businesses, educational institutions, and individuals','Internet',26,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,19,10)
exec InsertQuestionAnswerO @ActID,'The first page that is displayed on a website','homepage',27,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,20,1)
exec InsertQuestionAnswerO @ActID,'Collection of related webpages and associated items','website',28,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,21,14)

exec InsertQuestionAnswerO @ActID,'Allows visitors to customize some or all of the viewed content','dynamicwebpage',2,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,9)
exec InsertQuestionAnswerO @ActID,'Transmission of messages and files via a computer network','email',3,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,12)
exec InsertQuestionAnswerO @ActID,'Harassment, often involving teens and preteens, using technology','cyberbullying',4,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,19)
exec InsertQuestionAnswerO @ActID,'Code of acceptable behaviors users should follow while on the Internet','netiquette',5,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,21)
exec InsertQuestionAnswerO @ActID,'Informal website consisting of time-stamped articles in a diary/journal format','blog',10,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,5,3)
exec InsertQuestionAnswerO @ActID,'Website that offers many Internet services from a single, convenient location','portal',11,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,6,17)
exec InsertQuestionAnswerO @ActID,'Website that allows users to create, modify, or delete content via a browser','wiki',13,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,7,15)
exec InsertQuestionAnswerO @ActID,'Visual representation of nontext information, such as a drawing, chart, or photo','graphic',15,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,10,14)
exec InsertQuestionAnswerO @ActID,'Allows users to access and use a file while it is transmitting','streaming',17,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,12,7)
exec InsertQuestionAnswerO @ActID,'Represents the amount of data that travels over a network','bandwidth',18,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,12,12)
exec InsertQuestionAnswerO @ActID,'Transferring files from your computer to a server on the Internet','uploading',19,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,12,21)
exec InsertQuestionAnswerO @ActID,'Links to preferred websites','favorites',20,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,13,17)
exec InsertQuestionAnswerO @ActID,'Real-time typed conversation that takes place with many other online users','chat',25,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,18,19)

UPDATE Question SET Points=4 WHERE Question_ActID = @ActID
UPDATE Question SET Points=2 WHERE QuestionID IN(
	SELECT TOP 8 QuestionID
	FROM Question
	WHERE Question_ActID = @ActID
	ORDER BY QuestionID DESC
)

--
-- Attendance
--
DECLARE @Att_ActID Int
DECLARE @AttendanceCatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Attendance'
)
DECLARE @AttendanceActSort Int = @AttendanceCatSort + @Chapter*100 + @Assignment

exec PostAttendance @ActID,@QuestionID,@AttendanceActSort,@ActName,@Att_ActID OUTPUT
--
-- Assignments
--
DECLARE @AssignmentStart smalldatetime
DECLARE @AssignmentStop  smalldatetime
DECLARE @CourseSort Int

SET @AssignmentStart = '11/3/2014'
SET @AssignmentStop = '11/9/2014 23:59'
exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop
GO



DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Textbook'
)
DECLARE @Chapter Int = 3
DECLARE @Assignment Int = 2
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Crossword'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort

INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES('Chapter 3, Crossword','Computers and Mobile Devices'
,@ActSort
,'XWord/XWordIntro.cfm'
,26)
SELECT @ActID = Scope_Identity()
exec InsertAnswerQuestionO @ActID,'handheldcomputer','Computer small enough to fit in one hand',1,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,1)
exec InsertAnswerQuestionO @ActID,'port','Point at which a peripheral device attaches to a computer',3,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,3,1)
exec InsertAnswerQuestionO @ActID,'gameconsole','Mobile computing device designed for single-player or multiplayer video games',5,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,3,8)
exec InsertAnswerQuestionO @ActID,'towerserver','Server built into an upright cabinet that stands alone',7,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,5,8)
exec InsertAnswerQuestionO @ActID,'resolution','Number of horizontal and vertical pixels in a display device',8,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,7,4)
exec InsertAnswerQuestionO @ActID,'serverfarm','Network of several servers together in a single location',10,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,9,1)
exec InsertAnswerQuestionO @ActID,'convertibletablet','Tablet that has a screen it its lid and a keyboard in its base',13,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,11,4)
exec InsertAnswerQuestionO @ActID,'slatetablet','Type of tablet that does not contain a physical keyboard',16,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,13,6)
exec InsertAnswerQuestionO @ActID,'pixel','Smallest element in an electronic image',18,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,14,16)
exec InsertAnswerQuestionO @ActID,'phablet','Device that combines features of a smartphone with a tablet',19,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,15,7)
exec InsertAnswerQuestionO @ActID,'undervoltage','Occurs when the electrical supply or voltage drops below the normal volts',20,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,17,1)
exec InsertAnswerQuestionO @ActID,'spam','Unsolicited email messages',21,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,17,18)
exec InsertAnswerQuestionO @ActID,'tablet','Thin, lightweight mobile computer that has a touch screen',22,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,20,2)
exec InsertAnswerQuestionO @ActID,'earbuds','Small speakers that rest inside each ear canal',23,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,21,10)

exec InsertAnswerQuestionO @ActID,'digitalcamera','Allows users to take photos and store the photographed images digitally',2,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,8)
exec InsertAnswerQuestionO @ActID,'processor','Component that interprets and carries out instructions that operate a computer',3,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,3,1)
exec InsertAnswerQuestionO @ActID,'tower','Frame that houses the system unit on a desktop',4,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,3,4)
exec InsertAnswerQuestionO @ActID,'server','Computer dedicated to providing services to other computers on a network',6,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,3,15)
exec InsertAnswerQuestionO @ActID,'virtualization','Practice of sharing or pooling computing resources, such as servers',9,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,8,20)
exec InsertAnswerQuestionO @ActID,'motherboard','Main circuit board of the personal computer',11,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,9,10)
exec InsertAnswerQuestionO @ActID,'smartphone','Internet-capable phone',12,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,9,16)
exec InsertAnswerQuestionO @ActID,'computer','Can accept and process data and produce and store information for future use',13,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,11,4)
exec InsertAnswerQuestionO @ActID,'bladeserver','Server in the form of a single circuit board',14,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,11,12)
exec InsertAnswerQuestionO @ActID,'brownout','Prolonged (more than a minute) undervoltage',15,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,13,2)
exec InsertAnswerQuestionO @ActID,'laptop','Lightweight mobile computer with a screen in its lid and a keyboard in its base',17,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,13,7)
exec InsertAnswerQuestionO @ActID,'spike','Momentary overvoltage',21,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,17,18)



UPDATE Question SET Points=4 WHERE Question_ActID = @ActID
UPDATE Question SET Points=2 WHERE QuestionID IN(
	SELECT TOP 2 QuestionID
	FROM Question
	WHERE Question_ActID = @ActID
	ORDER BY QuestionID DESC
)

--
-- Attendance
--
DECLARE @Att_ActID Int
DECLARE @AttendanceCatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Attendance'
)
DECLARE @AttendanceActSort Int = @AttendanceCatSort + @Chapter*100 + @Assignment

exec PostAttendance @ActID,@QuestionID,@AttendanceActSort,@ActName,@Att_ActID OUTPUT
--
-- Assignments
--
DECLARE @AssignmentStart smalldatetime
DECLARE @AssignmentStop  smalldatetime
DECLARE @CourseSort Int

SET @AssignmentStart = '11/10/2014'
SET @AssignmentStop = '11/16/2014 23:59'
exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop
GO


DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Textbook'
)
DECLARE @Chapter Int = 4
DECLARE @Assignment Int = 2
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Crossword'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES('Chapter 4, Crossword','Programs and Apps'
,@ActSort
,'XWord/XWordIntro.cfm'
,25)
SELECT @ActID = Scope_Identity()
exec InsertAnswerQuestionO @ActID,'mobileapp','Application you download from a mobile device’s app store',1,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,1)
exec InsertAnswerQuestionO @ActID,'shareware','Copyrighted software that is distributed at no cost for a trial period',6,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,3,1)
exec InsertAnswerQuestionO @ActID,'restoretool','Returns backed up files to their original form',8,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,3,11)
exec InsertAnswerQuestionO @ActID,'uninstaller','Tool that removes a program',10,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,6,7)
exec InsertAnswerQuestionO @ActID,'webapp','Application stored on a web server that you access through a browser',11,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,7,1)
exec InsertAnswerQuestionO @ActID,'freeware','Software provided at no cost by an individual who retains rights to the software',13,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,9,14)
exec InsertAnswerQuestionO @ActID,'folder','Specific named location on a storage medium that contains related documents',15,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,11,16)
exec InsertAnswerQuestionO @ActID,'licenseagreement','Right to use a program or app',18,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,14,1)
exec InsertAnswerQuestionO @ActID,'mobilewebapp','Web app that is optimized for display in a browser on a mobile device',20,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,16,10)
exec InsertAnswerQuestionO @ActID,'tools','Enable you to perform maintenance-type tasks',21,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,18,8)
exec InsertAnswerQuestionO @ActID,'cookie','Small text file that a web server stores on your computer',23,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,18,14)
exec InsertAnswerQuestionO @ActID,'spywareremover','Program that detects and deletes spyware and similar programs',24,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,20,8)

exec InsertAnswerQuestionO @ActID,'personalfirewall','Security tool that detects and protects a computer from unauthorized intrusions',2,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,8)
exec InsertAnswerQuestionO @ActID,'virussignature','A known specific pattern of virus code',3,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,11)
exec InsertAnswerQuestionO @ActID,'retailsoftware','Mass-produced, copyrighted software that meets the needs of a variety of users',4,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,14)
exec InsertAnswerQuestionO @ActID,'trojanhorse','Destructive program disguised as a real program, such as a screen saver',5,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,20)
exec InsertAnswerQuestionO @ActID,'hacker','Someone who accesses a computer or network illegally',7,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,3,2)
exec InsertAnswerQuestionO @ActID,'quarantine','Area of a hard disk that holds infected files until the infection can be removed',9,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,5,4)
exec InsertAnswerQuestionO @ActID,'paintsoftware','Application that allows drawing of pictures and shapes with on-screen tools',12,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,9,6)
exec InsertAnswerQuestionO @ActID,'application','Program designed to make users more productive and assist with personal tasks',14,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,11,1)
exec InsertAnswerQuestionO @ActID,'font','Name assigned to a specific design of characters',15,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,11,16)
exec InsertAnswerQuestionO @ActID,'database','Collection of data organized to allow access, retrieval, and use of that data',16,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,11,19)
exec InsertAnswerQuestionO @ActID,'clipboard','Temporary storage location',17,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,13,21)
exec InsertAnswerQuestionO @ActID,'clipart','Collection of drawings, photos, and other images',19,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,14,3)
exec InsertAnswerQuestionO @ActID,'spam','Unsolicited email message sent to many recipients at once',22,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,18,12)
UPDATE Question SET Points=4 WHERE Question_ActID = @ActID
--UPDATE Question SET Points=2 WHERE QuestionID IN(
--	SELECT TOP 2 QuestionID
--	FROM Question
--	WHERE Question_ActID = @ActID
--	ORDER BY QuestionID DESC
--)



--
-- Attendance
--
DECLARE @Att_ActID Int
DECLARE @AttendanceCatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Attendance'
)
DECLARE @AttendanceActSort Int = @AttendanceCatSort + @Chapter*100 + @Assignment

exec PostAttendance @ActID,@QuestionID,@AttendanceActSort,@ActName,@Att_ActID OUTPUT
--
-- Assignments
--
DECLARE @AssignmentStart smalldatetime
DECLARE @AssignmentStop  smalldatetime
DECLARE @CourseSort Int

SET @AssignmentStart = '11/17/2014'
SET @AssignmentStop = '11/30/2014 23:59'
exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop
GO


DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Textbook'
)
DECLARE @Chapter Int = 5
DECLARE @Assignment Int = 2
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Crossword'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES('Chapter 5, Crossword','Digital Safety and Security'
,@ActSort
,'XWord/XWordIntro.cfm'
,30)
SELECT @ActID = Scope_Identity()
exec InsertAnswerQuestionO @ActID,'backdoor','Program that allows users to bypass security controls',1,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,2)
exec InsertAnswerQuestionO @ActID,'username','Unique combination of characters that identifies one specific user',3,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,12)
exec InsertAnswerQuestionO @ActID,'hacker','Someone who accesses a computer or network illegally',6,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,3,16)
exec InsertAnswerQuestionO @ActID,'browsinghistory','List of all websites you have visited over a period of time',12,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,6,4)
exec InsertAnswerQuestionO @ActID,'employeemonitoring','Using computers to observe, record, and review an employee’s use of a technology',13,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,9,1)
exec InsertAnswerQuestionO @ActID,'cybercrime','Online or Internet-based illegal acts',16,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,11,3)
exec InsertAnswerQuestionO @ActID,'piracy','Unauthorized and illegal duplication of copyrighted software',18,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,13,3)
exec InsertAnswerQuestionO @ActID,'digitalcertificate','Notice that guarantees a user or a website is legitimate',19,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,15,4)
exec InsertAnswerQuestionO @ActID,'botnet','Compromised computers connected to a network and used to attack other networks',23,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,17,10)
exec InsertAnswerQuestionO @ActID,'macros','Useful to record, save, and execute keystrokes and instructions repeatedly',24,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,18,1)
exec InsertAnswerQuestionO @ActID,'computercrime','Illegal act involving the use of a computer or related devices',25,1,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,20,5)

exec InsertAnswerQuestionO @ActID,'bot','Program that performs a repetitive task on a network',1,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,2)
exec InsertAnswerQuestionO @ActID,'rootkit','Program that hides in a computer and allows someone to take control of it',2,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,9)
exec InsertAnswerQuestionO @ActID,'unauthorizeduse','Use of a computer or its data for unapproved or possibly illegal activities',3,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,12)
exec InsertAnswerQuestionO @ActID,'firewall','Protects a network’s resources from intrusion by users on another network',4,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,1,21)
exec InsertAnswerQuestionO @ActID,'malware','Programs that act without a user’s knowledge and alter computer operations',5,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,3,7)
exec InsertAnswerQuestionO @ActID,'copyright','Gives creators exclusive rights to duplicate, publish, and sell their materials',7,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,3,18)
exec InsertAnswerQuestionO @ActID,'worm','Program that copies itself repeatedly',8,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,4,5)
exec InsertAnswerQuestionO @ActID,'password','Private combination of characters associated with the user name',9,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,4,14)
exec InsertAnswerQuestionO @ActID,'zombie','Compromised computer or device',10,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,5,16)
exec InsertAnswerQuestionO @ActID,'licenseagreement','Right to use software',11,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,6,1)
exec InsertAnswerQuestionO @ActID,'encryption','Converting data that is readable by humans into encoded characters',14,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,9,8)
exec InsertAnswerQuestionO @ActID,'securesite','Website that uses encryption techniques to secure its data',15,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,10,21)
exec InsertAnswerQuestionO @ActID,'audittrail','Records in a file both successful and unsuccessful access attempts',17,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,12,15)
exec InsertAnswerQuestionO @ActID,'cookie','Small text file that a web server stores on your computer',20,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,15,11)
exec InsertAnswerQuestionO @ActID,'adware','Displays an online ads in a banner or pop-up window on webpages',21,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,15,19)
exec InsertAnswerQuestionO @ActID,'backup','Duplicate that can be used if the original is lost, damaged, or destroyed',22,2,@QuestionID OUTPUT
INSERT INTO XWord(XWord_QuestionID,XWordRow,XWordCol) VALUES(@QuestionID,16,3)
UPDATE Question SET Points=4 WHERE Question_ActID = @ActID
UPDATE Question SET Points=2 WHERE QuestionID IN(
	SELECT TOP 4 QuestionID
	FROM Question
	WHERE Question_ActID = @ActID
	ORDER BY QuestionID DESC
)
--
-- Attendance
--
DECLARE @Att_ActID Int
DECLARE @AttendanceCatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Attendance'
)
DECLARE @AttendanceActSort Int = @AttendanceCatSort + @Chapter*100 + @Assignment

exec PostAttendance @ActID,@QuestionID,@AttendanceActSort,@ActName,@Att_ActID OUTPUT
--
-- Assignments
--
DECLARE @AssignmentStart smalldatetime
DECLARE @AssignmentStop  smalldatetime
DECLARE @CourseSort Int

SET @AssignmentStart = '12/1/2014'
SET @AssignmentStop = '12/7/2014 23:59'
exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop
select *
from assignment
where Assignment_ActID=@ActID
