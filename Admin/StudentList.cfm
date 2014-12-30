<cfscript>
Usr = new StudentList().Progress()
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<form action="StudentListSave.cfm">
	<table>
		<thead>
			<tr>
				<th class="num">Row</th>
				<td>
					<input type="checkbox" id="selectAll">
				</td>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Student Name</th>
				<th>Registrar Name</th>
				<th class="date">Last<br>Date</th>
				<th class="num">Progress</th>
			</tr>
		</thead>
		<tbody>
			<cfloop query="Usr">
				<tr>
					<td class="num">#currentRow#</td>
					<td>
						<input type="checkbox" name="UsrIDs" value="#UsrID#">
					</td>
					<td>#FirstName#</td>
					<td>#LastName#</td>
					<td><a href="#request.fw.home#?ID=#GloballyUniqueIdentifier#">#UsrName#</a></td>
					<td>
						<cfif UsrName NEQ PersonName>
							#PersonName#
						</cfif>
					</td>
					<td class="date">#DateFormat(GuessDate,"mm/dd")#</td>
					<td class="num">#Earned#</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
	<p>
		<button type="submit" name="Save">Send</button>
	</p>
	<label for="Subject">Subject:</label>
	<input name="Subject">
	<div id="myTextArea">
		<textarea autofocus name="Body" rows="10">FirstName:
<p>
</p>
<p>
Click here to login
</p></textarea>
	</div>
</form>
<cfinclude template="/Inc/foot.cfm">
<script src="#request.fw.home#/Inc/js/selectAll.js"></script>
<script src="#request.fw.home#/Inc/js/sortable.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>