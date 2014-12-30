set nocount on
set statistics time off
set statistics io off

DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Research Paper'
)
DECLARE @Chapter Int = 7
DECLARE @Assignment Int = 11
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Goofus and Gallant'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort

INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'
Don''t do an Internet search for Goofus and Gallant, where you might find parodies of the original Highlights magazine.
Let''s get our source material from the pdf itself.'
,@ActSort
,'GoofusAndGallant/GoofusAndGallantIntro.cfm'
,4
)
SELECT @ActID = Scope_Identity()
UPDATE Act SET ActOnline='
<p>My wife related the story that a friend of hers, Diana, told her. Diana said that she was sitting a few cars back in the drive-thru at McDonalds when an elderly couple came out the side door.  
The man walked over to the passenger side of the car, opened the door for his wife and waited until she got in. 
He closed her door and then walked around to get in himself.</p>
<p>Diana said that it was such a tender moment that it almost brought her to tears, and she looked forward to her and her husband being like that when they got older.</p>
<p>A few days later, Diana was at the drive-thru again, and this time she saw another woman come out the side door, but by herself.  
She got over to her car, where there was a man sitting in the driver''s seat, but the doors were locked.  She, with her hands full, had to knock on the window before her husband reached over to unlock the door.</p>
<p>Diana said it was like the comic strip Goofus and Gallant from Highlights for Children magazine.</p>'
WHERE ActID = @ActID
INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Points) VALUES(@ActID,'
Find a Goofus and Gallant article from Highlights for Children magazine in <a href="http://library.lr.edu/quick/databases">Academic Search Complete</a>.'
,1,25)
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'
Here''s a <a href="http://screencast.com/t/qDpGSVxrf">Jing screencast on how to do an Advanced search</a> in Academic Search Complete.<br>
<a href="http://library.lr.edu/offcampus">If you are off campus, click here</a>.<br>
Oh!  Make sure you choose "All Datbases" just to be safe because the result that you want is in the MasterFILE Complete database, 
which isn''t selected by default.'
,1)

INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Points) VALUES(@ActID,'
Save the pdf and upload it here.
Here''s a <a href="http://screencast.com/t/crCJcrRy4">screencast showing me saving the pdf</a>.
The Save-to-disk icon is in <a href="gif/SavePDF.gif">the lower right-hand corner</a>.'
,2,25)
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'attachment'
,1)

INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Points) VALUES(@ActID,'
<a href="http://screencast.com/t/QNxQkpkp8TQ">Copy and Paste into this textarea the text of the article</a> from the HTML Full Text.
You are showing me that you know how to find the pdf (which will often include pictures and charts), as well as the Full Text,
(which is useful for copy/pasting).'
,3,25)
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'
Here''s <a href="http://screencast.com/t/MsWFPZuLu9AC">another screencast</a> of my listening to the EBSCOhost text-to-speech program (contains sound).'
,1)

INSERT INTO Question(Question_ActID,QuestionName,QuestionSort,Points) VALUES(@ActID,'
The pdf has to be one that someone else hasn’t uploaded already.'
,4,25)
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'
<a href="Gallery.cfm?ActSort=' + CAST(@ActSort AS Varchar)
+ '">Here are the ones that people have uploaded already</a>.',1)

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

SET @AssignmentStop = '10/26/2014 23:59'
exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop
GO




DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Research Paper'
)
DECLARE @Chapter Int = 7
DECLARE @Assignment Int = 12
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Different First Page'
DECLARE @ActID Int
DECLARE @QuestionID Int
exec ClearAct @ActSort

INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'Please see the 
<a href="docx/DifferentFirstPage.docx">instructions in the attached Microsoft Word document</a>.
When you save something, I''ve found it easiest to save it to the desktop. 
That way you can find it.
'
,@ActSort
,'APA/APA.cfm'
,1
)
SELECT @ActID = Scope_Identity()
UPDATE Act SET ActOnline='<p>If you are not on campus and don''t have access to a computer with Microsoft Word, 
<a href="mailto:Phillip.Senn@my.lr.edu?subject=Microsoft Word">email me</a> so that I can help you complete this assignment.</p>'
WHERE ActID = @ActID
INSERT INTO Question(Question_ActID,QuestionName) VALUES(@ActID,'Question')
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Answer',1)

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

SET @AssignmentStart = '10/27/2014'
SET @AssignmentStop = '11/2/2014 23:59'
exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop
GO


DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Research Paper'
)
DECLARE @Chapter Int = 7
DECLARE @Assignment Int = 13
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Table of Contents'
DECLARE @ActID Int
DECLARE @QuestionID Int
exec ClearAct @ActSort

INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'
A Table Of Contents is such a neat feature in Microsoft Word
that I just had to show you.  Now, I''ve prepped <a href="docx/TOC.docx">this document</a> with things that are in Heading 1 and Heading 2 format.
So that''s how it knows what to use.
<p>'
,@ActSort
,'APA/APA.cfm'
,1
)
SELECT @ActID = Scope_Identity()
UPDATE Act SET ActOnline='<p>If you are not on campus and don''t have access to a computer with Microsoft Word, email me so that I can help you complete this assignment.</p>'
WHERE ActID = @ActID
INSERT INTO Question(Question_ActID,QuestionName) VALUES(@ActID,'Question')
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Answer',1)
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

SET @AssignmentStart = '10/27/2014'
SET @AssignmentStop = '11/2/2014 23:59'
exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop
GO






DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Research Paper'
)
DECLARE @Chapter Int = 7
DECLARE @Assignment Int = 14
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Page Break'
DECLARE @ActID Int
DECLARE @QuestionID Int
exec ClearAct @ActSort

INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES('APA Page break','
Real simple - <a href="docx/InsertPageBreak.docx">insert a page break</a>.'
,@ActSort
,'APA/APA.cfm'
,1
)
SELECT @ActID = Scope_Identity()
UPDATE Act SET ActOnline='
I know what you''re thinking: that this is beneath you.  
Well, at least it validates what you already know.
Honestly though, a lot of people just press enter a bunch of times until they get to the next page.'
WHERE ActID = @ActID
INSERT INTO Question(Question_ActID,QuestionName) VALUES(@ActID,'Question')
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Answer',1)
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
	WHERE CatName='Research Paper'
)
DECLARE @Chapter Int = 7
DECLARE @Assignment Int = 15
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Double-space'
DECLARE @ActID Int
DECLARE @QuestionID Int
exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'
Rule #8.03 of the APA manual says:
<blockquote>
Double-space after every line in the title, headings, footnotes, quotations, references, and figure captions.  
Although you may apply tripe- or quadruple-spacing in special circumstances, such as immediately before and after a displayed equation, 
never use single-spacing or one-and-a-half spacing except in tables or figures.
</blockquote>
The "Select All" shortcut is Ctrl A.
<a href="docx/DoubleSpace.docx">Here''s the assignment</a>.'
,@ActSort
,'APA/APA.cfm'
,1
)


SELECT @ActID = Scope_Identity()
UPDATE Act SET ActOnline='You should double-space even block quotations!  A lot of people forget to do so after they''ve pasted something from an article, or they 
think that a quote stands out better if they single space it, but APA rules say to double-space.'
WHERE ActID = @ActID
INSERT INTO Question(Question_ActID,QuestionName) VALUES(@ActID,'Question')
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Answer',1)
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
	WHERE CatName='Research Paper'
)
DECLARE @Chapter Int = 7
DECLARE @Assignment Int = 16
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Times New Roman'
DECLARE @ActID Int
DECLARE @QuestionID Int
exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'
Rule #8.03 of the APA manual says:
<blockquote>
The use of a uniform typeface and font size enhances readability for the editor and allows the publisher to estimate the article length.  The preferred typeface for APA publications is Times New Roman, with 12-point font size.
</blockquote>
The "Select All" shortcut is Ctrl A.
<a href="docx/TimesNewRoman.docx">Here''s the assignment</a>.'
,@ActSort
,'APA/APA.cfm'
,1
)


SELECT @ActID = Scope_Identity()
UPDATE Act SET ActOnline=''
WHERE ActID = @ActID
INSERT INTO Question(Question_ActID,QuestionName) VALUES(@ActID,'Question')
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Answer',1)
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
	WHERE CatName='Research Paper'
)
DECLARE @Chapter Int = 7
DECLARE @Assignment Int = 17
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Automatic Page Numbering'
DECLARE @ActID Int
DECLARE @QuestionID Int
exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'
Page 230 of the APA manual says:
<blockquote>
Use the automatic functions of your word-processing program to generate headers and page numbers for your file. (Do not type these manuscript page headers repeatedly in your word-processing file.)
</blockquote>
<a href="docx/AutomaticPageNumbering.docx">Here''s the assignment</a>.'
,@ActSort
,'APA/APA.cfm'
,1
)


