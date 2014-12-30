<cfscript>
Paper = new com.Paper().WhereActSort(url)
param name="form.MaxRows" defalt=18;
param name="form.MaxCols" default=18;
Guess = new com.Guess().WherePaperID(Paper)
form.AnswerNames = ValueList(Guess.AnswerName)
form.Questions = ListLen(form.AnswerNames)
request.fw.ShowProgress = true
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="WordSearch.css">
<link rel="stylesheet" href="Print.css"  media="print">
<cfinclude template="/Inc/body.cfm">
<div class="row">
	<div class="col-md-9 table-responsive">
		<table id="Board" class="no-hover no-striped">
			<cfloop from="1" to="#form.MaxRows#" index="row">
				<tr>
				<cfloop from="1" to="#form.MaxCols#" index="col">
					<td>&nbsp;</td>
				</cfloop>
				</tr>
			</cfloop>
		</table>
	</div>
	<div class="col-md-2">
		<ul class="list-unstyled" id="VerticalWords">
			<cfloop query="Guess">
				<li data-guessid="#GuessID#"<cfif Earned> class="label-success"</cfif>>#AnswerName#</li>
			</cfloop>
		</ul>
	</div>
	<div class="col-md-1" id="letters">
		<cfloop from="65" to="90" index="I">
			<div id="Chr#I#" class="btn">#Chr(I)#</div>
		</cfloop>
	</div>
</div>
<div id="HorizontalWords">
	<cfloop from="1" to="#form.Questions#" index="I">
		<div class="fl">
			#ListGetAt(form.AnswerNames,I)#
		</div>
	</cfloop>
</div>
<cfinclude template="/Inc/foot.cfm">
<div hidden>
	<div id="AnswerNames">#form.AnswerNames#</div>
	<div id="Points">#Int(100/Questions)#</div>
	<div id="Remainder">#100 - Int(100/Questions) * Questions#</div>
	<div id="MaxCols">#form.MaxCols#</div>
	<div id="MaxRows">#form.MaxRows#</div>
	<div id="PaperID">#PaperID#</div>
</div>
<script src="#request.fw.home#/Inc/js/fw/int.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/keymaster/1.6.1/keymaster.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>
