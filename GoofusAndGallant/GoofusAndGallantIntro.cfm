<cfscript>
include '/Inc/Paper.cfm'
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<cfif session.Usr.Online OR Now() GT DateAdd('d',1,AssignmentStart)>
	<p>#ActOnline#</p>
</cfif>
<p>#ActDesc#</p>
<p>Are you ready to find Goofus and Gallant?</p>
<a class="btn-primary" href="GoofusAndGallant.cfm?ActSort=#url.ActSort#">Ready!</a>
<p>
	<img src="jpg/Goofus_and_Gallant_by_oogaa.jpg">
</p>
<div class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header label-primary">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Pedagogy for this assignment</h4>
		</div>
		<div class="modal-body">
		<p>Although this is a light-hearted example, the lessons are still the same for more serious research:
		<ul>
			<li>Using the online databases that Lenoir-Rhyne subscribes to</li>
			<li>Using advanced search</li>
			<li>Pulling up the complete article in pdf format.</li>
			<li>Pulling up the text for copying and pasting.</li>
		</ul>
		</p>
		<p>Hopefully, you can enjoy reading these comics with the wry sense of humor that I have!
		After all, people who make computer programming their life's work tend to be more like 
		Goofus than that other guy, what's-his-name.
		</p>
		</div>
		<div class="modal-footer">
		<button type="button" data-dismiss="modal">Close</button>
		</div>
		</div>
	</div>
</div>
<div class="row">
	<button class="btn-info" type="button" data-toggle="modal" data-target=".modal">Pedagogy</button>
</div>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>