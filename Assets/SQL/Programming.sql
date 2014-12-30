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
DECLARE @Assignment Int = 1
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Programming: HTML'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActOnline,ActSort,ActLink,Questions) VALUES
(@ActName
,'HTML is the language of the World Wide Web. A Google search for anything html specific will
bring up <a href="http://www.w3schools.com/tags/tryit.asp?filename=tryhtml_headers">w3 schools</a>,
and there are tons of other resources available as well:
<ul>
	<li><a href="http://www.lynda.com/HTML-tutorials/HTML-Essential-Training-2012/99326-2.html">Lynda.com</a></li>
	<li><a href="http://www.codecademy.com/">Code Academy</a></li>
	<li><a href="http://pluralsight.com/training/courses/TableOfContents?courseName=html-fundamentals&highlight=matt-milner_html-fundamentals-m1-text!matt-milner_html-fundamentals-m3-lists!matt-milner_html-fundamentals-m4-tables!matt-milner_html-fundamentals-m2-links!matt-milner_html-fundamentals-m0-intro*1!matt-milner_html-fundamentals-m5-images##html-fundamentals-m1-text">PluralSight</a></li>
	<li><a href="//html5rocks.com">HTML5 Rocks</a> for advanced topics.</li>
</ul>
<p>I''m just going to teach you a smattering of html, but you could have a whole career around being an html developer.</p>'
,'As you type code on the left, the result will appear here.'
,@ActSort
,'Pgm/html/htmlIntro.cfm'
,10)
SELECT @ActID = Scope_Identity()


INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'The heading 1 tag'
,'<p>Type the following into the HTML textbox above:</p>
	<pre>&lt;h1>Test&lt;/h1>This is a test.</pre>'
,1
,10
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'&lt;h1> is an HTML tag.  It''s the code that the computer
sees to interpret that this is a heading instead of the normal body of text.
You wrap your heading inside of an &lt;h1>&lt;/h1> pair of tags.'
,1)
INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID
,'There are six heading tags: 
<h1>&lt;h1>This is heading 1&lt;/h1></h1>
<h2>&lt;h2>This is heading 2&lt;/h2></h2>
<h3>&lt;h3>This is heading 3&lt;/h3></h3>
<h4>&lt;h4>This is heading 4&lt;/h4></h4>
<h5>&lt;h5>This is heading 5&lt;/h5></h5>
<h6>&lt;h6>This is heading 6&lt;/h6></h6>
Although very rarely would you use more than 1 or 2.
<p>And you can see that although you might type text on the same
line as the heading tag, it is automatically placed on the next line down.
The heading tags are known as <a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Block-level_elements">block level</a> elements.
')

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'The paragraph tag'
,'<p>Copy/Paste the following into the html textbox above:</p>
&lt;h1>Lorem ipsum&lt;/h1><br>
&lt;p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p><br>
&lt;p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p><br>
'
,2
,10
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'We''ve learned about the heading tags 1 through 6, now let''s add a couple of paragraphs.
Paragraphs begin with &lt;p> and end in &lt;/p>. The text will automatically respond to the screen size,
so it doesn''t matter how many spaces or line breaks you put into a paragraph.  Line breaks and extra spaces
are removed, rendering the content as cleanly as possible.'
,1)

INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID
,'<p>So what is <a href="http://en.wikipedia.org/wiki/Lorem_ipsum">Lorem Ipsum</a>? Personally, I think that
it was when printers were worried of publishing something that might be offensive, so they threw together some latin, which
no one would be able to understand. Lorem Ipsum is used so often now that there are 
<a href="http://mashable.com/2013/07/11/lorem-ipsum/">variants</a>.</p>
<p>What will be your Lorem Ipsum? There will be many times where you''ll need slug text to fill in an empty space
where the true content will be supplied later by a Subject Matter Expert (SME).  What will you use as text in those times?</p>
<h3>Responsive Web Design</h3>
If you''ll resize this screen, you''ll see that the text is responsive - it responds to the shape of the screen.
	HTML was originally written to accomodate different screen sizes.  But then along came images.<br>
	And mouse rollovers.<br>
	And iPads.<br>
	And wearable computing, like watches.<br>
