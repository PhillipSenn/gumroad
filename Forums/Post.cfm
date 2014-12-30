<cfscript>
if (IsDefined('form.Save')) {
	new Chat().Save(form.PaperID,form.GuessName)
	location('Post.cfm?ActSort=#url.ActSort#',false)
} else if (IsDefined('url.GuessID')) {
	new Vote().Save(url.GuessID)
	location('Post.cfm?ActSort=#url.ActSort#',false)
}
Paper = new com.Paper().WhereActSort(url)
param name="session.Chat.hideMyChats" default=false;
param name="session.Chat.hideMyUpVotes" default=true;

if (IsDefined('url.hideMyUpVotes')) {
	session.Chat.hideMyUpVotes = url.hideMyUpVotes
}
if (IsDefined('url.hideMyChats')) {
	session.Chat.hideMyChats = url.hideMyChats
}
if (IsDefined('url.OtherUsrID')) {
	session.Chat.OtherUsrID = url.OtherUsrID
	session.Chat.Other = new com.Usr().get(url.OtherUsrID)
} else {
	session.Chat.OtherUsrID = 0
}
Guess = new Chat().WhereGuessDateTimeGT('1/1/1900',session.Chat.OtherUsrID)
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="Chat.css">
<cfinclude template="/Inc/body.cfm">
<table>
	<thead>
		<tr>
			<th>Student</th>
			<th>Chat</th>
			<th class="date">Date</th>
			<th class="time">Time</th>
			<th width="30px">
				<!-- <img src="thumbsUpGrayscale.gif" width="24px"> -->
			</th>
			<th class="num">+</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="Guess">
			<tr>
				<td class="cursorHelp" title="#PersonName#">#FirstName#</td>
				<td>#GuessName#</td>
				<td class="date">#DateFormat(GuessDateTime,"mm/dd")#</td>
				<td class="time">#TimeFormat(GuessDateTime,"hh:mmtt")#</td>
				<td>
					<cfif UsrID EQ session.Usr.UsrID>
					<cfelseif VotedFor>
						<img src="thumbsUp.png" width="24px">
					<cfelse>
						<a href="Post.cfm?ActSort=#url.ActSort#&GuessID=#GuessID#">
						<img src="thumbsUpGrayscale.gif" width="24px">
						</a>
					</cfif>
				</td>
				<td class="num">#Votes#</td>
			</tr>
		</cfloop>
	</tbody>
</table>
<form method="post">
	<fieldset>
		<textarea name="GuessName" autofocus></textarea>
		<p>
			<button type="submit" name="Save">Save</button>
		</p>
		<input type="hidden" name="PaperID" value="#PaperID#">
	</fieldset>
	<div class="checkbox">
		<label>
			<input name="hideMyChats" type="checkbox"
			<cfif session.Chat.hideMyChats>checked</cfif>
			>Hide my chats
		</label>
	</div>
	
	<div class="checkbox">
		<label>
			<input name="hideMyUpVotes" type="checkbox"
			<cfif session.Chat.hideMyUpVotes>checked</cfif>
			>Hide the ones I've read
		</label>
	</div>
	
	<cfif session.Chat.OtherUsrID>
		<div class="checkbox">
			<label>
				<input name="showOther" type="checkbox" checked>
				Show only #session.Chat.Other.FirstName#'s
			</label>
		</div>
	</cfif>
</form>
<div class="modal fade" id="deleteMe" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">Delete this entry?</h4>
			</div>
			<div class="modal-body">
				Are you sure?
			</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal">Close</button>
				<button type="button" name="Delete">Delete</button>
			</div>
		</div>
	</div>
</div>

<cfinclude template="/Inc/foot.cfm">
<input type="hidden" name="UsrID" value="#session.Usr.UsrID#">
<input type="hidden" name="OtherUsrID" value="#session.Chat.OtherUsrID#">
<input type="hidden" name="ActSort" value="#url.ActSort#">
<cfinclude template="/Inc/End.cfm">
</cfoutput>