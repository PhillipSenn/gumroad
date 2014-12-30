set nocount on
set statistics time off
set statistics io off

DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Forums'
)
DECLARE @Chapter Int = 6
DECLARE @Assignment Int = 30
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment
select * 
from act
where ActSort=@ActSort

DECLARE @ActName Varchar(128) = 'Forum 4: Picture'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName
,'I can remember walking around Ball State University way back in ''78 with my 35mm camera.  A camera is
something that you''ll want to carry around with you as an undergrad because these are special times in your life.
<p>With technology disrupting every part of society, this might be the last generation that goes to college on campus.</p>
<p>Have someone take a picture of you with an interesting landmark here at LR.
Introduce yourself, but also <span class="label-info">do some research</span> and say something about the landmark.</p>
<p>What is a landmark:  Well, I think the most exotic landmark I can think of was when a student took a selfie with pastor Weisner.
The student reasoned that <u>he</u> was a landmark.</p>
<p>What''s the most common landmark? I think it''s almost a requirement that you have your picture taken with the bear
that''s between the student center and the gym, isn''t it?
Just remember to say something about it, like what''s on the plaque, or an anecdote.  You know... about the shrubbery behind the bear...
You know...
</p>
'
,@ActSort
,'Forums/Picture.cfm'
,10
)
SELECT @ActID=SCOPE_IDENTITY()

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'The picture has to be taken this semester.'
,'Please don''t use one that was done for you like a sports picture or one for your fraternity/sorority.'
,1
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity(),'',1)

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'Introduce yourself.'
,'You won''t need to include your name.  I''ll include that in the byline.'
,2
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity(),'',1)

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'Make sure you attribute who took the photo.'
,'It can be just their first name if they''re shy.'
,3
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity(),'',1)

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'<span class="red">Spelling</span>'
,'Microsoft Word will underline anything in red if it''s not spelled correctly.'
,4
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity(),'',1)

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'Punctuation'
,'There are no punctuation errors,'
,5
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity(),'',1)

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'<span class="green">Grammar</span>'
,'Microsoft Word will underlined bad grammar in green.'
,6
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity(),'',1)

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'<span class="blue">Contextual Mistakes</span>'
,'Microsoft Word will underline in blue words that may be spelled correctly but used
in the wrong context, like "wear is everyone?".'
,7
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity(),'',1)

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'Research the landmark'
,'I had one student ask me what did I mean by research.
Well, you know... <em>The least</em> you can do is <em>read the plaque that''s
right there</em>! But what I really mean is to find out some information
like when was it installed or who donated it or who made it.
Just say something that''s not "intuitively obvious to the most casual observer".'
,8
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity(),'IOTTMCO',1)


INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'Make sure I can see who you are.'
,'Don''t wait until midnight the night of the assignment to take the picture!'
,9
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity(),'',1)


INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'If anyone else is in the picture with you, other than a passerby, they are identified as well.'
,'Make sure you not only identify them by name, but it''s clear who is who.'
,10
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity(),'',1)
UPDATE Question 
SET Points=10
WHERE Question_ActID=@ActID

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


select *
from assignment
where Assignment_ActID=@ActID