')

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'The anchor tag'
,'<p>Compose an anchor tag that goes to your favorite website. Here''s how to do it step by step:
<p hidden class="animate">&lt;a href="http://www.Google.com">click here&lt;/a></p>
<table>
	<tr><td>&lt;a</td><td>The beginning of the anchor tag</td></tr>
	<tr><td>&lt;a href=</td><td>The hypertext reference attribute</td></tr>
	<tr><td>&lt;a href="http://www.Google.com"</td><td>The url of the website</td></tr>
	<tr><td>&lt;a href="http://www.Google.com"></td><td>The end of the beginning</td></tr>
	<tr><td>&lt;a href="http://www.Google.com">click here</td><td>The human readable part</td></tr>
	<tr><td>&lt;a href="http://www.Google.com">click here&lt;</td><td>The beginning of the end</td></tr>
	<tr><td>&lt;a href="http://www.Google.com">click here&lt;/a></td><td>Whalla</td></tr>
</table>
<p>Or, putting it another way:</p>
<table>
	<tr><td>&lt;a>click here&lt;/a></td><td>Just like a paragraph tag</td></tr>
	<tr><td>&lt;a href="">click here&lt;/a></td><td>place the href</td></tr>
	<tr><td>&lt;a href="http://www.Google.com">click here&lt;/a></td><td>paste the url</td></tr>
</table>
'
,3
,10
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'It begins with &lt;a> and ends with &lt;/a>, just like the heading tags and the paragraph tag.
But the anchor tag includes an attribute called the href (I''ve heard it pronounced H-ref and HUH-ref.  I personally like just calling it H-ref).
So let''s say you wanted a link that said "click here".  You would type &lt;a>click here&lt/a>. But
you''d have to supply an href to tell the browser where here is, so the end result would really be something like:
&lt;a href="http://www.lr.edu">click here&lt;a></p>'
,1)

INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID
,'<p>It''s hard to overstate how important the anchor tag is.</p>
The ability to <a href="//www.youtube.com/embed/QH2-TGUlwu4?t=4s&autoplay=1">link to another page</a>
has revolutionized education. It is on a par with the invention of the written word itself.')

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'The unordered list tag'
,'<p>Write a todo list into the html textbox above using the following format:</p>
&lt;ul><br>
&lt;li>Get out of bed&lt;/li><br>
&lt;li>Brush teeth&lt;/li><br>
&lt;li>Eat breakfast&lt;/li><br>
&lt;li>Go to class&lt;/li><br>
&lt;li>Do homework&lt;/li><br>
&lt;li>Go to bed.&lt;/li><br>
&lt;/ul>
'
,4
,10
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'<p>&lt;ul> is used to start a list.  Each list item is wrapped in an &lt;li>&lt;/li> tag.
All the &lt;li>&lt;/li> tags are wrapped inside either a &lt;ul>&lt;/ul> or &lt;ol>&lt;/ol>.
</p>'
,1)

INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID
,'<p>If you change the ul to ol then it becomes an ordered list.
Lists are used for a number of things - they''re not necessarily listed vertically down the page.
A list can also run horizontally across the page, like in a navigation menu.
But that''s the job of Cascading Style Sheets (CSS).</p>
')

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'The img tag'
,'<p>Type the following into the HTML textbox above:</p>
&lt;img src="LRBear.gif">
'
,5
,10
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'<p>There''s no closing tag with an image because there''s no need for one.</p>'
,1)

INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID
,'Images are either .gif or .jpg.  .gif is for things with relatively few colors, like
something made by a person.  .jpg are photographs - millions of colors.')

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'The canvas element'
,'<p>Let''s create a canvas element that is 400x200:</p>
<pre>
&lt;canvas width="400" height="200">
&lt;/canvas>
</pre>'
,6
,10
)
select @QuestionID = Scope_Identity()

INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'There''s not much to tell about the canvas element.
It creates an invisible frame inside of the page upon which you will draw using JavaScript.'
,1)

INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID
,'Just like a real blank canvas - it doesn''t make a whole lot of sense until an artist starts painting on top of it.
And we use JavaScript to paint onto canvas. I can''t wait.
')

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'The table tag'
,'<p>Enter the following:</p>
<pre>
&lt;table border="1">
   &lt;thead>
      &lt;tr>
         &lt;th>Heading 1&lt;/th>
         &lt;th>Heading 2&lt;/th>
      &lt;/tr>
   &lt;/thead>
   &lt;tbody>
      &lt;tr>
         &lt;td>Table Data 1&lt;/td>
         &lt;td>Table Data 2&lt;/td>
      &lt;/tr>
      &lt;tr>
         &lt;td>Table Data 3&lt;/td>
         &lt;td>Table Data 4&lt;/td>
      &lt;/tr>
   &lt;/tbody>
   &lt;tfoot>
      &lt;tr>
         &lt;th>Footer 1&lt;/th>
         &lt;th>Footer 2&lt;/th>
      &lt;/tr>
   &lt;/tfoot>