SELECT @ActID = Scope_Identity()
UPDATE Act SET ActOnline='It''s unfortunate that Microsoft''s example shows a plain number 1, even though you''re on page 2.  
It would make more sense if it had the number 2, but it is what it is.'
WHERE ActID = @ActID
INSERT INTO Question(Question_ActID,QuestionName) VALUES(@ActID,'Question')
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Answer',1)
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
	WHERE CatName='Research Paper'
)
DECLARE @Chapter Int = 7
DECLARE @Assignment Int = 18
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Paste Special'
DECLARE @ActID Int
DECLARE @QuestionID Int
exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'One of my pet peeves is when students turn in research papers that look like ransom notes, with all kinds of fonts from every source they’ve researched.
<a href="docx/PasteSpecial.docx">Here''s the assignment</a>
'
,@ActSort
,'APA/APA.cfm'
,1
)
SELECT @ActID = Scope_Identity()
UPDATE Act SET ActOnline='If there''s 1 thing I want you to learn this mini-term, it''s Paste Special.  Please get this.
As a matter of fact, years from now, if anyone asks you what you learned in csc115, I want you to tell them "Paste Special".'
WHERE ActID = @ActID
INSERT INTO Question(Question_ActID,QuestionName) VALUES(@ActID,'Question')
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Answer',1)
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
SET @AssignmentStop = '11/23/2014 23:59'
exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop
GO


DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Research Paper'
)
DECLARE @Chapter Int = 7
DECLARE @Assignment Int = 19
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Academic Search Complete'
DECLARE @ActID Int
DECLARE @QuestionID Int
exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'
<p>Academic Search Complete is the World''s most valuable scholarly, multi-disciplinary full-text database.</p>
<p>
Find the <strong>full text</strong> of an article about people taking a break from technology.<br>
It might be about a vacation.<br>
It might be about people observing the sabbath. <br>
It might have to do with people living off the grid.<br>
It might be an article about so called third world countries.<br>
Maybe it''s about camping.<br>
Or a major weather incident: Tornadoes, hurricane Sandy, a snow storm.<br>
It might have to do with war: what do people do when the infrastructure of civilization has been destroyed.<br>
Come to think of it, what about a zombie apocalypse? Are there any articles about a zombie apocalypse?<br>
What about people who work in Old Salem or Colonial Williamburg? What are they allowed to use?<br>
<p>
You must find the article using the Academic Search Complete database.
<a href="http://screencast.com/t/yfqlW0FtYA">Here''s a video</a> of me finding a <strong>cover story</strong> on the subject "fair use". It looks like Jing
sped it up, but you can always press the pause button.</p>
Save the article and upload it here.'
,@ActSort
,'APA/APA.cfm'
,1
)


SELECT @ActID = Scope_Identity()
UPDATE Act SET ActOnline='
For the final assignment, I will ask you to quote from the article that you found.
'
--If you do a Google search for a brand new topic (brand new to you), chances are the first result will be a link to Wikipedia - anybody and everybody does that.
--But if you want to specialize in a particular subject, that means that you want to learn
--<em>everything there is to know</em> about that discipline, not limiting yourself to the Wikipedia article. 
--That''s why someone will hire you: because you''ll have done the work that they aren''t willing to do themselves.
--There''s no shame in that - I''m not going to pretend to know anything about your specialty.
--<p>The first part of a true research paper would be to conduct a literature review, where you canvas all the available literature about
--your particular subject.  This reassures the reader that you know what you''re talking about - that you''ve done your homework about this topic.
--<p>"Your joking, right?" I can hear you say. "Like everything in the entire world? Everything?"<br>
--Well, you want to have read about 99% of the available literature, how''s that?  There will always be that 1 article that
--someone''s found that you haven''t seen yet.  But your reaction should be one of incredulity:
--<p>"Oh my goodness!  Where did you find <em>that</em> book, <em>that</em> journal article, <em>that</em> newspaper story,
--<em>that</em> documentary, <em>that</em> speaker, <em>that</em> TED talk, <em>that</em> website?!"<br>
--You <strong>don''t</strong> want your reaction to be:<br>
--"No, I hadn''t read that cause I really don''t care."

WHERE ActID = @ActID
INSERT INTO Question(Question_ActID,QuestionName) VALUES(@ActID,'Question')
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Answer',1)
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
SET @AssignmentStop = '11/23/2014 23:59'
exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop
GO







DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Research Paper'
)
DECLARE @Chapter Int = 7
DECLARE @Assignment Int = 20
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'WorldCat'
DECLARE @ActID Int
DECLARE @QuestionID Int
exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'Find a book in the <a href="http://0-www.nclive.org.library.acaweb.org/cgi-bin/nclsm?rsrc=69">WorldCat database</a> relevant
to your research topic.  Type a quotation from the book into <a href="docx/WorldCat.docx">this Word document</a>.
The very last thing to do, just before the period that ends the sentence is to cite the author like this:
<blockquote>
The defending Iraqi commander later remarked that after losing 2 of his 39 T-72s [tanks] in five weeks of air attack,
the 2d Cavalry had annihilated his entire command in fewer than six minutes in what become known as the Battle of 73 Easting (Scales, 1993).
</blockquote>
In this example, the author is General Robert H. Scales.
So you see, there''s the quotation, but before the puncuation that ends the sentence, 
'
,@ActSort
,'APA/APA.cfm'
,1
)

-- http://blog.apastyle.org/files/block-quotations.pdf

SELECT @ActID = Scope_Identity()
UPDATE Act SET ActOnline='
Do they still print books? Absolutely.  Sometimes even on paper! Small joke - although <a href="http://portables.about.com/od/ebookreasers/a/E-Books-Top-Paper-Books.htm">kind of serious</a>.
You will want to see if there are any books written about your subject.

<a href="http://screencast.com/t/g7a7xe3gXz9M">Here''s a quick video</a> of me finding a book on the topic of "fair use".  
Now, some books will have an excerpt that you can copy/paste,
but not many do.  You may want to use <a href="http://books.google.com">Google books</a> to find a fair use portion of the book online, 
but Google books doesn''t allow you to copy/paste.  <a href="http://screencast.com/t/M35uUVE47QQh">Another video</a>
showing me page through the portion of the book that can legally be shown without violating copyright restrictions.
Now I can hear what you''re thinking: "define relevant".
<p>I remember one time I had a book IRL (In Real Life).  As I held it in my hands, I just thought about how much I really enjoyed this book.
"Some how, some way, I''m going to fit this book into my term paper" I thought to myself.  And you know what?  I did.
What was it?  <a href="https://www.youtube.com/watch?v=6TNeqR_p8Kc">Goose Goofs Off</a>.  Of course, the quote that I chose
was buried in an avalanche of other source material, so it really didn''t matter.
<p>The point is: we bring our life experiences with us when we write, so if a favorite quotation makes its way into your work
that''s ok as long as you attribute it.</p>'
WHERE ActID = @ActID
INSERT INTO Question(Question_ActID,QuestionName) VALUES(@ActID,'Question')
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Answer',1)
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









/*
DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Research Paper'
)
DECLARE @Chapter Int = 7
DECLARE @Assignment Int = 21
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = ''
DECLARE @ActID Int
DECLARE @QuestionID Int
exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES(@ActName,'
We are NOT going to do a research paper for this class.</p>
<p>The course catalog states that students will "write a paper on a selected topic from the course and present it to the class", and we are going to do quite a bit of work on how to write a research paper, but there are not enough credit hours in this class to justify writing the kind of paper you do for all your other classes.</p>
<p>We’re going to go over the APA rules to make sure you know how to format a paper.</p>
<p>The most I will ask you to do is to find an article about an academic topic that you are interested in. I'd prefer it had something to do with technology.  Remember the course description: the legal, the moral, or the ethical ramifications of technology use including security, privacy, health concerns, web use, and intellectual property.</p>
<p>When I was a graduate student, it seemed like every class had an assignment that went along the lines of something like this:</p>
<p>Find something that you’re interested in, research it all semester, write a paper on it and turn it in the last day of class.</p>
<p>That might not be the case for an undergrad, but the graduate level seemed to be more self-directed. And since I was taking two classes per semester, I would find some common ground between the two classes and work on that topic for that semester.  I don’t see anything wrong with that.</p>
<p>What I didn’t do was to take out a paper that I written the previous year, blow the dust off it and turn that back in.  That would have been “self-plagiarism”.</p>
<p>So it’s ok if you find articles for another class that you’re taking this semester. I would just ask that you keep the theme to "perspectives on technology", which shouldn’t be hard because technology is pervasive in practically everything. Or as Marc Andreessen says Software Is Eating The World.</p>
'
,@ActSort
,'OK/OK.cfm'
,1
)



SELECT @ActID = Scope_Identity()
UPDATE Act SET ActOnline=''
WHERE ActID = @ActID
INSERT INTO Question(Question_ActID,QuestionName) VALUES(@ActID,'Question')
SELECT @QuestionID = Scope_Identity();
INSERT INTO Answer(Answer_QuestionID,AnswerName,Correct) VALUES(@QuestionID,'Answer',1)
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

SET @AssignmentStart = '9/1/2014'
SET @AssignmentStop = '9/7/2014 23:59'
exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop
GO
*/