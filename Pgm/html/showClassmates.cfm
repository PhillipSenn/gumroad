<cfscript>
include '/Inc/Paper.cfm'
Guess = new com.Pgm().WhereQuestionID(url)
request.fw.container = false
Guesses = new com.Guess().Where("QuestionID",url,"DATEDIFF(second,guessdatetime,gradedatetime)")
</cfscript>

<cfoutput query="Guess">
<cfinclude template="/Inc/html.cfm">
<link href='http://fonts.googleapis.com/css?family=Inconsolata' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="html.css">
<cfinclude template="/Inc/body.cfm">
<form method="post" action="htmlSave.cfm?ActSort=#url.ActSort#">
	<button class="pull-right" name="Save" type="submit">Save</button>
	<div class="row">
		<div class="col-sm-6" id="columnA">
			<fieldset>
				<legend>#ActName#</legend>
				<textarea id="GuessName" name="GuessName" rows="10" autofocus spellcheck="false">#GuessName#</textarea>
				<input type="hidden" name="GuessID" value="#GuessID#">
			</fieldset>
		</div>
		<div class="col-sm-6" id="columnB">
			<fieldset id="result">
				<legend>Result</legend>
				<cfif GuessName EQ "">
					<cfset srcdoc = ActOnline>
				<cfelse>
					<cfset srcdoc = GuessName>
				</cfif>
				<div id="output">#srcdoc#</div>
			</fieldset>
		</div>
	</div>
</form>
<div class="row">
	<div class="col-sm-7">
		<fieldset>
			<legend>Assignment</legend>
			#QuestionDesc#
		</fieldset>
	</div>
	<!---
	<div class="col-sm-5">
		<fieldset id="classmates">
			<legend>Classmates</legend>
		</fieldset>
	</div>
	--->
</div>
<div id="myModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header label-primary">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">#QuestionName#</h4>
      </div>
      <div class="modal-body">
        <p>#AnswerName#</p>
      </div>
      <div class="modal-footer">
        <button id="seeAssignment" type="button" class="btn btn-default" data-dismiss="modal">See Assignment</button>
      </div>
    </div>
  </div>
</div>
<cfinclude template="/Inc/foot.cfm">
<script src="html.js"></script>
<!---
<script src="#request.fw.home#/com/KeyLog.js"></script>
<script src="#request.fw.home#/Inc/js/fw/chr.js"></script>
--->
<ul hidden>
	<cfloop query="Guesses">
		<cfif UsrID NEQ session.Usr.UsrID>
			<li><span class="UsrName">#UsrName#: </span>#GuessName#</li>
		</cfif>
	</cfloop>
</ul>
<cfinclude template="/Inc/End.cfm">
</cfoutput>