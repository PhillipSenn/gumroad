component {

/* Phil: Put this into com.Guess! */
/* Now what about the GuessDateTime? */
remote function Save(GuessID,GuessName) {
	include '/Inc/newQuery.cfm'
	params = [
		 arguments.GuessID
		,arguments.GuessName
	]
	sql = '
	DECLARE @GuessID Int = ?
	UPDATE Guess SET
	 GuessName = ?
	,GuessDateTime = getdate()
	,GradeDateTime = getdate()
	,Earned = (
		SELECT Points
		FROM GuessView
		WHERE GuessID = Guess.GuessID
	)
	WHERE GuessID = @GuessID
	'
	include '/Inc/queryExecute.cfm'

	local.GuessID = arguments.GuessID
	new com.Attendance().Save(local)

	local.LogTableName = 'Guess'
	local.LogFieldName = 'GuessName'
	local.LogVarcharPK = arguments.GuessID
	local.LogVarcharName = arguments.GuessName
	new com.LogVarchar().Save(local)
}

function WhereQuestionSort(arg) {
	include '/Inc/newQuery.cfm'
	params = [
		 session.Usr.UsrID
		,arg.QuestionSort
	]
	sql = '
	DECLARE @UsrID Int = ?
	SELECT *
	FROM GuessView
	WHERE UsrID = @UsrID
	AND ActSort = 50805
	AND QuestionSort = ?
	'
	include '/Inc/queryExecute.cfm'
	return result
}

}