&lt;/table>
</pre>
'
,7
,10
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'I''m going to throw a lot in on this line item because they all work within the table tag.
So you got your thead, your tbody, your tfoot...
And then inside of those, you got your table rows (tr) and table data (td) and table headings (th).'
,1)

INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID
,'Even though all I had you do was copy/paste that code, I think it''s pretty clear what each of the
tags are doing.  You define a table row with a &lt;tr> tag, table data with a &lt;td> tag,
table headings inside of rows that are within the &lt;thead> tag with a &lt;th> of their own,
and footers are also &lt;th>, but inside of a &lt;tfoot> tag.
<p>Typically tables are used to display lots of data coming from a database.</p>
')

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'The link tag'
,'<p>Enter the following:</p>
<pre>
&lt;link rel="stylesheet" href="myBlueBackground.css">
</pre>
'
,8
,10
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'We''ll learn about Cascading Style Sheets (css) next week, but
in order to use them, we need the link tag.
It''s what''s used to keep everything from piling up into one large html file.
We write our css in a separate file and pull it into the <code>head</code> section of the document.
The rest of the html will go into the <code>body</code> section.
The same css file can be used by multiple html pages. They just have to link to it.'
,1)


INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID
,'Here''s what was in myBlueBackground.css:
<p class="pre">body {
   background-color:LightSteelBlue;
}
</p>
<p>And here''s what the page looks like:
<p class="pre">&lt;html>
<code>&lt;head></code>
&lt;link rel="stylesheet" href="myBlueBackground.css">
&lt;/head>
<code>&lt;body></code>
&lt;/body>
&lt;/html>

')

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'The script tag'
,'<p>Enter the following script tag.</p>
<pre>
&lt;script src="HelloWorld.js">&lt;/script>
</pre>
When you do, it will execute a little JavaScript program to display an alert box.'
,9
,10
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'Just like the link tag is used to pull in your Cascading Style Sheets (css), the script tag
is what''s used to pull in your JavaScript program from another file.'
,1)


INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID
,'Here''s what was in the JavaScript file:
<pre>alert(''Hello World!'')</pre>
<p>When I first got into computer programming in 1976, my teacher instructed me to print "Hello World" as my first program.
I didn''t realize at the time that this was the standard greeting used whenever learning a new language.</p>')


INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'Putting it all together'
,'<dl>
<dt>Heading 1:</dt>
<dd>Objectives of this Text, e-Book and CourseMate Web Site</dd>
<dt>Paragraph: (from <a href="http://books.google.com/books?id=CQ1xnbYcvc8C&lpg=PP1&pg=PP11#v=onepage&q&f=false">Google books</a>)</dt>
<dd>
Essentials is intended for use as a stand-alone solution or in combination with an applications,
Internet, or programming textbook in a full-semester introductory computer course.
No experience with computers is assumed. The objectives of this offering are to:
</dd>
<dt>List:</dt>
<dd>
<ul>
<li>Present the most-up-to-date technology in an ever-changing discipline.</li>
<li>Give students an in-depth understanding of why computers are essential in business and society.</li>
<li>Teach the fundamentals of and terms associated with computers and mobile devices, the Internet, programs and apps, and digital safety and security.</li>
</ul>
</dd>
<dt>And a link to CourseMate:</dt>
<dd><a href="http://www.cengage.com/coursetechnology">http://www.cengage.com/coursetechnology</a></dd>
<dt>Oh! And we found a picture too, so make sure you include:</dt>
<dd>LRBear.jpg</dd>
</dl>
'
,10
,10
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'<p>The authors of 
<a href="http://www.cengage.com/search/productOverview.do?Ntt=discovering+computers||41135116946520316217554343021086115906&N=16&Ntk=APG%7C%7CP_EPI&Ntx=mode%2Bmatchallpartial">the textbook</a>
would like to put it the following on their website:
<p>'
,1)


INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID
,'I copied this table from <a href="http://www.w3schools.com/tags/">w3schools</a> but
only kept the tags that I use on a regular basis.  
You don''t need to memorize these tags - I''m just showing you in case you''re interested.
I know, I know: <em><a href="https://www.youtube.com/watch?v=y7S0kiFVqqE&feature=youtu.be&t=2m18s">discarded</a></em>.
<table class="reference notranslate">
<tbody><tr>
<th style="width:25%">Tag</th>
<th>Description</th>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_a.asp">&lt;a&gt;</a></td>
	<td>Defines a hyperlink</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_blockquote.asp">&lt;blockquote&gt;</a></td>
	<td>Defines a section that is quoted from another source</td>
</tr>
<tr>
<td><a href="http://www.w3schools.com/tags/tag_body.asp">&lt;body&gt;</a></td>
<td>Defines the document''s body</td>
</tr>
<tr>
<td><a href="http://www.w3schools.com/tags/tag_br.asp">&lt;br&gt;</a></td>
<td>Defines a single line break</td>
</tr>
<tr>
<td><a href="http://www.w3schools.com/tags/tag_button.asp">&lt;button&gt;</a></td>
<td>Defines a clickable button</td>
</tr>
<tr>
	<td class="html5badge"><a href="http://www.w3schools.com/tags/tag_canvas.asp">&lt;canvas&gt;</a></td>
	<td>Used to draw graphics, on the fly, via scripting (usually JavaScript)</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_div.asp">&lt;div&gt;</a></td>
	<td>Defines a section in a document</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_em.asp">&lt;em&gt;</a></td>
	<td>Defines emphasized text&nbsp;</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_fieldset.asp">&lt;fieldset&gt;</a></td>
	<td>Groups related elements in a form</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_form.asp">&lt;form&gt;</a></td>
	<td>Defines an HTML form for user input</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_hn.asp">&lt;h1&gt; to &lt;h6&gt;</a></td>
	<td> Defines HTML headings</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_head.asp">&lt;head&gt;</a></td>
	<td>Defines information about the document</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_hr.asp">&lt;hr&gt;</a></td>
	<td> Defines a thematic change in the content</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_html.asp">&lt;html&gt;</a></td>
	<td>Defines the root of an HTML document</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_img.asp">&lt;img&gt;</a></td>
	<td>Defines an image</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_input.asp">&lt;input&gt;</a></td>
	<td>Defines an input control</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_label.asp">&lt;label&gt;</a></td>
	<td>Defines a label&nbsp;for an &lt;input&gt; element</td>
</tr>
<tr>
<td><a href="http://www.w3schools.com/tags/tag_legend.asp">&lt;legend&gt;</a></td>
<td>Defines a caption for a &lt;fieldset&gt; element</td>
</tr>
<tr>
<td><a href="http://www.w3schools.com/tags/tag_li.asp">&lt;li&gt;</a></td>
<td>Defines a list item</td>
</tr>
<tr>
<td><a href="http://www.w3schools.com/tags/tag_link.asp">&lt;link&gt;</a></td>
<td>Defines the relationship between a document and an external resource (most 
used to link to style sheets)</td>
</tr>
<tr>
	<td class="html5badge"><a href="http://www.w3schools.com/tags/tag_main.asp">&lt;main&gt;</a></td>
	<td>Specifies the main content of a document</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_meta.asp">&lt;meta&gt;</a></td>
	<td>Defines metadata about an HTML document</td>
</tr>
<tr>
	<td class="html5badge"><a href="http://www.w3schools.com/tags/tag_nav.asp">&lt;nav&gt;</a></td>
	<td>Defines navigation links</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_ol.asp">&lt;ol&gt;</a></td>
	<td>Defines an ordered list</td>
</tr>
<tr>
<td><a href="http://www.w3schools.com/tags/tag_optgroup.asp">&lt;optgroup&gt;</a></td>
<td>Defines a group of related options in a drop-down list</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_option.asp">&lt;option&gt;</a></td>
	<td>Defines an option in a drop-down list</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_p.asp">&lt;p&gt;</a></td>
	<td>Defines a paragraph</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_pre.asp">&lt;pre&gt;</a></td>
	<td>Defines preformatted text</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_script.asp">&lt;script&gt;</a></td>
	<td>Defines a client-side script</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_select.asp">&lt;select&gt;</a></td>
	<td>Defines a drop-down list</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_span.asp">&lt;span&gt;</a></td>
	<td>Defines a section in a document</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_strong.asp">&lt;strong&gt;</a></td>
	<td>Defines important text</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_table.asp">&lt;table&gt;</a></td>
	<td>Defines a table</td>
