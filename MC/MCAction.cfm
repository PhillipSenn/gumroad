<cfscript>
new MC().Save(form)
new com.Attendance().Save(form)
Paper = new com.Paper().WhereActSort(url) // Progress
Guess = new com.Guess().get(form)
request.fw.ShowProgress = true
Counter = 64
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="MC.css">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<fieldset>
	<legend>Q:</legend>
	#QuestionName#
	<cfloop list="#form.AnswerIDs#" index="A">
		<cfset Answer = new com.Answer().get(A)>
		<cfset Counter++>
		<div class="radio">
			#Chr(Counter)#.
			<cfset myClass = "">
			<cfif AnswerID EQ A>
				<cfif correct>
					<cfset myClass = "label-success">
				<cfelse>
					<cfset myClass = "label-danger">
				</cfif>
			<cfelseif Answer.correct>
				<cfset myClass = "label-success">
			</cfif>
			<label class="#myClass#">
				<input type="radio" name="x"<cfif AnswerID EQ A> checked</cfif>>#Answer.AnswerName#
			</label>
		</div>
	</cfloop>
</fieldset>
<p>
	<a href="MC.cfm?ActSort=#url.ActSort#" class="btn-primary pull-right">Next</a>
</p>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>