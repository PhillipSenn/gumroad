set nocount on
set statistics time off
set statistics io off
SET ANSI_NULL_DFLT_OFF ON -- All columns default to NOT NULL
DECLARE @CatSort Int = (
  SELECT CatSort 
  FROM CatView 
  WHERE CatName='Programming'
)
DECLARE @Chapter Int = 8
DECLARE @Assignment Int = 5
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'LRopoly Top Row'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES
(@ActName
,'
<blockquote>In this exercise, you are going to change the names of Kentucky, Indiana, Illinois, Atlantic, Ventnor and Marvin Gardens.</blockquote>
<p>Lenoir-Rhyne would like to 
<a href="http://en.wikipedia.org/wiki/List_of_licensed_and_localized_editions_of_Monopoly:_USA">license it''s own variant</a>
of the classic board game Monopoly. It''s up to you to come up with the names of all the properties.
</p>
<p>
Whenever you want to classify a group of items into one category, you assign a "class" to them.
So for instance, every square is in the class="square" category.
<strong>class</strong> is the html keyword, but <em>square</em> is what I made up because, that''s kind of...what..it...is?
The css for what a square should look like is that it''s 9% the width of the screen,
100 pixels tall, and has an outline.</p>
<div>Within a square are two more classes:
<ol>
<li>The property</li>
<li>A header (made up of various colors)</li>
</ol>
So with those, I''ve come up with the <strong>class</strong>es <em>property</em> and <em>bottomHeader, rightHeader, leftHeader, topHeader</em>.
<p>Are you ready to change the names of Kentucky, Indiana, Illinois, Atlantic, Ventnor and Marvin Gardens?</p>
'
,@ActSort
,'Monopoly/MonopolyIntro.cfm'
,1)
SELECT @ActID = Scope_Identity()


