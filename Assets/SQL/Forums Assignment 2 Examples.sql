set nocount on
set statistics time off
set statistics io off

DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Forums'
)
DECLARE @Chapter Int = 6
DECLARE @Assignment Int = 2
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment -- Do a search for 3012 if you change this.

DECLARE @ActName Varchar(128) = 'Forum 2: Examples of Technology'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActOnline,ActSort,ActLink,Questions) VALUES(@ActName
,'The syllabus says
<blockquote>This course covers the relationships between the individual, society, and technologies.
It will include such topics as the legal, moral, and ethical ramifications of technology use including security, privacy, health concerns, web use, and intellectual property.
</blockquote>'
,'<p>Now, a lot of assignments are a race to see how quickly you can get through them.  Please don''t treat this assignment that way.
Please take the time to read these questions and answer them thoughtfully.  Your answers will be posted into the chat room.'
,@ActSort
,'Forums/Examples/ExamplesIntro.cfm'
,10
)
SELECT @ActID=SCOPE_IDENTITY()

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'Please give an example of the relationship between the individual and technology.'
,'The relationship between the individual and technology:'
,1
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity()
,'How has technology changed the individual?'
,1
)

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'Please give an example of the relationship between society and technology.'
,'The relationship between society and technology:'
,2
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity()
,'How did the electrification of America change society as a whole? 
Before my father in-law passed away, he told me of how he remembered the day they came in and installed a light bulb in his house.
It was a single bulb that hung in the middle of the room.
He said they sat around in amazement, staring at it like we would a TV today.  Why, it lit up <em>the whole room</em>!
You could see into the corners! That was a lot better than the gas fired light they had previously.
<p>Another thought:<br>
How has the Internet changed our ideas of country boundaries?</p>'
,1
)

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'Please give an example of the legal ramifications of technology use.'
,'The legal ramifications of technology use:'
,3
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity()
,'What kind of technology is illegal?'
,1
)

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'Please give an example of the moral ramifications of technology use.'
,'The moral ramifications of technology use:'
,4
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity()
,'What kind of technology hasn''t risen to the level where lawmakers have taken the time to write a law against it, but might be considered immoral.'
,1
)

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'Please give an example of the ethical ramifications of technology use.'
,'The ethical ramifications of technology use:'
,5
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity()
,'Are ancient ethics the same today in light of social networking?'
,1
)

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'Please give an example of security in relation to technology.'
,'Security and Technology:'
,6
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity()
,'Security has always relied heavily on technology. Anything from a simple lock to securing troops in the battlefield.'
,1
)

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'Please give an example of privacy in relation to technology.'
,'Privacy and Technology:'
,7
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity()
,'Cameras are everywhere - from cell phones to surveillance cameras, even traffic lights now have cameras!'
,1
)

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'Please give an example of health concerns in relation to technology.'
,'Health concerns and technology:'
,8
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity()
,'Do you own a Fitbit?'
,1
)

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'Please give an example of a very popular website.'
,'Web Use:'
,9
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity()
,'Try not to post one that''s been posted already.'
,1
)

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort) VALUES(@ActID
,'Please give an example of intellectual property and technology.'
,'Intellectual Property:'
,10
)
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(Scope_Identity()
,'When your talking about Intellectual Property (IP), you''re talking about copyright and patents.'
,1
)

UPDATE Question SET Points=10
WHERE Question_ActID = @ActID


--
-- Attendance
--
DECLARE @AttendanceCatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Attendance'
)
DECLARE @AttendanceActSort Int = @AttendanceCatSort + @Chapter*100 + @Assignment
DECLARE @QuestionName Varchar(128) -- We're going to cursor through every QuestionName
DECLARE @Att_ActID Int

