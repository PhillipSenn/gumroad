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
DECLARE @Assignment Int = 2
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Programming: CSS'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActOnline,ActSort,ActLink,Questions) VALUES(@ActName
,'While HTML conveys the <em>meaning</em>, Cascading Style Sheets (CSS) define the <em>style</em>.
You may want to style all your heading 1s to be a certain size and in a particular font.
And a heading when viewed on a desktop could have a different style when viewed on a mobile phone.
Here are some tutorials that talk about Cascading Style Sheets.
<ul>
	<li><a href="http://www.lynda.com/CSS-training-tutorials/447-0.html">Lynda.com</a> (again)</li>
	<li><a href="https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Getting_Started">Getting Started with CSS</a></li>
	<li><a href="http://pluralsight.com/training/Courses/Find?highlight=true&searchTerm=css">PluralSight</a> (again)</li>
	<li><a href="http://css-tricks.com/">CSS Tricks</a> for advanced topics.</li>
</ul>'
,'Instructions at the bottom.'
,@ActSort
,'Pgm/css/cssIntro.cfm'
,4)
SELECT @ActID = Scope_Identity()

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'The color property'
,'<p>Change the color of every heading 1 tag:</p>
<pre>h1 {
   color:red
}</pre>'
,2
,25
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'You can change the color of every heading 1 tag.'
,1)
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'
color:red is known as a "name value pair".  Color is the name, red is the value.
If we had more name/value pairs to add to the h1 tag, then we would separate them with a semicolon.
For example:
<p>
<pre>h1 {
color:red;
background-color:Azure;
}
</pre>
Here are the 140 colors that you can choose from, and there are millions of colors that can be defined mathematically:
<ul class="list-unstyled">
	<li>AliceBlue</li>
	<li>AntiqueWhite</li>
	<li>Aqua</li>
	<li>Aquamarine</li>
	<li>Azure</li>
	<li>Beige</li>
	<li>Bisque</li>
	<li>Black</li>
	<li>BlanchedAlmond</li>
	<li>Blue</li>
	<li>BlueViolet</li>
	<li>Brown</li>
	<li>BurlyWood</li>
	<li>CadetBlue</li>
	<li>Chartreuse</li>
	<li>Chocolate</li>
	<li>Coral</li>
	<li>CornflowerBlue</li>
	<li>Cornsilk</li>
	<li>Crimson</li>
	<li>Cyan</li>
	<li>DarkBlue</li>
	<li>DarkCyan</li>
	<li>DarkGoldenRod</li>
	<li>DarkGray</li>
	<li>DarkGreen</li>
	<li>DarkKhaki</li>
	<li>DarkMagenta</li>
	<li>DarkOliveGreen</li>
	<li>DarkOrange</li>
	<li>DarkOrchid</li>
	<li>DarkRed</li>
	<li>DarkSalmon</li>
	<li>DarkSeaGreen</li>
	<li>DarkSlateBlue</li>
	<li>DarkSlateGray</li>
	<li>DarkTurquoise</li>
	<li>DarkViolet</li>
	<li>DeepPink</li>
	<li>DeepSkyBlue</li>
	<li>DimGray</li>
	<li>DodgerBlue</li>
	<li>FireBrick</li>
	<li>FloralWhite</li>
	<li>ForestGreen</li>
	<li>Fuchsia</li>
	<li>Gainsboro</li>
	<li>GhostWhite</li>
	<li>Gold</li>
	<li>GoldenRod</li>
	<li>Gray</li>
	<li>Green</li>
	<li>GreenYellow</li>
	<li>HoneyDew</li>
	<li>HotPink</li>
	<li>IndianRed </li>
	<li>Indigo </li>
	<li>Ivory</li>
	<li>Khaki</li>
	<li>Lavender</li>
	<li>LavenderBlush</li>
	<li>LawnGreen</li>
	<li>LemonChiffon</li>
	<li>LightBlue</li>
	<li>LightCoral</li>
	<li>LightCyan</li>
	<li>LightGoldenRodYellow</li>
	<li>LightGray</li>
	<li>LightGreen</li>
	<li>LightPink</li>
	<li>LightSalmon</li>
	<li>LightSeaGreen</li>
	<li>LightSkyBlue</li>
	<li>LightSlateGray</li>
	<li>LightSteelBlue</li>
	<li>LightYellow</li>
	<li>Lime</li>
	<li>LimeGreen</li>
	<li>Linen</li>
	<li>Magenta</li>
	<li>Maroon</li>
	<li>MediumAquaMarine</li>
	<li>MediumBlue</li>
	<li>MediumOrchid</li>
	<li>MediumPurple</li>
	<li>MediumSeaGreen</li>
	<li>MediumSlateBlue</li>
	<li>MediumSpringGreen</li>
	<li>MediumTurquoise</li>
	<li>MediumVioletRed</li>
	<li>MidnightBlue</li>
	<li>MintCream</li>
	<li>MistyRose</li>
	<li>Moccasin</li>
	<li>NavajoWhite</li>
	<li>Navy</li>
	<li>OldLace</li>
	<li>Olive</li>
	<li>OliveDrab</li>
	<li>Orange</li>
	<li>OrangeRed</li>
	<li>Orchid</li>
	<li>PaleGoldenRod</li>
	<li>PaleGreen</li>
	<li>PaleTurquoise</li>
	<li>PaleVioletRed</li>
	<li>PapayaWhip</li>
	<li>PeachPuff</li>
	<li>Peru</li>
	<li>Pink</li>
	<li>Plum</li>
	<li>PowderBlue</li>
	<li>Purple</li>
	<li>Red</li>
	<li>RosyBrown</li>
	<li>RoyalBlue</li>
	<li>SaddleBrown</li>
	<li>Salmon</li>
	<li>SandyBrown</li>
	<li>SeaGreen</li>
	<li>SeaShell</li>
	<li>Sienna</li>
	<li>Silver</li>
	<li>SkyBlue</li>
	<li>SlateBlue</li>
	<li>SlateGray</li>
	<li>Snow</li>
	<li>SpringGreen</li>
	<li>SteelBlue</li>
	<li>Tan</li>
	<li>Teal</li>
	<li>Thistle</li>
	<li>Tomato</li>
	<li>Turquoise</li>
	<li>Violet</li>
	<li>Wheat</li>
	<li>White</li>
	<li>WhiteSmoke</li>
	<li>Yellow</li>
	<li>YellowGreen</li>
