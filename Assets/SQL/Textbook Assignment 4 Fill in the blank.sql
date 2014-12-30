set nocount on
set statistics time off
set statistics io off

DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Textbook'
)
DECLARE @Chapter Int = 1
DECLARE @Assignment Int = 4
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Fill in the blank'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'Digital Literacy'
,@ActSort
,'FIB/FIBIntro.cfm'
,10)
SELECT @ActID = Scope_Identity()
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Because technology changes, you must keep up with the changes to remain digitally ____________________.',1,2,1);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'literate',1)
--INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'
--<figure>
--	<img src="Ch01/2.gif">
--	<figcaption>A computer like the one in the accompanying figure weighs up to ____________________ pounds (depending on the configuration).</figcaption>
--</figure>',2,4,1);
--SELECT @QuestionID = Scope_Identity()
----INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'10',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'ten',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a motion you make on a touch screen with the tip of one or more fingers or your hand.',3,5,2);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'gesture',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ device is a computing device small enough to hold in your hand.',4,7,2);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'mobile',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is an Internet-capable phone that usually also includes a calendar, an appointment book, an address book, a calculator, a notepad, games, and several other apps (programs).',5,7,2);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'smartphone',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a mobile computing device designed for single-player or multiplayer video games.',6,9,2);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'game console',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is an input device that converts printed material into a form the computer can process.',7,13,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'scanner',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Printed content sometimes is referred to as a(n) ____________________.',8,14,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'hard copy',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'printout',2)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'
<figure>
	<img src="Ch01/9.gif">
	<figcaption>Storage devices like the ____________________ in the accompanying figure hold data, instructions, and information for future use.</figcaption>
</figure>',9,15,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'hard disk drive',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'hard disk',2)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a portable storage device that is small and lightweight enough to be transported on a keychain or in a pocket.',10,16,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'USB flash drive',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a named collection of stored data, instructions, or information and can contain text, images, video, and audio.',11,17,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'file',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a duplicate of content on a storage medium that you can use in case the original is lost, damaged, or destroyed.',12,17,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'backup',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is software that finds websites, webpages, images, videos, news, maps, and other information related to a specific topic.',13,21,6);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'search engine',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________, which is similar to a password, consists of several words separated by spaces.',14,24,7);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'passphrase',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ software consists of the programs that control or maintain the operations of the computer and its devices.',15,25,8);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'System',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'One type of system software is a(n) ____________________ system, which is a set of programs that coordinates all the activities among computer hardware devices.',16,25,8);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'operating',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ software consists of programs designed to make users more productive and/or assist them with personal tasks.',17,26,8);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Application',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'When you instruct a computer or mobile device to run an application, the computer or mobile device ____________________ its software, which means the application is copied from storage to memory.',18,27,8);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'loads',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Examples of ____________________ users are sales reps, real estate agents, insurance agents, meter readers, package delivery people, journalists, consultants, and students.',19,38,11);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'mobile',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Examples of ____________________ users include engineers, scientists, architects, desktop publishers, and graphic artists.',20,39,11);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'power',1)
UPDATE Question SET Points=10 WHERE Question_ActID = @ActID

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
DECLARE @Assignment Int = 4
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Fill in the blank'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort

INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'The Internet'
,@ActSort
,'FIB/FIBIntro.cfm'
,10)
SELECT @ActID = Scope_Identity()
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'The major carriers of network traffic on the Internet are known collectively as the ____________________.',1,59,5);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Internet backbone',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ address is a number that uniquely identifies the location of each computer or device connected to the Internet.',2,59,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'IP',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Internet Protocol',2)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'IP (Internet Protocol)',3)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Internet Protocol (IP)',4)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ name is the text-based name that corresponds to the IP address of a server that hosts a website.',3,60,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'domain',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'The group that approves top-level domains is the ____________________.',4,60,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Internet Corporation for Assigned Names and Numbers',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'ICANN',2)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'ICANN (Internet Corporation for Assigned Names and Numbers)',3)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Internet Corporation for Assigned Names and Numbers (ICANN)',4)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'When you enter a domain name, a(n) ____________________ translates the domain name to its associated IP address so data can be routed to the correct computer.',5,61,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'DNS server',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ buy and register unused or lapsed domain names so that they can profit from selling them.',6,60,3);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Cybersquatters',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a filtering program that stops pop-up ads from displaying on webpages.',7,62,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'pop-up',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Favorites, also called ____________________, are links to preferred websites.',8,63,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'bookmarks',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Of Firefox, PowerPoint, Safari, and Internet Explorer, all are widely used web browsers for personal computers EXCEPT ____________________.',9,64,5);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'PowerPoint',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'In a web address, the ____________________ is a set of rules that defines how pages transfer on the Internet.',10,64,5);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'http',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Hypertext Transfer Protocol',2)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Hypertext Transfer Protocol (http)',3)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'http (Hypertext Transfer Protocol)',4)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a type of software for computers and mobile devices that reads a user''s specified web feeds and collects their most recent content.',11,65,7);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'aggregator',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'feed reader',2)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'When you enter a web address in a browser, you request, or ____________________, information from a web server.',12,65,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'pull',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ is a navigation system that consists of one or more earth-based receivers that accept and analyze signals sent by satellites in order to determine the receiver''s geographic location.',13,66,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'GPS',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Global positioning system',2)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'GPS (Global positioning system)',3)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Global positioning system (GPS)',4)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Bing, Google, and Yahoo! are all examples of web ____________________.',14,67,5);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'search engines',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A web ____________________ is software that finds websites, webpages, images, videos, news, maps, and other information related to a specific topic.',15,67,6);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'search engine',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ website offers exciting, challenging avenues for formal and informal teaching and learning.',16,71,7);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'educational',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'
<figure>
	<img src="Ch02/17.gif">
	<figcaption>The term ____________________ refers to the worldwide collection of websites like the one in the accompanying figure.</figcaption>
</figure>',17,72,7);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'blogosphere',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'
<figure>
	<img src="Ch02/18.gif">
	<figcaption>Like the one in the accompanying figure, a(n) ____________________ website uses a diary or journal format, and is an informal site consisting of time-stamped articles.</figcaption>
</figure>',18,72,7);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'blog',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a collaborative website that allows users to add to, modify, or delete the website content via their browser.',19,73,7);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'wiki',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Of the graphics formats that exist on the web, the two more common are ____________________ and JPEG formats.',20,81,8);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'PNG',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Portable Network Graphics',2)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'PNG (Portable Network Graphics)',3)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Portable Network Graphics (PNG)',4)

UPDATE Question SET Points=10 WHERE Question_ActID = @ActID
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
DECLARE @Assignment Int = 4
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Fill in the blank'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort

INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'Computers and Mobile Devices'
,@ActSort
,'FIB/FIBIntro.cfm'
,10)
SELECT @ActID = Scope_Identity()
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Many desktops have a(n) ____________________ tower that is a separate device from a monitor.',1,106,1);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'system unit',1)
--INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Some desktops, called ____________________ desktops, do not have a tower and instead house the screen and system unit in the same case.',2,107,1);
--SELECT @QuestionID = Scope_Identity()
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'all-in-one',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'all in one',2)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'The use of software to divide a physical server logically into many virtual servers is known as ____________________.',3,112,2);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'server virtualization',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a computer, usually with limited processing power, that enables users to send data to and/or receive information from a server.',4,113,3);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'terminal',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is an input device that uses laser beams to read bar codes on products.',5,113,3);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'bar code reader',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Some phones use ____________________ text input, where you press one key on the keyboard or keypad for each letter in a word and software on the phone anticipates the word you want.',6,118,5);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'predictive',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a mobile device that allows users to take photos and store the photographed images digitally.',7,120,5);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'digital camera',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ is the number of horizontal and vertical pixels in a display device.',8,122,5);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Resolution',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a flat, electronic device divided into panels that users press with their feet in response to instructions from a music video game.',9,126,6);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'dance pad',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is the point at which a peripheral device attached to or communicates with a computer or mobile device so that the peripheral device can send data to or receive information from the computer or mobile device.',10,129,8);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'port',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ joins a cable to a port.',11,130,8);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'connector',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'USB, as in USB port, is short for ____________________.',12,131,8);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'universal serial bus',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is an external device that attaches to a mobile computer or device, which contains a power connection and provides connections to peripheral devices.',13,132,8);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'docking station',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'If you have a computer that is not Bluetooth enabled, you can purchase a Bluetooth ____________________ that will convert an existing USB port into a Bluetooth port.',14,132,8);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'wireless port adapter',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a device that contains surge protection circuits and one or more batteries that can provide power during a temporary or permanent loss of power.',15,135,9);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'uninterruptible power supply',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'uninterruptible power supply (UPS)',2)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ occurs when the electrical supply or voltage drops, often defined as more than five percent, below the normal volts.',16,135,9);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'undervoltage',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is an injury or disorder of the muscles, nerves, tendons, ligaments, and joints.',17,136,10);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'RSI',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'repetitive strain injury',2)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'RSI (repetitive strain injury)',3)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'repetitive strain injury (RSI)',4)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ is a technology-related health condition that affects eyesight.',18,137,10);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Computer vision syndrome',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'CVS',2)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Computer vision syndrome (CVS)',3)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'CVS (Computer vision syndrome)',4)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ is an applied science devoted to incorporating comfort, efficiency, and safety into the design of items in the workplace.',19,138,10);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Ergonomics',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'The disorder known as ____________________ occurs when the technology consumes someone''s entire social life.',20,138,10);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'technology addiction',1)
UPDATE Question SET Points=10 WHERE Question_ActID = @ActID

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
DECLARE @Assignment Int = 4
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Fill in the blank'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort

INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'Programs and Apps'
,@ActSort
,'FIB/FIBIntro.cfm'
,10)
SELECT @ActID = Scope_Identity()
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is used to make users more productive and/or assist them with personal tasks.',1,152,1);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'app',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'application',2)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ software is mass-produced, copyrighted software that meets the needs of a wide variety of users, not just a single user or company.',2,155,3);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Retail',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ software performs functions specific to a business or industry.',3,155,3);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Custom',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ software is provided for use, modification, and redistribution and usually can be downloaded from the web at no cost.',4,155,3);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Open source',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ is copyrighted software that is distributed at no cost for a trial period.',5,155,3);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Shareware',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ is copyrighted software provided at no cost to a user by an individual or a company that retains all rights to the software.',6,155,3);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Freeware',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ software is free software, but it has been donated for public use and has no copyright restrictions.',7,155,3);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Public domain',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Public-domain',2)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Many desktop and mobile apps use a(n) ____________________ feature, where the changes to the apps can be configured to download and install automatically.',8,156,3);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'automatic updates',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'To ____________________ a document means to make changes to its existing content.',9,157,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'edit',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'To cut involves removing a portion of a document and storing it in a temporary storage location, called a(n) ____________________.',10,157,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'clipboard',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'When computer users ____________________ a project, they change its appearance.',11,157,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'format',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'To generate a hardcopy, you ____________________ a project.',12,158,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'print',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a predefined formula that performs common calculations such as adding the values in a group of cells.',13,161,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'function',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'In a database, each row, called a(n) ____________________, contains data about a given person, product, object, or event.',14,162,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'record',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ software is an application that helps you organize your calendar, keep track of contacts, and share this information with other devices or users.',15,163,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Calendar and contact management',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Application software often includes an image ____________________, which is a collection of clip art and photos.',16,173,5);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'gallery',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ typically consists of self-directed, self-paced instruction on a topic.',17,174,5);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'CBT',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Computer-based training',2)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'CBT (Computer-based training)',3)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Computer-based training (CBT)',4)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'WBT',5)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Web-based training',6)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'WBT (web-based training)',7)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Web-based training (WBT)',8)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a program that allows you to view images and animations, listen to audio, and watch video files on your computer or mobile device.',18,175,5);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'media player',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ software writes text, graphics, audio, and video files on a recordable or rewritable disc.',19,176,5);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Disc burning',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a separate area of a hard disk that holds an infected file until the infection can be removed.',20,181,8);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'quarantine',1)

