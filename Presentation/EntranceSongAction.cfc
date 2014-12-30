component {

function Save(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @GuessID Int = ?
	UPDATE Guess SET
	 GuessName=?
	,GuessComment=?
	,GuessDateTime = getdate()
	,GradeDateTime = getdate()
	,Earned = (
		SELECT Points
		FROM GuessView
		WHERE GuessID = @GuessID
	)
	WHERE GuessID = @GuessID
	'
	params = [
		 arg.GuessID
		,arg.GuessName
		,arg.GuessComment
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}