</ul>')























INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'The font-size property'
,'<pre>
p {
   font-size:40px
}</pre>
'
,2
,25
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'Let''s change the size of the paragraphs font to be 40 pixels:'
,1)
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'
So now you see that you don''t need to use a heading 1 tag to make something large.
The paragraph tag denotes that this is the body of what we''re writing about.  That''s the semantics of html markup. 
We then decide what <em>size</em>, <em>color</em>, <em>background-color</em>, <em>font</em> and <em><a href="https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration">decorations</a></em>
that we want it to have.')





INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'The font-family property'
,'<p>Let''s change the font-family to Arial:</p>
<pre>h1 {
   	font-family:Arial
}</pre>
'
,3
,25
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'Right now, the heading 1 tag is in Times New Roman because I''ve grown fond of Times New Roman
after grading hundreds of APA Research papers.'
,1)

INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'
<p>Arial is a font without <a href="http://en.wikipedia.org/wiki/Serif">serifs</a>.  
Making computers that could display serifed fonts is something that Steve Jobs talks about in his
<a href="http://youtu.be/VHWUCX6osgM?t=10m50s">commencement speech that he gave to Stanford University</a> in 2005.</p>
But simply naming a font doesn''t guarentee that it will be on every users computer. 
So <a href="https://www.google.com/fonts">Google has loaded hundreds of fonts on their servers</a>
to allow web pages that ability to pull in fonts as needed.
</p>
<p>Let''s say you''re going to be the creator of a startup, and that you''ve got to choose what font you want your company name to be in.
Play around on the Google font page to see if you can find one interesting enough to carry your message.
<blockquote>Maybe the lobster font? Or <a href="http://typecast.com/preview/google/Cabin%20Sketch">Cabin Sketch bold</a>...</blockquote>
Note: Their page is an example of infinite scrolling, where the scrollbar just keeps getting smaller and smaller as you scroll down.
<p>You can enter your own text instead of the Grumpy wizards text.
')




INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'The border property'
,'<p>Copy/Paste all of what you see below and see how it affects the paragraph tags:</p>
<pre>p {
   margin-top:10px;
   padding-top:20px;
   border-top-width:1px;
   border-top-color:black;
   border-top-style:solid;

   margin-right:10px;
   padding-right:20px;
   border-right-width:2px;
   border-right-color:SteelBlue;
   border-right-style:dashed;

   margin-bottom:10px;
   padding-bottom:20px;
   border-bottom-width:3px;
   border-bottom-color:Navy;
   border-bottom-style:dotted;

   margin-left:10px;
   padding-left:20px;
   border-left-width:4px;
   border-left-color:HotPink;
   border-left-style:double;

   border-top-left-radius: 5px;
   border-top-right-radius: 10px;
   border-bottom-right-radius: 15px;
   border-bottom-left-radius: 20px;
}</pre>
'
,4
,25
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'So here are 24 different properties, all variants along the theme of top, right, bottom and left.</p>
Margins go outside the border.  Padding is space within the border. And you see that there are several built-in styles
that are available right out of the box, along with the same color values that you''ve heard about before.
<p>Finally, I''ve defined a different radius for each of the four corners. </p>'
,1)
	
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID,'
So here you see that the css definition for a paragraph tag has lots and lots of name value pairs.
That means that the css definition for a paragraph tag is an object.
<blockquote>An object is a collection of name value pairs.</blockquote>
And our css definition for the paragraph tag had 24 name value pairs.
')


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
select *
from assignment
where Assignment_ActID=@ActID
