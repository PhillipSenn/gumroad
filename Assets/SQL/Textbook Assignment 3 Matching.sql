-- The solution has to be simple: The same start/stop time for everyone?
-- The solution has to seem reasonable: midnight is the time of the deadline?
-- The solution has to be equitable: The same for online vs f2f?
set nocount on
set statistics time off
set statistics io off

DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Textbook'
)
DECLARE @Chapter Int = 1
DECLARE @Assignment Int = 3
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Matching'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort

INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName
,'Digital Literacy'
,@ActSort
,'Matching/MatchingIntro.cfm'
,20)
SELECT @ActID = Scope_Identity()
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Having a current knowledge and understanding of computers and related technologies',1,'2',1);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'digital literacy',6,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Thin, lightweight mobile computer with a screen in its lid and a keyboard in its base',2,'4',1);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'laptop',15,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A thin, lightweight mobile computer with a touch screen',3,'4',1);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'tablet',14,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'An electronic device, operating under the control of instructions stored in its own memory, that can accept data, process the data according to specified rules, produce information, and store the information for future use',4,'4',1);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'computer',13,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A personal computer designed to be in a stationary location',5,'6',1);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'desktop',7,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A computer dedicated to providing one or more services to other computers or devices on a network',6,'6',1);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'server',11,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A computing device small enough to hold in your hand',7,'7',2);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'mobile device',12,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'An internet-capable phone that usually also includes a calendar, an appointment book, an address book, a calculator, notepad, games, and several other apps',8,'7',2);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'smartphone',8,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Any hardware component that allows you to enter data and instructions into a computer or mobile device',9,'12',4);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'input device',10,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Any hardware component that conveys information from a computer or mobile device to one or more people',10,'14',4);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'output device',9,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Where a computer keeps data, instructions, and information',11,'15',4);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'storage media',1,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Removable flash memory',12,'16',4);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'memory card',19,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A worldwide collection of computer networks that connects millions of businesses, government agencies, educational institutions, and individuals',13,'18',5);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'Internet',20,1);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'One of the more widely used Internet services',14,'18',5);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'World Wide Web',18,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A storage device that typically uses flash memory to store data, instructions, and information',15,'16',4);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'solid-state drive',2,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A named collection of stored data, instructions, or information',16,'17',4);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'file',4,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A website that encourages members to share their interests, ideas, stories, photos, music, and videos with other users',17,'21',6);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'online social network',17,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A series of related instructions, organized for a common purpose, that tells the computer what tasks to perform and how to perform them',18,'25',8);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'program',3,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Software that finds websites, webpages, images, videos, news, maps, and other information related to a specific topic',19,'21',6);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'search engine',16,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Software that enables users with an Internet connection to access and view webpages on a computer or mobile device',20,'20',6);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'storage media',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'solid-state drive',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'program',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'file',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'browser',5,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital literacy',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'desktop',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'smartphone',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'output device',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'input device',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'computer',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engine',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'online social network',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'World Wide Web',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'memory card',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet',20);
UPDATE Question SET Points=5 WHERE Question_ActID = @ActID


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
DECLARE @Assignment Int = 3
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Matching'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'The Internet'
,@ActSort
,'Matching/MatchingIntro.cfm'
,20)
SELECT @ActID = Scope_Identity()
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Consists of the original article and all subsequent related replies',1,'87',11);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'thread',11,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'One million characters',2,'58',5);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'megabyte',13,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Uses the Internet instead of the public switched telephone network to connect a calling party to one or more called parties',3,'88',11);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'VoIP',12,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'One billion characters',4,'58',11);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'gigabyte',15,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'When a message is sent to one of these, every person on the list receives a copy of the message in his or her mailbox',5,'86',11);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'email list',14,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'To add your email name and address to a mailing list, do this',6,'86',11);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'subscribe',16,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Many operating systems include these capabilities',7,'89',11);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'FTP',18,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Your Internet service provider supplies this, for an email address',8,'85',11);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'domain name',17,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'The appearance of motion created by displaying a series of still images in sequence',9,'81',8);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'animation',19,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Particularly helpful in locating webpages about certain topics or in locating specific pages for which a user does not know the exact web address',10,'67',6);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'search engines',20,1);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Its goal is to develop and test advanced technologies that will benefit Internet users in the future',11,'54',2);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'Internet2',1,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Kind of network that uses radio signals to provide high-speed Internet connections to compatible devices',12,'57',2);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'Wi-Fi',3,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Type of broadband Internet service that uses fiber-optic cable to provide high-speed Internet access to home and business users',13,'57',2);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'FTTP',4,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Type of broadband connection that provides high-speed Internet connections through a telephone network via a DSL modem',14,'57',2);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'DSL',5,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Oversees research and sets standards and guidelines for many areas of the Internet',15,'56',2);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'W3C',9,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A business that provides individuals and organizations access to the Internet free or for a fee',16,'58',3);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'access provider',10,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Any computer that provides services and connections to other computers on a network',17,'54',2);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'server',2,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Provides high-speed Internet connections using a dish-shaped antenna on a building to communicate with a lower location via radio signals',18,'57',3);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'fixed wireless',8,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Transforms a smartphone or Internet-capable tablet into a portable communications device that shares its Internet access with other computers and devices wirelessly',19,'57-58',3);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'IP address',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'tethering',7,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A number that uniquely identifies each computer or device connected to the Internet',20,'59',4);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Internet2',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'server',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Wi-Fi',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTTP',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DSL',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'IP address',6,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tethering',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'fixed wireless',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'W3C',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'access provider',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'thread',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'VoIP',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'megabyte',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email list',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'gigabyte',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'subscribe',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'domain name',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'FTP',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'animation',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'search engines',20);
UPDATE Question SET Points=5 WHERE Question_ActID = @ActID
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
DECLARE @Assignment Int = 3
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Matching'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'Computers and Mobile Devices'
,@ActSort
,'Matching/MatchingIntro.cfm'
,20)
SELECT @ActID = Scope_Identity()
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'The smallest element in an electronic image',1,'122',5);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'pixel',1,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Your collection of stored digital media',2,'123',5);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'media library',19,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Joins a cable to a port',3,'130',8);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'connector',20,1);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'The point at which a peripheral device attaches to or communicates with a computer or mobile device',4,'129',8);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'port',18,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Can connect up to 127 different peripheral devices together with a single connector',5,'131',8);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'USB port',2,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'An external device that provides connections to peripheral devices through ports built into the device',6,'131',8);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'port replicator',4,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Technology that uses short-range radio signals to transmit data between two specifically enabled devices',7,'132',8);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'Bluetooth',17,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A computing device small enough to hold in your hand',8,'104',1);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'mobile device',3,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Unsolicited email messages',9,'106',1);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'spam',16,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'The electronic component that interprets and carries out the basic instructions that operate a computer',10,'106',1);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'CPU',5,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'The case that contains and protects the motherboard, hard disk drive, memory, and other electronic components of the computer from damage',11,'106',1);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'system unit',6,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Another name for a notebook computer',12,'108',1);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'laptop',15,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A device that combines the features of a smartphone with a tablet',13,'110',1);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'phablet',14,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Provides a central location for online game play',14,'111',2);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'game server',13,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'The practice of sharing or pooling computing resources, such as servers and storage devices',15,'112',2);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'virtualization',7,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A computer, usually with limited processing power, that enables users to send data to and/or receive information from a server',16,'113',3);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'terminal',11,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'An environment of servers that house and provide access to resources users access through the Internet',17,'116',4);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'cloud computing',12,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Another name for text message service',18,'118',5);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'SMS',8,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'The number of horizontal and vertical pixels in a display device',19,'122',5);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'embedded computer',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'resolution',10,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Functions as a component in a larger product',20,'126',7);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'pixel',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'USB port',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'mobile device',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port replicator',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CPU',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'system unit',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'virtualization',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'SMS',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'embedded computer',9,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'resolution',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'terminal',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'cloud computing',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'game server',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'phablet',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'laptop',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'spam',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Bluetooth',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'port',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media library',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'connector',20);
UPDATE Question SET Points=5 WHERE Question_ActID = @ActID
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
DECLARE @Assignment Int = 3
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Matching'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'Programs and Apps'
,@ActSort
,'Matching/MatchingIntro.cfm'
,20)
SELECT @ActID = Scope_Identity()
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Allows users to access and view web pages on the Internet',1,'178',7);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'browser',1,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Available free at portals on the web and included with paid Internet access service',2,'178',7);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'email',20,1);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Integrated in most mobile devices',3,'178',7);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'wireless messaging',19,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A program designed to make users more productive and/or assist them with personal tasks',4,'152',1);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'app',2,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Used to create time-stamped articles in a diary or journal format',5,'178',7);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'blogware',18,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Enables meeting between geographically separated people who use a network such as the Internet to transmit video/audio',6,'178',7);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'video conferencing',3,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Online area where users have written discussions',7,'178',7);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'discussion forum',4,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Type of application that assists professional and designers in creating engineering, architectural, and scientific designs and models',8,'170',5);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'CAD',17,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Keeps track of changes made to websites',9,'178',7);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'web feed',16,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A collection of individual applications available together as a unit',10,'163',4);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'software suite',5,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Kind of software that determines where users are spending their money',11,'165',4);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'personal finance',15,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Kind of software that creates and analyzes the user''s tax forms to search for potential errors and deduction opportunities',12,'166',4);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'tax preparation',6,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Kind of software that provides the capabilities of paint software and the ability to modify existing graphics',13,'171',5);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'image editing',13,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Software often included with the purchase of a digital camera',14,'172',5);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'photo editing',14,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Real-time exchange of messages, files, audio, and/or video with another online user',15,'178',7);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'instant messaging',7,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Real-time online typed conversations with many users; integrated in some operating systems and browsers',16,'178',7);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'chat room',8,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A collection of data organized in a manner that allows access, retrieval, and use of that data',17,'162',4);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'database',12,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Detects and protects a computer and its data from unauthorized intrusions',18,'179',8);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'personal firewall',10,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A collection of drawings, photos, and other images',19,'159',4);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'media sharing',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'clip art',11,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Kind of mobile app with which you can use the digital camera on your mobile device to take quality photos and/or videos and then instantly share them on social media sites',20,'177',6);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'browser',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'app',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'video conferencing',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'discussion forum',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'software suite',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'tax preparation',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'instant messaging',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'chat room',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'media sharing',9,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal firewall',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clip art',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'database',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'image editing',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'photo editing',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'personal finance',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web feed',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CAD',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'blogware',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'wireless messaging',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'email',20);
UPDATE Question SET Points=5 WHERE Question_ActID = @ActID
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
DECLARE @Assignment Int = 3
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Matching'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName
,'Digital Safety and Security'
,@ActSort
,'Matching/MatchingIntro.cfm'
,20)
SELECT @ActID = Scope_Identity()
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Usually does not have advanced computer and technical skills.',1,'204',1);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'script kiddie',15,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A group of compromised computers.',2,'206',2);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'botnet',6,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A program that restricts access to specified websites.',3,'234',10);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'web filtering software',13,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Most systems require that a user selects this on his or her own.',4,'211',3);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'password',14,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'The owner of this kind of computer is unaware that it is being controlled remotely by an outsider.',5,'206',2);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'zombie',7,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'An authorized person or company that issues and verifies digital certificates.',6,'218',5);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'CA',3,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Any event or action that could cause a loss of or damage to computer or mobile device hardware.',7,'202',1);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'digital security risk',4,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'In the encryption process, the unencrypted, readable data.',8,'216',5);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'plaintext',17,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'In the encryption process, the encrypted (scrambled) data.',9,'216',5);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'ciphertext',16,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Protects a network''s resources from intrusion.',10,'208',2);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'firewall',5,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'An encrypted code that a person, website, or organization attaches to an electronic message to verify the identity of the message sender.',11,'218',5);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'digital signature',1,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Protects any tangible form of expression.',12,'225',9);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'copyright',20,1);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A common infringement of copyright.',13,'215',4);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'piracy',19,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A notice that guarantees a user or a website is legitimate.',14,'218',5);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'digital certificate',2,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A program that performs a repetitive task on a network.',15,'206',2);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'bot',18,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'A scam in which a button or link on a website contains a malicious program.',16,'231',10);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'clickjacking',8,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Biometric device used in high security areas.',17,'214',3);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'iris recognition system',12,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Makes it illegal to circumvent antipiracy schemes in commercial software.',18,'233',10);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'Outlines the activities for which a computer or network may and may not be used.',19,'210',3);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'DoS attack',10);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'AUP',11,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Ref,Obj) VALUES(@ActID,'An assault whose purpose is to disrupt computer access to an Internet service',20,'206',2);
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital signature',1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital certificate',2);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'CA',3);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'digital security risk',4);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'firewall',5);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'botnet',6);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'zombie',7);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'clickjacking',8);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'Digital Millennium Copyright Act (DCMA)',9);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort,Correct) VALUES(@QuestionID,'DoS attack',10,1);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'AUP',11);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'iris recognition system',12);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'web filtering software',13);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'password',14);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'script kiddie',15);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'ciphertext',16);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'plaintext',17);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'bot',18);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'piracy',19);
INSERT INTO Answer(Answer_QuestionID,AnswerName,AnswerSort) VALUES(@QuestionID,'copyright',20);
UPDATE Question SET Points=5 WHERE Question_ActID = @ActID
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
