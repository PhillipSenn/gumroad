component {

function SaveDraft(arg) {
	include '/Inc/newQuery.cfm'
	params = [
		 arg.GuessName
		,arg.GuessID
	]
	sql = '
	UPDATE Guess 
	SET GuessName = ?
	WHERE GuessID = ?
	'
	include '/Inc/queryExecute.cfm'
}

/* I DO update the GuessDateTime because when the rows were inserted, they defaulted to null */
function Save(arg) {
	include '/Inc/newQuery.cfm'
	params = [
		 arg.GuessID
		,arg.GuessName
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
	local.LogTableName = 'Guess'
	local.LogFieldName = 'GuessName'
	local.LogVarcharPK = arg.GuessID
	local.LogVarcharName = arg.GuessName
	new com.LogVarchar().Save(local)
	return result
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