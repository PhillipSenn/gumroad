component {

function Save(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @GuessID Int = ?
	UPDATE Guess SET
	 GuessName=?
	,Earned=0
	,GuessDateTime = getdate()
	,GradeDateTime = null
	WHERE GuessID = @GuessID
	'
	params = [
		 arg.GuessID
		,arg.GuessName
	]
	include '/Inc/queryExecute.cfm'
}
/*
	,Earned = (
		SELECT Points
		FROM GuessView
		WHERE GuessID = Guess.GuessID
	)
*/
}