INSERT INTO Question(Question_ActID,QuestionName) VALUES(@ActID
,'Change the names of Kentucky, Indiana, Illinois, Atlantic, Ventnor and Marvin Gardens.'
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'<div class="square freeParking">
    <div class="property">FREE PARKING</div>
  </div>
  <div class="square">
    <div class="property">KENTUCKY AVENUE</div>
    <div class="bottomHeader red">&nbsp;</div>non breaking space
  </div>
  <div class="square chance2">
    <div class="property">CHANCE</div>
  </div>
  <div class="square">
    <div class="property">INDIANA AVENUE</div>
    <div class="bottomHeader red">&nbsp;</div>
  </div>
  <div class="square">
    <div class="property">ILLINOIS AVENUE</div>
    <div class="bottomHeader red">&nbsp;</div>
  </div>
  <div class="square railroad3">
    <div class="property">B &amp; O RAILROAD</div>
  </div>
  <div class="square">
    <div class="property">ATLANTIC AVENUE</div>
    <div class="bottomHeader yellow">&nbsp;</div>
  </div>
  <div class="square">
    <div class="property">VENTNOR AVENUE</div>
    <div class="bottomHeader yellow">&nbsp;</div>
  </div>
  <div class="square waterWorks">
    <div class="property">WATER WORKS</div>
  </div>
  <div class="square ">
    <div class="property">MARVIN GARDENS</div>
    <div class="bottomHeader yellow">&nbsp;</div>
  </div>
  <div class="square gotoJail">
    <div class="property">GO TO JAIL</div>
  </div>
</div>
'
,1)
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Free Parking')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Kentucky Avenue')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Chance')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Indiana Avenue')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Illinois Avenue')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'B &amp; O Railroad')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Atlantic Avenue')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Ventnor Avenue')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Water Works')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Marvin Gardens')
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
  WHERE CatName='Programming'
)
DECLARE @Chapter Int = 8
DECLARE @Assignment Int = 6
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'LRopoly left column'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES
(@ActName
,'
Lenoir-Rhyne would like to license it''s own variant of the classic board game Monopoly. It''s up to you to come up with the names of all the properties.
<p>You can see from 
<a href="http://en.wikipedia.org/wiki/List_of_licensed_and_localized_editions_of_Monopoly:_USA">this list of licensed monopoly games in the United States</a>
that everybody''s getting on board.
It''s the Fall of 2014, just before Christmas - we need to come up with our own.
</p>
'
,@ActSort
,'Monopoly/MonopolyIntro.cfm'
,1)
SELECT @ActID = Scope_Identity()
INSERT INTO Question(Question_ActID,QuestionName) VALUES(@ActID
,'Change the names of St. Charles Place, States, Virginia, St. James Place, Tennessee and New York.'
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'<div class="square">
    <span class="rightHeader orange">&nbsp;</span>
    <div class="property">NEW YORK AVENUE</div>
  </div>
  <div class="square">
    <span class="rightHeader orange">&nbsp;</span>
    <div class="property">TENN ESSEE AVENUE</div>
  </div>
  <div class="square communityChest">
    <div class="property">COMMUNITY CHEST</div>
  </div>
  <div class="square">
    <span class="rightHeader orange">&nbsp;</span>
    <div class="property">ST. JAMES PLACE</div>
  </div>
  <div class="square railroad2">
    <div class="property">PENN SYLVANIA RAILROAD</div>
  </div>
  <div class="square">
    <span class="rightHeader pink">&nbsp;</span>
    <div class="property">VIRGINIA AVENUE</div>
  </div>
  <div class="square">
    <span class="rightHeader pink">&nbsp;</span>
    <div class="property">STATES AVENUE</div>
  </div>
  <div class="square electricCompany">
    <div class="property">ELECTRIC COMPANY</div>
  </div>
  <div class="square">
    <span class="rightHeader pink">&nbsp;</span>
    <div class="property">ST. CHARLES PLACE</div>
  </div>
'
,1)
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Just Visiting')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'St. Charles Place')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Electric Company')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'States Avenue')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Virginia Avenue')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Penn sylvania Railroad')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'St. James Place')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Community Chest')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Tennessee Avenue')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'New York Avenue')
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
  WHERE CatName='Programming'
)
DECLARE @Chapter Int = 8
DECLARE @Assignment Int = 7
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'LRopoly right column'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES
(@ActName
,'
<p>On 10/17/2014, I began watching the online course: <a href="http://www.lynda.com/Education-Higher-Education-tutorials/Gamification-Learning/173211-2.html">
Gamification of Learning</a>.
I immediately sat down and started banging out a Monopoly board. Fun!
<p>Are you ready to change the right-hand column?</p>
'
,@ActSort
,'Monopoly/MonopolyIntro.cfm'
,1)
SELECT @ActID = Scope_Identity()
INSERT INTO Question(Question_ActID,QuestionName) VALUES(@ActID
,'Change the names of Pacific, North Carolina, Pennsylvania, Park Place and Boardwalk.'
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'<div class="square">
    <span class="leftHeader green">&nbsp;</span>
    <div class="property">PACIFIC AVENUE</div>
  </div>
  <div class="square">
    <span class="leftHeader green">&nbsp;</span>
    <div class="property">NORTH CAROLINA AVENUE</div>
  </div>
  <div class="square communityChest">
    <div class="property">COMMUNITY CHEST</div>
  </div>
  <div class="square">
    <span class="leftHeader green">&nbsp;</span>
    <div class="property">PENN SYLVANIA AVENUE</div>
  </div>
  <div class="square railroad4">
    <div class="property">SHORT LINE</div>
  </div>
  <div class="square chance3">
    <div class="property">CHANCE</div>
  </div>
  <div class="square">
    <span class="leftHeader blue">&nbsp;</span>
    <div class="property">PARK PLACE</div>
  </div>
  <div class="square luxuryTax">
    <div class="property">LUXURY TAX</div>
  </div>
  <div class="square">
    <span class="leftHeader blue">&nbsp;</span>
    <div class="property">BOARD WALK</div>
  </div>
'
,1)
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Go')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Mediterranean Avenue')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Community Chest')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Baltic Avenue')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Income Tax')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Reading Railroad')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Oriental Avenue')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Chance')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Vermonet Avenue')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Connecticut Avenue')
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
  WHERE CatName='Programming'
)
DECLARE @Chapter Int = 8
DECLARE @Assignment Int = 8
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'LRopoly bottom row'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES
(@ActName
,'
Last but not least. Oh wait. Come to think of it...they are the least, aren''t they?'
,@ActSort
,'Monopoly/MonopolyIntro.cfm'
,1)
SELECT @ActID = Scope_Identity()
INSERT INTO Question(Question_ActID,QuestionName) VALUES(@ActID
,'Change the names of Mediterranean, Baltic, Oriental, Vermont and Connecticut.'
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'<div class="square jail">
    <div class="property">JUST VISITING</div>
  </div>
  <div class="square">
    <div class="topHeader lightBlue">&nbsp;</div>
    <div class="property">CONNECTICUT AVENUE</div>
  </div>
  <div class="square">
    <div class="topHeader lightBlue">&nbsp;</div>
    <div class="property">VERMONT AVENUE</div>
  </div>
  <div class="square chance1">
    <div class="property">CHANCE</div>
  </div>
  <div class="square">
    <div class="topHeader lightBlue">&nbsp;</div>
    <div class="property">ORIENTAL AVENUE</div>
  </div>
  <div class="square railroad1">
    <div class="property">READING RAILROAD</div>
  </div>
  <div class="square">
    <div class="property">INCOME TAX</div>
  </div>
  <div class="square">
    <div class="topHeader purple">&nbsp;</div>
    <div class="property">BALTIC AVENUE</div>
  </div>
  <div class="square communityChest">
    <div class="property">COMMUNITY CHEST</div>
  </div>
  <div class="square">
    <div class="topHeader purple">&nbsp;</div>
    <div class="property">MEDITER- RANEAN AVENUE</div>
  </div>
  <div class="square GO">
    <div class="property">GO</div>
  </div>
'
,1)
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Go To Jail')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Pacific Avenue')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'North Carolina Avenue')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Community Chest')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Penn sylvania Avenue')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Short Line')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Chance')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Park Place')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Luxury Tax')
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'Board walk')
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
  WHERE CatName='Programming'
)
DECLARE @Chapter Int = 8
DECLARE @Assignment Int = 9
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment
select *
from guessView
WHERE ActSort = @ActSort

