component {

function WhereQuestionSort(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @UsrID Int = ?
	SELECT *
	FROM GuessView
	WHERE UsrID=@UsrID
	AND ActSort=?
	AND QuestionSort=?
	'
	params = [
		 session.Usr.UsrID
		,arg.ActSort
		,arg.QuestionSort
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}
