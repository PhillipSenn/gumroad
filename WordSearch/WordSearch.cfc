component {
// This one uses an UPDATE JOIN.
// returns the SUM(Earned) WHERE PaperID

remote function Save(GuessID) returnformat='json' {
	include '/Inc/newQuery.cfm'
	params = [
		arguments.GuessID
	]
	sql = '
	DECLARE @GuessID Int = ?
	UPDATE Guess SET
	 Guess.Earned=Points
	,Guess.GuessDateTime = getdate()
	,Guess.GradeDateTime = getdate()
	FROM Guess
	JOIN GuessView
	ON Guess.GuessID = GuessView.GuessID
	WHERE Guess.GuessID = @GuessID
	SELECT PaperID,Sum(Earned) AS Earned
	FROM GuessView
	WHERE PaperID =(
		SELECT PaperID
		FROM GuessView
		WHERE GuessID=@GuessID
	)
	GROUP BY PaperID
	'
	include '/Inc/queryExecute.cfm'

	/* Log it */
	local.LogTableName = 'Paper'
	local.LogFieldName = 'Sum(Earned)'
	local.LogIntPK = result.PaperID
	local.LogIntSort   = result.Earned
	new com.LogInt().Save(local)

	new com.Attendance().Save(arguments)
	return result
}

}