exec ClearAct @AttendanceActSort
INSERT INTO Act(ActName,ActSort,ActLink,Questions) VALUES(
	 @ActName + ' Attendance'
	,@AttendanceActSort
	,'Student/Attendance.cfm'
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
		,@QuestionName + ' attendance'
		,@QuestionID -- The QuestionSort is actually the QuestionID from the original question.
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

--
-- Assignments
--
DECLARE @AssignmentStart smalldatetime
DECLARE @AssignmentStop  smalldatetime
DECLARE @CourseSort Int

SET @AssignmentStart = '10/27/2014'
SET @AssignmentStop = '11/2/2014 23:59'
exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop
--
-- Post GuessName
--
DECLARE @GuessName Varchar(max)
DECLARE @GuessComment Varchar(max) = ''
DECLARE @QuestionSort Int
SET @QuestionSort = 1
SET @GuessName = 'We used to work strenuously all day long, but now we sit in front of a computer and type, then we go home and sit in front of a computer and type,
and then we sit in front of a TV and stare.
Technology is what allows us to sit in a perfectly controlled environment, eating as much food as we want,
prepared at the height of it''s freshness and served at it''s best temperature. Cold drinks and hot food in an air conditioned cafeteria!
'
exec PostGuesses @GuessName,@GuessComment,@ActID,@QuestionSort


SET @GuessName = '
<p>1. Before the Internet, it was hard to get your thoughts published in a medium that more than a handful of people could see.
Now, anyone can post something and that allows anyone in the world to view it instantly.</p>
<p>2. For people who are loners, they can now get online and be someone else.</p>
<p>3. Online dating is the norm now, isn''t it?</p>
'
SET @QuestionSort = 2
exec PostGuesses @GuessName,@GuessComment,@ActID,@QuestionSort


SET @GuessName = '<p>1.
Sometimes technology disrupts society and we have to react to a new way of thinking.
Europe is now struggling with "The right to be forgotten". They want Google to comply
when someone asks them to delist a search result.  In the past, the would be
tantamount to asking a newspaper to not print a story.
<p>2. There are some countries that are as close to lawless as you can imagine. And now with the Internet, being able to interract
with lawlessness is the same process as conducting legitimate business.
Before online became so popular, you kind of had the sense that you were doing some nefarious because you might be
in a seedy part of town. Now there''s no difference between sending an email to a colleague and sending one to a prince in Nigeria.
<p>3. Pirate Bay was shut down for selling illegal drugs online.</p>
<p>4. Bitcoin wouldn''t be possible without technology.</p>
'
SET @QuestionSort = 3
exec PostGuesses @GuessName,@GuessComment,@ActID,@QuestionSort

SET @GuessName = '
<p>1. <a href="//www.youtube.com/embed/8aghzpO_UZE">3D Printers</a> are going to change a lot of things in the future.
But of course, you can''t talk about 3D printing without someone mentioning that they 
can be use to print guns.</p>
<p>2. I think everyone can think of an example of immoral Internet use.
</p>
'
SET @QuestionSort = 4
exec PostGuesses @GuessName,@GuessComment,@ActID,@QuestionSort

SET @GuessName = '
Deuteronomy 22 says "If you see your neighbor’s ox or sheep or goat wandering away, don’t ignore your responsibility. Take it back to its owner." One day here on campus, the coke machine dispensed two cokes instead of one. I thought of this verse, so I left the 2nd coke on top the machine for the owner.
'
SET @QuestionSort = 5
exec PostGuesses @GuessName,@GuessComment,@ActID,@QuestionSort

SET @GuessName = '
Target recently made news because hackers had broken into their credit card processing.
'
SET @QuestionSort = 6
exec PostGuesses @GuessName,@GuessComment,@ActID,@QuestionSort

SET @GuessName = '
In 1987, Robert Bork was nominated for Associate Justice of the Supreme Court.
During debate over his nomination, Bork''s video rental history was leaked to the press. 
Today, Internet Service Providers have much greater detail on what you watch than what they had on Robert Bork.
BTW, the incident led to the enactment of the 1988 Video Privacy Protection Act.
'
SET @QuestionSort = 7
exec PostGuesses @GuessName,@GuessComment,@ActID,@QuestionSort

SET @GuessName = '
In the 90s, I saw the future with the <a href="http://tulrich.com/tectrixvr/">VR Bike</a>.
As a standalone machine, it was too expensive, but for people that already own a desktop computer and a bicycle,
I believe a cradle and connector could be solved pretty cheaply.
'
SET @QuestionSort = 8
exec PostGuesses @GuessName,@GuessComment,@ActID,@QuestionSort

SET @GuessName = '
<a href="http://www.google.com">Google</a>
'
SET @QuestionSort = 9
exec PostGuesses @GuessName,@GuessComment,@ActID,@QuestionSort

SET @GuessName = '
NPR did a show called "
<a href="http://www.thisamericanlife.org/radio-archives/episode/441/when-patents-attack">
When patents attack</a>", talking about problem of patent trolls.
Lawyers who take out patents for things they never invent, but when someone actually does the
work of making the invention later, a lawyer pops up and says "Hey!  I patented that years ago!".
'
SET @QuestionSort = 10
exec PostGuesses @GuessName,@GuessComment,@ActID,@QuestionSort
GO
