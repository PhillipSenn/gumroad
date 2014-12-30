set nocount on
set statistics time off
set statistics io off

DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Final'
)
DECLARE @Chapter Int = 10
DECLARE @Assignment Int = 1
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment
SELECT * FROM Act
WHERE ActSort= @ActSort

DECLARE @ActName Varchar(128) = 'The Final Assignment'
DECLARE @ActID Int
DECLARE @QuestionID Int
exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName
,'There''s no "final" - one giant test that includes everything you''ve learned
in the textbook, plus all the research assignments plus all the programming assignments.  
There is one final assignment however.
It will have to do with writing a personal philosophy paper about how you control your technology use.
<p>There is the familiar theme of a person who has great wealth, only to find that his possessions are actually owning <u>him</u>.
Coming out of college, you might get a high paying job so you buy a nice house, a nice car, with a nice mortage and a nice car payment.
Suddenly you find yourself a slave to the job so that you can keep up with your possessions.</p>
<p>The same can hold true with technology. We currently live with an embarrassment of riches when it comes to our smart phones,
our laptops, our desktops, our tablets and phablets. Our watches, our fitbits, our Google glasses.</p>
How can you turn it off? Could you live without your phone?
We will discuss this at length in the weeks leading up to the end of the mini-term. After all, I can''t hand out the final the first week of class!'
,@ActSort
,'Final/FinalAssignment.cfm'
,1
)
SELECT @ActID=SCOPE_IDENTITY()

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(
 @ActID
,''
,''
,1
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity()
,''
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

SET @AssignmentStart = '12/8/2014'
SET @AssignmentStop = '12/14/2014 23:59'
exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop


