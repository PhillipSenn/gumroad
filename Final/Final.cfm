<cfscript>
include '/Inc/Paper.cfm'
totalPoints = 0
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<p>Q: If this is a personal philosophy paper why do we need a bibliography?<br>
A: I tried to find a way for you to write an APA Research paper without it being a real research paper. A real research paper would require a literature review, which was too much to ask for a 1 credit hour class.
</p>
<p>
So I decided to make it a personal philosophy paper but require 2 sources: 1 modern and 1 ancient.
This has the extra benefit of allowing the student to use the personal pronoun "I", whereas a research
paper is all about the subject, not the writer's opinion. I'm more interested in your experience with
taking a day off from technology than reading what others have written.
<p>
<p>Q: Do we write our methods under methods and results under results?<br>
A: Well, every APA Paper has a Methods, Results and Discussion section.
So ours has to also.

But don't try to fit too much into the meaning of the words Methods, Results and Discussion.
They just have to be there because the style of paper is in APA format.
</p>
<p>#ActDesc#</p>
<form method="post" action="FinalAction.cfm" enctype="multipart/form-data">
	<input type="file" name="Attachment">
	<p>
		<button type="submit" name="Save">Save</button>
	</p>
	<input type="hidden" name="PaperID" value="#PaperID#">
</form>
<table>
	<thead>
		<tr>
			<th>Criteria</th>
			<th class="num">Points</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="Guess">
		<cfset totalPoints += Points>
		<tr>
			<td>#QuestionName#</td>
			<td class="num">#Points#</td>
		</tr>
	</cfloop>
	</tbody>
	<tfoot>
		<tr>
			<th>Total</th>
			<th class="num">#totalPoints#</th>
		</tr>
	</tfoot>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>