UPDATE Question SET Points=10 WHERE Question_ActID = @ActID
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
DECLARE @Assignment Int = 4
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Fill in the blank'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'Digital Safety and Security'
,@ActSort
,'FIB/FIBIntro.cfm'
,10)
SELECT @ActID = Scope_Identity()
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'The term ____________________ describes an attack whose goal ranges from disabling a government''s computer network to crippling a country.',1,204,1);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'cyberwarfare',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a program that hides in a computer or mobile device and allows someone from a remote location to take full control of the computer or devices.',2,205,2);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'rootkit',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'
<figure>
	<img src="Ch05/3.gif">
	<figcaption>Computer viruses like the kind in the accompanying figure''along with worms, and Trojan horses''deliver their ____________________ on a computer or mobile device when a user opens an infected file or runs an infected program.</figcaption>
</figure>',3,205,2);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'payload',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ attack is an assault whose purpose is to disrupt computer access to an Internet service such as the web or email.',4,206,2);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'denial of service',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'DoS',2)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'denial of service (DoS)',3)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'DoS (denial of service)',4)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a program or set of instructions in a program that allow users to bypass security controls when accessing a program, computer, or network.',5,207,2);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'back door',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a web app that evaluates your computer or mobile device to check for Internet and email vulnerabilities.',6,208,2);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'online security service',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'To prevent unauthorized access and use, at a minimum a company should have a written ____________________ that outlines the activities for which a computer or network may and may not be used.',7,210,3);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'AUP',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'acceptable use policy',2)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'AUP (acceptable use policy)',3)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'acceptable use policy (AUP)',4)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ control is a security measure that defines who can access a computer, when they can access it, and what actions they can take while accessing the computer.',8,211,3);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'access',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ object is any item that must be carried to gain access to a computer or computer facility.',9,213,3);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'possessed',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ device authenticates a person''s identity by translating a personal characteristic into a digital code that then is compared with a digital code stored in the computer verifying a physical or behavioral characteristic.',10,213,3);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'biometric',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ involves the examination of media, programs, data and log files on computers, mobile devices, servers, and networks.',11,214,2);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Digital forensics',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ agreement is the right to use software.',12,215,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'license',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'The most common type of license included with software purchased by individual users is a(n) ____________________.',13,215,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'end-user license agreement',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'EULA',2)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'EULA (end-user license agreement)',3)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'end-user license agreement (EULA)',4)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'single-user license agreement',5)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ is the unauthorized and illegal duplication of copyrighted software.',14,215,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Software piracy',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Piracy',2)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ occurs when someone steals personal or confidential information.',15,216,4);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Information theft',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'____________________ is the process of converting readable data into unreadable characters to prevent unauthorized access.',16,216,6);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Encryption',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ signature is an encryption code that a person, website, or organization attaches to an electronic message to verify the identity of the message sender.',17,218,6);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'digital',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A(n) ____________________ is a written plan that describes the steps an organization would take to restore its computer operations in the event of a disaster.',18,220,7);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'disaster recovery plan',1)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'
<figure>
	<img src="Ch05/19.gif">
	<figcaption>A(n) ____________________ is a wireless network name, which you should change from the default to something that uniquely identifies your network, like the kind in the accompanying figure, especially if you live in close proximity to other wireless networks.</figcaption>
</figure>',19,222,8);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'SSID',1)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'service set identifier',2)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'SSID (service set identifier)',3)
--INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'service set identifier (SSID)',4)
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Employers and schools often specify standards for the ethical use of technology in an IT ____________________ and then distribute these standards to employees and students.',20,226,9);
SELECT @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'code of conduct',1)

UPDATE Question SET Points=10 WHERE Question_ActID = @ActID
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
GO




