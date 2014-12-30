component {

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
