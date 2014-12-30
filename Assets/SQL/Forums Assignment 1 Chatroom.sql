set nocount on
set statistics time off
set statistics io off

DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Forums'
)
DECLARE @Chapter Int = 6
DECLARE @Assignment Int = 1
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment -- Do a search for 3011 if you change this.

DECLARE @ActName Varchar(128) = 'Forum 1: chat room'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName
,'In this scene from <a href="https://www.youtube.com/watch?v=o7Yrw7QNx1U">Starship Troopers</a>, 
there''s a lot more going on in the classroom than the lecture.
When I originally saw this scene in 1997, it was science fiction - let alone 1959 when the book was written!
Can you imagine everyone in the classroom with a computer?
All tied together on a network? Amazing!
<p>
The chat room is for open dicsussion, but I know that 
everything has to be graded or otherwise there would only be spotty participation at best.
So instead of me grading based upon spelling, grammar, punctuation and contextual mistakes, I''ve added an upvote
mechanism to allow you to upvote your fellow students'' posts.
</p>
<p>Don''t worry!  I''m sure that by the end of 8 weeks, you''ll have 100 "likes".</p>
Let''s say there are 20 students in class, you post 5 chats - that''s 100 likes.
'
,@ActSort
,'Forums/ChatIntro.cfm'
,5) -- This way it won't show up as completed until they've posted 5 chats.
SELECT @ActID = Scope_Identity()
INSERT INTO Question(Question_ActID,QuestionName,Points) VALUES(@ActID
,''
,1
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID) VALUES(@QuestionID)
--
-- Assignments
--
DECLARE @AssignmentStart smalldatetime = (
	SELECT TermStart
	FROM Term
)
DECLARE @AssignmentStop  smalldatetime = (
	SELECT LastDayOfClasses
	FROM Term
)
DECLARE @CourseSort Int

exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
--exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop
select *
from assignment
where Assignment_ActID=@ActID

