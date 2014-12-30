<cfscript>
if (StructKeyExists(form,"Save")) {
	if (form.PaperName == '') {
		request.fw.msg = "Don't forget to copy/paste the text of the article!"
	} else if (!Len(form.Attachment)) {
		request.fw.msg = "Please attach the pdf of the article that you found."
	} else {
		new GoofusAndGallant().UpdatePaperName(form)
		new com.Paper().Upload(form)
		Guess = new com.Guess().Where("PaperID",form.PaperID)
		for (qry in Guess) {
			new com.Attendance().Save(qry)
		}
		location('Gallery.cfm?ActSort=' & form.ActSort,false)
	}
}
Paper = new com.Paper().WhereActSort(url)
Guess = new com.Guess().Where("PaperID",Paper.PaperID,"AnswerID")
totalPoints = 0
for (qry in Guess) {
	totalPoints += qry.Points
}
include '/Inc/StudentPath.cfm'
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<form method="post" enctype="multipart/form-data">
	<table>
		<thead>
			<tr>
				<th class="num">Item</th>
				<th>Description</th>
				<th class="num">Points</th>
			</tr>
		</thead>
		<tbody>
			<cfloop query="Guess">
				<tr>
					<td class="num">#CurrentRow#</td>
					<td>
						#QuestionName#
						<cfif AnswerName NEQ "attachment">
							<br>#AnswerName#
						</cfif>
					</td>
					<td class="num">#Points#</td>
				</tr>
				<cfif FindNoCase("upload it here",QuestionName)>
					<tr>
						<td>&nbsp;</td>
						<td>
							<input type="file" name="Attachment">
							<blockquote><small>Don't forget to press Save after completing this and the next item.</small></blockquote>
							<cfif Attachment NEQ "">
								Here's what you've turned in already:
								<a href="#StudentPath#/#Attachment#">#StudentFileName#</a>
							</cfif>
						</td>
						<td>&nbsp;</td>
					</tr>
				<cfelseif FindNoCase("textarea",QuestionName)>
					<tr>
						<td>&nbsp;</td>
						<td>
							<textarea name="PaperName" rows="6">#PaperName#</textarea>
						</td>
						<td>&nbsp;</td>
					</tr>
				</cfif>
			</cfloop>
		</tbody>
		<tfoot>
			<tr>
				<th>&nbsp;</th>
				<th>Total</th>
				<th class="num">#totalPoints#</th>
			</tr>
		</tfoot>
	</table>
	<p>
		<button type="submit" name="Save">Save</button>
	</p>
	<input type="hidden" name="PaperID" value="#PaperID#">
</form>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>