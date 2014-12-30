set nocount on
set statistics time off
set statistics io off

DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Presentation'
)
DECLARE @Chapter Int = 9
DECLARE @Assignment Int = 9
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment
SELECT * FROM Act
WHERE ActSort= @ActSort

DECLARE @ActName Varchar(128) = 'Online Presentation'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName
,'<p>One of the things mentioned in the syllabus is that students present their research to the class,
so what I''d like for you to do is provide a step-by-step walk thru of how you found your article in WorldCat or Academic Search Complete.</p>
<p>I don''t know if every student has the minimum required hardware for screen sharing,
and I''m pretty sure I''m not going to get everyone together all at the same time,
so you''ll have to create a presentation that can stand on it''s own.  
Here are some ideas for vehicles that you can use to carry your presentation to an online audience, but you''re certainly not limited to this list:
</p>
<ul>
	<li>The recording of a Google hangout</li>
	<li>A Google presentation, like PowerPoint</li>
	<li>A prezi</li>
	<li>A Jing video</li>
	<li>GoAnimate</li>
	<li>Xtranormal</li>
	<li><a href="voki.cfm">Voki</a></li>
	<li>Zimmer Twins</li>
</ul>
'
,@ActSort
,'Presentation/Online.cfm'
,4
)
SELECT @ActID=SCOPE_IDENTITY()

INSERT INTO Question(Question_ActID,QuestionName,Points) VALUES(
 @ActID
,'Create a presentation that shows how you found an article in one of the Lenoir-Rhyne online databases about
taking a break from technology. '
,25
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity()
,'Talk about the key words that you used whether it was camping, Henry David Thoreau, sabbath, hurricane, flood, tornado, war, snow storm, ice storm,
Outlander, the tv series Revolution, no screens day.'
,1
)

INSERT INTO Question(Question_ActID,QuestionName,Points) VALUES(
 @ActID
,'Include your name.'
,25
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity()
,''
,1
)
INSERT INTO Question(Question_ActID,QuestionName,Points) VALUES(
 @ActID
,'Make sure you have the correct spelling, grammar, punctuation, and capitalization.'
,25
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity()
,'If you spell something wrong in a presentation, that''s the one thing people will feel obligated to talk about.'
,1
)
INSERT INTO Question(Question_ActID,QuestionName,Points) VALUES(
 @ActID
,'Please include some artwork.'
,25
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity()
,'In other words, something more than text. A Jing video would naturally have animation (your mouse moving around), but if you are using one of the more static packages like a Google Presentation or a Prezi, then please add a little pizzaz to it.'
,1
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
exec AddAssignment @ActID,@CatSort,@AssignmentStart,@AssignmentStop,71
exec AddAssignment @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop,71
exec AddAssignment @ActID,@CatSort,@AssignmentStart,@AssignmentStop,72
exec AddAssignment @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop,72


select *
from assignmentView
where actsort=@ActSort
GO
