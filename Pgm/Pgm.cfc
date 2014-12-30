component {
function WhereQuestionID(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT *
	FROM GuessView
	WHERE UsrID = ?
	AND QuestionID = ?
	'
	params = [
		 session.Usr.UsrID
		,arg.QuestionID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

function LectureNotes(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT *
	FROM AnswerView
	WHERE QuestionID = ?
	AND correct = 0
	'
	params = [
		 arg.QuestionID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

}
