component {

remote function Save(GuessID) returnformat='json' {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @VoteID Int
	DECLARE @Earned Int
	DECLARE @TotalEarned Int
	DECLARE @UsrID Int = ?
	DECLARE @GuessID Int = ?
	INSERT INTO Vote(Vote_UsrID,Vote_GuessID) VALUES(@UsrID,@GuessID);
	SELECT @VoteID=Scope_Identity()
	,@Earned=COUNT(*)
	FROM VoteView
	WHERE GuessID = @GuessID
	UPDATE Guess SET Earned=@Earned
	WHERE GuessID=@GuessID

	SELECT @TotalEarned = Sum(Earned)
	FROM GuessView
	WHERE PaperID = (
		SELECT PaperID
		FROM GuessView
		WHERE GuessID = @GuessID
	)
	IF @TotalEarned > 100 BEGIN
		UPDATE Guess
		SET Earned = 100 - @TotalEarned + Earned
		WHERE GuessID = @GuessID
	END
	SELECT Convert(Varchar,VoteDateTime,127) AS VoteDateTime
	FROM Vote
	WHERE VoteID = @VoteID
	'
	params = [
		 session.Usr.UsrID
		,arguments.GuessID
	]
	include '/Inc/queryExecute.cfm'
	Application.Chat.DateTime = result.VoteDateTime
	return result // not used
}
/*
remote function WhereVoteIDGreaterThan(VoteID) returnformat='json' {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT
	 VoteID
	,GuessID
	,Votes
	FROM VoteView
	JOIN (
		SELECT GuessID X
		,COUNT(*) AS Votes
		FROM VoteView
		GROUP BY GuessID
	) Vote
	ON X = GuessID
	WHERE VoteID IN(
		SELECT Max(VoteID)
		FROM VoteView
		WHERE VoteID > ?
		GROUP BY GuessID
	)
	ORDER BY VoteID
	'
	params = [
		arguments.VoteID
	]
	include '/Inc/queryExecute.cfm'
	return result
}
*/





remote function WhereVoteDateTimeGT(VoteDateTime) returnformat='json' {
	include '/Inc/newQuery.cfm'
	// Phillip: Get the TOTAL VOTES for each guess that has been voted on since the last time we checked.
	// These votes are for GuessIDs - it doesn't matter if they're chats or top 10s.
	sql = '
	DECLARE @UsrID Int = ?
	SELECT
	 GuessID
	,Votes
	,isNull(VotedFor,0) AS VotedFor
	FROM GuessView
	JOIN (
		SELECT Vote_GuessID
		,COUNT(*) AS Votes
		FROM VoteView
		GROUP BY Vote_GuessID
	) Vote
	ON Vote_GuessID = GuessID
	LEFT JOIN (
		SELECT
		 GuessID AS VotedFor_GuessID
		,1 AS VotedFor
		FROM VoteView
		WHERE Vote_UsrID = @UsrID
	) V
	ON VotedFor_GuessID = GuessID
	WHERE GuessID IN(
		SELECT DISTINCT GuessID
		FROM VoteView
		WHERE VoteDateTime > ?
	)
	'
	// todo? if (session.Chat.hideMyUpVotes) sql &= ' AND Vote_UsrID <> ?' session.Usr.UsrID (just an efficiency that's not needed)
	params = [
		 session.Usr.UsrID
		,arguments.VoteDateTime
	]
	include '/Inc/queryExecute.cfm'
	return result
}

}
