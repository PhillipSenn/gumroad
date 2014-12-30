component {
/*
	For the presentation, you get a 0 until I grade it.
	,Earned = (
		SELECT Points
		FROM GuessView
		WHERE GuessID = @GuessID
	)
*/

function Save(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @GuessID Int = ?
	UPDATE Guess SET
	 GuessName=?
	,GuessDateTime = getdate()
	,GradeDateTime = null
	,Earned=0
	WHERE GuessID = @GuessID

	SELECT *
	FROM GuessView
	WHERE UsrID = (
		SELECT UsrID
		FROM GuessView
		WHERE GuessID = @GuessID
	)
	AND ActID = (
		SELECT ActID
		FROM GuessView
		WHERE GuessID = @GuessID
	)
	AND QuestionSort > (
		SELECT QuestionSort
		FROM GuessView
		WHERE GuessID = @GuessID
	)
	ORDER BY QuestionSort
	'
	params = [
		 arg.GuessID
		,arg.GuessName
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}