</tr>
<tr>
<td><a href="http://www.w3schools.com/tags/tag_tbody.asp">&lt;tbody&gt;</a></td>
<td>Groups the body content in a table</td>
</tr>
<tr>
<td><a href="http://www.w3schools.com/tags/tag_td.asp">&lt;td&gt;</a></td>
<td>Defines a cell in a table</td>
</tr>
<tr>
<td><a href="http://www.w3schools.com/tags/tag_textarea.asp">&lt;textarea&gt;</a></td>
<td>Defines a multiline input control (text area)</td>
</tr>
<tr>
<td><a href="http://www.w3schools.com/tags/tag_tfoot.asp">&lt;tfoot&gt;</a></td>
<td>Groups the footer content in a table</td>
</tr>
<tr>
<td><a href="http://www.w3schools.com/tags/tag_th.asp">&lt;th&gt;</a></td>
<td>Defines a header cell in a table</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_thead.asp">&lt;thead&gt;</a></td>
	<td>Groups the header content in a table</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_title.asp">&lt;title&gt;</a></td>
	<td>Defines a title for the document</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_tr.asp">&lt;tr&gt;</a></td>
	<td>Defines a row in a table</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_ul.asp">&lt;ul&gt;</a></td>
	<td>Defines an unordered list</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_comment.asp">&lt;!--...--&gt;</a></td>
	<td>Defines a comment</td>
</tr>
<tr>
	<td><a href="http://www.w3schools.com/tags/tag_doctype.asp">&lt;!DOCTYPE&gt;</a>&nbsp;</td>
	<td>Defines the document type</td>
</tr>
</tbody>
</table>
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
GO






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
DECLARE @Assignment Int = 3
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Programming: JavaScript'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActOnline,ActSort,ActLink,Questions) VALUES
(@ActName
,'<p>The inspiration for this assignment came from watching 
<a href="https://learnable.com/hub/play/4">this 30 minute video</a>.
In it, Mims Wright points to the <a href="https://github.com/mimshwright/jsGameDemo">source code here</a>.
</p>
<p>I''ve tried really hard to reduce his presentation down even further, to the most basic commands necessary.
</p>
'
,'Instructions are at the bottom.'
,@ActSort
,'Pgm/js/kbIntro.cfm'
,5)
SELECT @ActID = Scope_Identity()


INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'Keyboard events'
,'<p>Copy the following 4 lines of code into the textarea and then click somewhere to move the focus off
the text area.  You can now move the little guy around with the arrow keys.</p>
<pre>if (key.isPressed(37)) player.left = player.left - 10
if (key.isPressed(38)) player.top = player.top - 10
if (key.isPressed(39)) player.left = player.left + 10
if (key.isPressed(40)) player.top = player.top + 10
</pre>
'
,1
,20
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'I''m using a library called <a href="https://github.com/madrobby/keymaster">keymaster</a>
because it allows you to easily determine if two keys are being pressed at the same time. According
to the documentation:
<blockquote>At any point in time, you can query the <code>key object</code> for the state of any keys.</blockquote>
<table>
	<thead>
		<tr>
			<th>So when the <code>key object</code> is...</th>
			<th>You know that they''re holding down the:</th>
		</tr>
	</thead>
	<tbody>
	<tr>
		<td>37</td>
		<td>left arrow</td>
	</tr>
	<tr>
		<td>38</td>
		<td>up arrow</td>
	</tr>
	<tr>
		<td>39</td>
		<td>right arrow</td>
	</tr>
	<tr>
		<td>40</td>
		<td>down arrow</td>
	</tr>
	</tbody>
</table>'
,1)

INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID
,'Yay! It works! But it needs some improvement. There''s nothing to keep you from going outside the boundaries.
Libraries like keymaster are often used in programming, especially JavaScript development. Someone makes a lot 
of effort to solve a problem like checking to see which key is being pressed, and they encapsulate that
into a function. If you know <a href="http://cdnjs.com/">which functions are written</a>, you 
can just pull them in from a Content Delivery Network (cdn).
Another cdn that I just learned about is: <a href="http://www.jsdelivr.com/">jsDelivr.com</a>.
')


INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'Boundaries'
,'<pre>if (key.isPressed(37)) player.left = player.left - 10
if (key.isPressed(38)) player.top = player.top - 10
if (key.isPressed(39)) player.left = player.left + 10
if (key.isPressed(40)) player.top = player.top + 10

if (player.left < 0) player.left = 0
if (player.top < 0) player.top = 0
if (player.left > 400 - player.width) player.left = 400 - player.width
if (player.top > 300 - player.height) player.top = 300 - player.height
</pre>
'
,2
,20
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'An image is (usually) drawn beginning at the top-left and going across like you do when you read.
So player.left is the left-most vector of the player and player.top is the top-most vector. 
Where the two intersect is the top-left starting point.
<p>Copy the following program into the textarea and press Save.</p>'
,1)

INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID
,'Ah, that''s better.  If the player''s left is less than zero, then we make it zero.  The same with his top position.
Determining whether you''ve gone too far to the right or down is a bit tricker however.
<p>If the player''s left plus his width is greater than the width of the canvas, then stop him.  
If the player''s top plus his height is greater than the height of the canvas, then stop him.')


INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'requestAnimationFrame'
,'<p>Paste the following code into the textarea:</p>
<pre>player.left=0
player.top=100
obstacle.left = 0
obstacle.top = 0

draw()
function draw() {
	checkKeyboard()
	canvas.fillStyle = "white"
	canvas.fillRect(0,0,400,300)
	
	canvas.drawImage(player.img, player.left, player.top)
	canvas.fillStyle = "DarkGoldenrod"
	canvas.fillRect(obstacle.left, obstacle.top, 20, 20)
	
	obstacle.left = obstacle.left - 3
	if (obstacle.left < 0) {
		obstacle.left = 400
		obstacle.top = Math.random()*300
	}
	requestAnimationFrame(draw)
}
</pre>
'
,3
,20
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'

We''re going to examine looping now.
<p>So what is this thing?
The draw function is called when the page initially loads, starting the whole thing off.

The draw function first checks the keyboard to see if any of the arrow keys have been pressed,
then it erases the canvas by drawing a white rectangle from left 0, top 0 to left 400, top 300.
<br>It draws the player at 0,100 because player.left=0 and player.top=100.
<br>Next it''s going to draw a 20x20 square using the "DarkGoldenrod" color at 0,0.
<br>It subtracts 3 from the obstacle''s left property.
<br>Then it checks to see if the left is less than 0.
<br>If it is, then it assigns the value of 400 to it, which makes it appear on the right side of the screen.
<br>And it also assigns a random x value to put it somewhere else going up and down.
<br>requestAnimationFrame(draw) means: the next time the computer can animate another frame (usually in 1/30 of a second),
call the draw function again.
'
,1)


INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID
,'So now we''ve added an obstacle, a DarkGoldenrod 20x20 pixel square. The program draws the canvas and requests
a new animation frame.  When it gets a new animation frame event back from the browser, it calls the draw function again.
This keeps happening at roughly 30 frames per second (fps).
We''re moving the DarkGoldenrod square 3 pixels per animation frame. 
To speed things up, press back, and change the number of pixels that it moves per frame.
Remember that it''s a 20x20 square, so if you change it to move 20 pixels per frame, then
you''ll see a better representation of how many frames are being displayed.')


--INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
--,'fillText'
--,'
--Paste the following code into the textarea:
--<pre>
--canvas.font = "72px Times New Roman"
--var counter = 0
--function draw() {
--	canvas.fillStyle = "white";
--	canvas.fillRect(0,0,400,300);

--    counter = counter + 1
--	canvas.fillStyle = "black"
--	canvas.fillText(counter, 100, 300)
--	requestAnimationFrame(draw)
--}
--draw()
--</pre>
--'
--,4
--,20
--)
--select @QuestionID = Scope_Identity()
--INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
--,'Wow, that''s fast, isn''t it?'
--,1)


INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'Collision Detection'
,'<pre>player.left=0
player.top=100
obstacle.left = 0
obstacle.top = 0
draw()
function draw() {
	checkKeyboard()
	canvas.fillStyle = "white"
	canvas.fillRect(0,0,400,300)
	
	canvas.fillStyle = "DarkGoldenrod"
	canvas.fillRect(obstacle.left, obstacle.top, 20, 20)
	canvas.drawImage(player.img, player.left, player.top)
	
	// These are the 7 lines for collision detection:
	if (player.left + player.width <= obstacle.left) {
	} else if (player.left >= obstacle.left + 20) {
	} else if (player.top + player.height <= obstacle.top) {
	} else if (player.top >= obstacle.top + 20) {
	} else {
		obstacle.left = 0
	}

	obstacle.left = obstacle.left - 3
	if (obstacle.left < 0) {
		obstacle.left = 400
		obstacle.top = Math.random()*300
	}
	requestAnimationFrame(draw)
}
</pre>
'
,4
,20
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'<p>Remember when we worried about colliding into walls? The same thing except now we have to worry about all the sides of the obstacle.</p>
<p>There''s a lot to copy/paste here, but I''ve only added a few lines of code.  The others were in the previous exercise:</p>
<table>
<thead>
	<tr>
		<th>If/Then</th>
		<th>Meaning</th>
		<th>Result</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>if (player.left + player.width <= obstacle.left) {</td>
		<td>if the player plus his width is less than or equal to the obstacle, the player is to the left of the obstacle.</td>
		<td>left</td>
	</tr>
	<tr>
		<td>} else if (player.left >= obstacle.left + 20) {</td>
		<td>if the player is greater than or equal to the obstacle plus it''s width...</td>
		<td>right</td>
	</tr>
	<tr>
		<td>} else if (player.top + player.height <= obstacle.top) {</td>
		<td>if the player plus his height is less than or equal to the obstacle...</td>
		<td>above</td>
	</tr>
	<tr>
		<td>} else if (player.top >= obstacle.top + 20) {</td>
		<td>if the player''s top is greater than or equal to the obstacle plus it''s height...</td>
		<td>below</td>
	</tr>
</tbody>
</table>
'
,1)

INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID
,'OK, you can run into it from the left, from the right, from the top and from the bottom.  And all these instances
are examined every time a new animation frame is drawn.
')

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'Sounds'
,'<pre>draw()
function draw() {
	checkKeyboard()
	canvas.fillStyle = "white"
	canvas.fillRect(0,0,400,300)
	
	canvas.fillStyle = "DarkGoldenrod"
	canvas.fillRect(obstacle.left, obstacle.top, 20, 20)
	canvas.drawImage(player.img, player.left, player.top)
	
	if (player.left + player.width <= obstacle.left) {
	} else if (player.left >= obstacle.left + 20) {
	} else if (player.top + player.height <= obstacle.top) {
	} else if (player.top >= obstacle.top + 20) {
	} else {
		obstacle.left = 0
		<span class="label-info">Oscillator.play(100,200)</span>
	}

	obstacle.left = obstacle.left - 3
	if (obstacle.left < 0) {
		obstacle.left = 400
		obstacle.top = Math.random()*300
	}
	requestAnimationFrame(draw)
}
</pre>
'
,5
,20
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'<p>It''s getting more complicated, isn''t it?
I''ve added an object called Oscillator.
It contains a function called "play" that takes 2 parameters: duration and frequency.
<p>All of this is the same code as before, except now I''ve added a line to play
for 100 milliseconds (.1 seconds) at a frequency of 200 hertz (hz) when the player
runs into the DarkGoldenrod block.</p>'
,1)


INSERT INTO Answer(Answer_QuestionID,AnswerName) VALUES(@QuestionID
,'Play also takes a callback as a 3rd parameter.  What that means is: after it''s done
playing the first note, it will call another function. That way you can string together
one note after another.')

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
DECLARE @Assignment Int = 4
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Programming: Web Components'
DECLARE @ActID Int
DECLARE @QuestionID Int

select CourseSort,UsrName,*
from guessView
where actSort=@ActSort
and isAdmin=0

exec ClearAct @ActSort
INSERT INTO Act(ActName,ActDesc,ActOnline,ActSort,ActLink,Questions) VALUES
(@ActName
,'Web components are said to be <a href="https://developers.google.com/events/io/sessions/318907648">a Tectonic Shift for Web Development</a>.
Thems pretty strong words. <a href="http://component.kitchen/">Component kitchen</a> is a catalog of web components.<br>
The makers of <a href="http://www.polymer-project.org/">Polymer</a> say that it "makes it easier and faster to create anything from a button to a complete application."<br>
And <a href="http://customelements.io/">Custom Elements</a> is "a web components gallery for modern web apps".
They rate components using a stars system, which is helpful if you want to prioritize and see the
ones that are the most popular.
'
,'Instructions are at the bottom.'
,@ActSort
,'Pgm/WebComponents/WebComponentIntro.cfm'
,4)
SELECT @ActID = Scope_Identity()


INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'clock-face'
,'There''s no &lt;clock-face>&lt;/clock-face> in html.
But I read that <a href="http://component.kitchen/components/clock-face">someone wrote one</a>.
<p>
1. Paste the following into the css part of the page:
<pre>&lt;link rel="stylesheet" href="<a href="clock-face.css">clock-face.css</a>"></pre>
2. Paste the following into the HTML part of the page:
<pre>&lt;clock-face>&lt;/clock-face></pre>
3. Paste the following into the JavaScript part of the page:
<pre>&lt;script src="<a href="clock-face.js">clock-face.js</a>">&lt;/script>
&lt;script src="<a href="CustomElements/custom-elements.js">custom-elements.js</a>">&lt;/script>
</pre>
</p>
</pre>
'
,1
,25
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'clock-face is great, isn''t it?  But right away you''re wondering "Can you change this to that?"
Very rarely can you plug in a component and have it work exactly like you want it to.
But then again, some components are so complicated, that you''re just thankful to have them at all.
'
,1)


INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'Google Maps'
,'Let''s add a Google Map to our site.
<p>Paste this into the css portion:</p>
<pre>&lt;link rel="stylesheet" href="<a href="GoogleMap.css">GoogleMap.css</a>"></pre>
<p>And Paste this in the html portion:</p>
<pre>&lt;<a href="http://googlewebcomponents.github.io/google-map/components/google-map/">google-map</a> latitude="35.739811" longitude="-81.32661">&lt;/google-map></pre>
<p>And finally, this into the JavaScript portion:</p>
<pre>
&lt;script src="platform.js">&lt;/script>
&lt;link rel="import" href="<a href="GoogleWebComponents/google-map/google-map.txt">google-map.html</a>">
</pre>
'
,2
,25
)
-- &lt;link rel="import" href="GoogleWebComponents/google-map/google-map-directions.html">

select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'So what is this doing? We''re loading a special JavaScript file called polymer.
It''s so common that it''s up on a Content Delivery Network called cdnjs.
The other two .html pages are simply required by Google, so you gotta include ''em if you want Google maps.
<p>We give it just enough css to display it and then as long as we know about the <a href="https://github.com/GoogleWebComponents">google web component</a>,
we just supply the parameters and bam!'
,1)


INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'How about a voice player?'
,'The <a href="http://zenorocha.github.io/voice-elements/">Voice elements demonstration page</a> shows how to install a couple of web components.
Paste the following into the html portion:
<pre>&lt;voice-player accent="en-US" autoplay text="
Hello #UsrName#!
">&lt;/voice-player>
</pre>
<p>And paste the following into the JavaScript portion:</p>
<pre>
&lt;script src="platform.js">&lt;/script>
&lt;link rel="import" href="voice-player.html">
</pre>
'
,3
,25
)
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'Valid accents are:
<ul>
	<li>en-US</li>
	<li>en-GB</li>
	<li>es-ES</li>
	<li>fr-FR</li>
	<li>it-IT</li>
	<li>de-DE</li>
	<li>ja-JP</li>
	<li>ko-KR</li>
	<li>zh-CN</li>
</ul>
'
,1)

INSERT INTO Question(Question_ActID,QuestionName,QuestionDesc,QuestionSort,Points) VALUES(@ActID
,'Voice Recognition'
,'This one will ask your permission before turning your microphone on.
Paste the following into the html portion:
<pre>&lt;voice-recognition id="recognition-element">&lt;/voice-recognition>
&lt;form id="recognition-form">
	&lt;textarea id="recognition-input">&lt;/textarea>
	&lt;button name="Save" type="submit">Start listening&lt;/button>
&lt;/form>
</pre>
And paste the following into the JavaScript text area:
<pre>&lt;script src="platform.js">&lt;/script>
&lt;link rel="import" href="voice-recognition.html">
&lt;script>
form = document.querySelector(''#recognition-form'')
input = document.querySelector(''#recognition-input'')
element = document.querySelector(''#recognition-element'')

form.addEventListener(''submit'', function(e) {
    e.preventDefault()
    element.start()
})

element.addEventListener(''result'', function(e) {
    input.textContent = e.detail.result
})
&lt;/script>
</pre>
'
,4
,25
)
/*<script>
var form = document.querySelector('#recognition-form'),
    input = document.querySelector('#recognition-input'),
    element = document.querySelector('#recognition-element');

form.addEventListener('submit', function(e) {
    e.preventDefault();
    element.start();
});

element.addEventListener('result', function(e) {
    input.textContent = e.detail.result;
});
</script>


*/
select @QuestionID = Scope_Identity()
INSERT INTO Answer(Answer_QuestionID,AnswerName,correct) VALUES(@QuestionID
,'<p>After you click on the Start Listening button, your browser will ask
for your permission to turn your microphone on.  Say something!
It takes a few seconds to parse, but remember, it has to go to the server and back.</p>
<p>And once you exit the page, the mic goes off.</p>
<p>
<a href="https://www.youtube.com/watch?v=yxxRAHVtafI">Behind the Mic: The Science of Talking with Computers</a></p>
<p>So what about the NSA?  Can they turn on your microphone without your consent?</p>'
,1)

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






select * from att
select * from act
select * from Paper
select * from guess
select * from question
select * from answer
select * from assignment
select * from term
