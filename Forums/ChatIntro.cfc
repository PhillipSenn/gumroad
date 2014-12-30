component {
/*
function maxGuess() {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT isNull(Max(GuessID),0) AS GuessID
	FROM Guess
	'
	include '/Inc/queryExecute.cfm'
	return result
}

function maxVote() {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT isNull(Max(VoteID),0) AS VoteID
	FROM Vote
	'
	include '/Inc/queryExecute.cfm'
	return result
}
*/
function maxGuessDateTime() {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT Convert(Varchar,isNull(Max(GuessDateTime),getdate()),127) AS GuessDateTime
	FROM Guess
	'
	include '/Inc/queryExecute.cfm'
	return result
}

}