DECLARE @ActName Varchar(128) = 'LRopoly CSS'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActSort,ActLink,Questions) VALUES
(@ActName
,'Hasbro has taken a look at our board and determined that some of the values need a little tweeking.
<p>
There are 216 web-safe color names, but you can specify any color by choosing an RGB value.
What does RGB stand for? Red, Green, Blue. There are 256 variations of Red, 256 Greens and 256 Blues. 
By putting them all together, you get an RGB value. 0 is every color turned off, so it is black.
White would be every color value turned up to the highest value: 255255255. 
<em>However</em>, computers work in binary, so that number is really
111111111111111111111111 inside the computer.
Here''s a quick rundown of decimal compared to binary compared to hexadecimal:
<div class="row">
	<div class="col-sm-3">
	<table>
	<thead>
	<tr>
		<th>Decimal</th>
		<th>Binary</th>
		<th>Hexadecimal</th>
	</tr>
	</thead>
	<tbody>
	<tr><td>0</td><td>0</td><td>0</td></tr>
	<tr><td>1</td><td>1</td><td>1</td></tr>
	<tr><td>2</td><td>10</td><td>2</td></tr>
	<tr><td>3</td><td>11</td><td>3</td></tr>
	<tr><td>4</td><td>100</td><td>4</td></tr>
	<tr><td>5</td><td>101</td><td>5</td></tr>
	<tr><td>6</td><td>110</td><td>6</td></tr>
	<tr><td>7</td><td>111</td><td>7</td></tr>
	<tr><td>8</td><td>1000</td><td>8</td></tr>
	<tr><td>9</td><td>1001</td><td>9</td></tr>
	<tr><td>10</td><td>1010</td><td>A</td></tr>
	<tr><td>11</td><td>1011</td><td>B</td></tr>
	<tr><td>12</td><td>1100</td><td>C</td></tr>
	<tr><td>13</td><td>1101</td><td>D</td></tr>
	<tr><td>14</td><td>1110</td><td>E</td></tr>
	<tr><td>15</td><td>1111</td><td>F</td></tr>
	<tr><td>16</td><td>10000</td><td>10</td></tr>
	<tr><td colspan="3"><hr></td></tr>
	<tr><td>255</td><td>11111111</td><td>FFF</td></tr>
	</tbody>
</table>
	</div>
</div>
With binary, you only have 1''s and 0''s to work with, so after the number 1, you''re forced to use 10 (pronounced one zero) to represent 2.<br>
With hexadecimal, you have 0 - 9, but then A represents decimal number 10, B=11, C=12, D=13, E=14 and F=15.
Color values are printed in hexadecimal to shorten their representation.
In binary, the color <br>000000010000000100000001 is represented in hexadecimal as 010101.
And <br>111111111111111111111111 is FFFFF in hexadecimal.<br>
<p>
Red is: FF0000<br>
Green is: 00FF00<br>
Blue is: 0000FF
</p>
'
,@ActSort
,'Monopoly/MonopolyIntro.cfm'
,1)
SELECT @ActID = Scope_Identity()


