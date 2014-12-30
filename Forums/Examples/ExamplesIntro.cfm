<cfscript>
Variables.ActSort = 30601
new com.Paper().Create(Variables) // Chatroom
include '/Inc/Paper.cfm'
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<p>#ActDesc#</p>
I'm going to parse those two sentences down into 10 questions, asking you to give me examples
of each.  Don't worry: follow my lead.
<cfif session.Usr.Online>
	<p>#ActOnline#</p>
</cfif>
<p>Q: Will your answers be posted into the chat room?</p>
<a class="btn" href="Examples.cfm?ActSort=#url.ActSort#">Yes</a>
<a class="btn-warning" href="YesTheyWill.cfm">No</a>
<footer>
	<button class="pull-right btn-info" type="button" data-toggle="modal" data-target=".modal">Help!</button>
</footer>
<div class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header label-primary">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Do you understand the words that are coming out of this keyboard?</h4>
		</div>
		<div class="modal-body">
		<p>Each of the 10 questions will have help buttons in case you have no idea.
		Please provide "an intelligent contribution to scholarship".</p>
		</div>
		<div class="modal-footer">
		<button type="button" data-dismiss="modal">Close</button>
		</div>
		</div>
	</div>
</div>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>