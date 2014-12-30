<cfscript>
response=new ChatIntro().maxGuessDateTime()
Application.Chat.DateTime = response.GuessDateTime
Paper = new com.Paper().Create(url)
/*
if (!IsDefined('Application.Chat.GuessID')) {
	Guess = new ChatIntro().maxGuess()
	Application.Chat.GuessID = Guess.GuessID
}
if (!IsDefined('Application.Chat.VoteID')) {
	Vote = new ChatIntro().maxVote()
	Application.Chat.VoteID = Vote.VoteID
}
*/
Guess = new com.Guess().Where("PaperID",Paper.PaperID)
if (Guess.recordCount) {
	location('Chat.cfm?ActSort=' & url.ActSort,false)
}
</cfscript>

<cfoutput query="Paper">
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>#ActName#</h1>
<p>#ActDesc#</p>
<a class="btn-primary" href="Chat.cfm?ActSort=#url.ActSort#">Ready!</a>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>