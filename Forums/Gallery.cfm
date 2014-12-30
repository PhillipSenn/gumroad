<cfscript>
param name="form.CourseSort" default=0;
Guess = new Gallery().WhereCourseSort(form)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="Gallery.css">
<cfinclude template="/Inc/body.cfm">
<p>Section #form.CourseSort#</p>
<cfloop query="Guess">
	<cfset StudentPath = request.fw.home & '/Students/' 
		& CourseName
		& '.' & CourseSort
		& '/' & Replace(PersonName,' ','','all')>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">#PaperName#</h3>
		</div>
		<div class="panel-body">
			<img src="#StudentPath#/#Attachment#" width="500">
			<p>#PaperDesc#</p>
		</div>
		<div class="panel-footer">
			<div>#UsrName#
				<br>Section #CourseSort#
			</div>
			<div class="right">
				<span class="photoby">Photo by: </span>
				#GuessName#
			</div>
		</div>
	</div>
</cfloop>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>