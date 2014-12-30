<cfscript>
include '/Inc/Paper.cfm'
request.fw.showProgress = true
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<cfif Paper.PctComplete>
	<div class="row">
		<button type="button" class="btn-primary pull-right" id="Earned" disabled>Earned: #Paper.Earned#</button>
	</div>
</cfif>
<div class="row">
	<table>
	<thead>
		<tr>
			<th>Question</th>
			<th class="num">Date</th>
			<th class="num">Time</th>
			<th class="num">Score</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="Guess">
		<cfset I = FindNoCase('figcaption',QuestionName)>
		<cfif I>
			<cfset J = FindNoCase('/figcaption',QuestionName)>
			<cfset Variables.QuestionName = Mid(QuestionName,I+11,J-I-12)>
		<cfelse>
			<cfset Variables.QuestionName = QuestionName>
		</cfif>
		<cfset x = replace(Variables.QuestionName,'<span class="letters">','(blank)')>
		<cfif Earned>
			<cfset x = Replace(x,'_','<a target="_blank" 
			href="http://books.google.com/books?id=CQ1xnbYcvc8C&lpg=PA515&ots=bAIGM07Skr&dq=discovering%20computers%202013&pg=PA#Ref###v=onepage&q&f=false">#AnswerName#</a>')>
		<cfelse>
			<cfset x = replace(x,'_','(blank)')>
		</cfif>
		<cfset x = replace(x,'_','','all')>
		<cfset x = replace(x,'</span>','')>
		<cfif Left(x,4) EQ "A(n)">
			<cfif !FindNoCase(Left(AnswerName,1),"AEIUO")>
				<cfset x = "A " & Mid(x,6,999)>
			</cfif>
		</cfif>
		<tr>
		<cfif Earned>
			<td class="success">#x#</td>
			<td class="num">
				#DateFormat(GuessDateTime,'m/dd')#
			</td>
			<td class="num">
				#TimeFormat(GuessDateTime,'h:mmtt')#
			</td>
			<td class="num">#Earned#</td>
		<cfelseif GuessName NEQ "">
			<td class="danger">
				<a href="Question.cfm?ActSort=#url.ActSort#&GuessID=#GuessID#">#x#</a>
			</td>
			<td class="num">
				#DateTimeFormat(GuessDateTime,'m/dd')#
			</td>
			<td class="num">
				#TimeFormat(GuessDateTime,'h:nntt')#
			</td>
			<td class="num">#Earned#</td>
		<cfelse>
			<td><a href="Question.cfm?ActSort=#url.ActSort#&GuessID=#GuessID#">#x#</a></td>
			<td colspan="3">&nbsp;</td>
		</cfif>
		</tr>
	</cfloop>
	</tbody>
	</table>
	
</div>
<script>
var clickSound = new Audio('woohoo.wav');
clickSound.play();
</script>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>