INSERT INTO Question(Question_ActID,QuestionName) VALUES(@ActID
,'Change the Red, Green and Blue colors to ED1B24, 1FB25A and 0072BB.'
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'
.red {
  background-color:#FF0000 /* Change this to ED1B24 */
}
.green {
  background-color:#00FF00 /* Change this to 1FB25A */
}
.blue {
  background-color:#0000FF /* Change this to 0072BB */
}

.purple {
  background-color:#130C5B
}
.lightBlue {
  background-color:#AAE0FA
}
.pink {
  background-color:#D93A96
}
.orange {
  background-color:#F7941D
}
.yellow {
  background-color:#FEF200
}
.square {
  width:9%;
  outline:1px solid black;
  height:100px;
  font-size:16px;
  background-repeat:no-repeat;
  background-position:bottom;
}

.bottomHeader {
  margin-top:35px;
  outline-top:2px solid black;
}

.property:hover {
  cursor:pointer;
  background-color:#3E3433;
  color:white;
}
.bottomHeader:hover, .topHeader:hover, .leftHeader:hover, .rightHeader:hover {
  cursor:pointer;
  background-color:#3E3433;
  color:white;
}
.leftHeader {
  height:100px;
  width:24px;
  float:left;
  margin-right:3px;
  outline-right:2px solid black;
}
.rightHeader {
  height:100px;
  width:24px;
  float:right;
  outline-left:2px solid black;
}
.topHeader {
  outline-bottom:2px solid black;
}
.property {
  margin-left:3px;
}
.communityChest {
  background-image:url(CommunityChest.jpg);
}
.chance1 {
  background-image:url(Chance1.jpg);
}
.chance2 {
  background-image:url(Chance2.jpg);
}
.chance3 {
  background-image:url(Chance3.jpg);
}
.railroad1 {
  background-image:url(RR1.jpg);
}
.railroad2 {
  background-image:url(RR2.jpg);
}
.railroad3 {
  background-image:url(RR3.jpg);
}
.railroad4 {
  background-image:url(RR4.jpg);
}
.electricCompany {
  background-image:url(Electric.jpg);
}
.waterWorks {
  background-image:url(WaterWorks.jpg);
}
.luxuryTax {
  background-image:url(LuxuryTax.jpg);
}
.jail {
  background-image:url(Jail.jpg);
}
.gotoJail {
  background-image:url(gotoJail.jpg);
}
.GO {
  background-image:url(GO.jpg);
}
.freeParking {
  background-image:url(FreeParking.jpg);
}
'
,1)
/*
  background-color:#ED1B24; /* rgb(237,27,36) */
  background-color:#1FB25A; /* rgb(31,178,90) */
  background-color:#0072BB; /* rgb(0,114,187) */
*/


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

