<cfscript>
if (IsDefined('form.Save')) {
	new ResearchTopic().Save(form)
}
ResearchTopic = new ResearchTopics().Approved()
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<p>The final assignment will be a personal philosophy paper having to do with taking a break from technology.
The following are all variations on that theme:
</p>
<table>
	<thead>
		<tr>
			<th class="num">Row</th>
			<th>Research Topic</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="ResearchTopic">
			<tr>
				<td class="num">#currentRow#</td>
				<td>
					<dl>
						<dt>#ResearchTopicName#</dt>
						<dd>#ResearchTopicDesc#</dd>
					</dl>
				</td>
			</tr>
		</cfloop>
	</tbody>
	<!---
	<tfoot>
		<tr>
			<th></th>
			<td>
				<form method="post">
					<input name="ResearchTopicName">
					<textarea name="ResearchTopicDesc"></textarea>
					<p>
						<button name="Save" type="submit">Save</button>
					</p>
				</form>
			</td>
		</tr>
	</tfoot>
	--->
</table>

<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>