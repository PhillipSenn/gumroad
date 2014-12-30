component {
remote function Save(PaperID,GuessName) returnformat='json' {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @PaperID Int = ?
	INSERT INTO Guess(Guess_PaperID,Guess_AnswerID,GuessName,GuessDateTime) VALUES
	(@PaperID
	,(
		SELECT AnswerID
		FROM AnswerView
		WHERE ActID = (
			SELECT ActID
			FROM PaperView
			WHERE PaperID = @PaperID
		)
	)
	,?
	,getdate()
	)
	SELECT Convert(Varchar,GuessDateTime,127) AS GuessDateTime
	FROM Guess
	WHERE GuessID = Scope_Identity()
	'
	params = [
		 arguments.PaperID
		,arguments.GuessName
	]
	include '/Inc/queryExecute.cfm'
	Application.Chat.DateTime = result.GuessDateTime
	return result
}

remote function WhereGuessDateTimeGT(GuessDateTime,OtherUsrID) returnformat='json' {
	include '/Inc/newQuery.cfm'
	sql = "
	DECLARE @UsrID Int = ?
	DECLARE @GuessDateTime DateTime2 = ?
	DECLARE @OtherUsrID Int = ?
	SELECT
	 PersonName -- 0
	,FirstName -- 1
	,GuessName -- 2
	,Convert(Varchar,GuessDateTime,127) AS GuessDateTime -- 3
	,GuessID -- 4
	,UsrID -- 5
	,isNull(VotedFor,0) AS VotedFor -- 6
	,isNull(Votes,0) AS Votes -- 7
	,GuessComment -- 8
	FROM GuessView
	LEFT JOIN (
		SELECT GuessID AS VotedFor_GuessID
		,1 AS VotedFor
		FROM VoteView
		WHERE Vote_UsrID = @UsrID
	) V
	ON VotedFor_GuessID = GuessID
	LEFT JOIN (
		SELECT
		 Count(*) AS Votes
		,Vote_GuessID
		FROM Vote
		GROUP BY Vote_GuessID
	) Vote
	ON Vote_GuessID = GuessID
	WHERE CourseID = (
		SELECT CourseID
		FROM UsrView
		WHERE UsrID = @UsrID
	)
	AND ActSort=(
		SELECT ActSort
		FROM Act
		WHERE ActName like '%chat%'
	)
	AND GuessDateTime > @GuessDateTime
	"
	if (session.Chat.hideMyUpVotes) {
		sql &= '
		AND VotedFor is null
		'
	}
	if (session.Chat.hideMyChats) {
		sql &= '
		AND UsrID <> @UsrID
		'
	}
	if (arguments.OtherUsrID) {
		sql &= '
		AND UsrID = @OtherUsrID
		'
	}
	sql &= '
	ORDER BY GuessID
	'
	params = [
		 session.Usr.UsrID
		,arguments.GuessDateTime
		,arguments.OtherUsrID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

remote function Delete(GuessID) returnformat='json' {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @GuessID Int = ?
	DELETE FROM Vote
	WHERE VoteID IN(
		SELECT VoteID
		FROM VoteView
		WHERE GuessID = @GuessID
	)
	DELETE FROM Guess
	WHERE GuessID = @GuessID
	'
	params = [
		arguments.GuessID
	]
	include '/Inc/queryExecute.cfm'
	return 0
}
}
