component {

// I'm updating the GuessDateTime as a start time to show the classmates typing.
function WhereQuestionID(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @GuessID Int = (
		SELECT GuessID
		FROM GuessView
		WHERE UsrID = ?
		AND QuestionID = ?
	)
	DELETE FROM KeyLog
	WHERE KeyLogID IN(
		SELECT KeyLogID
		FROM KeyLogView
		WHERE GuessID = @GuessID
	)
	UPDATE Guess SET GuessDateTime = getdate()
	WHERE GuessID = @GuessID
	SELECT ActName,ActOnline
	,GuessName,GuessID
	,QuestionName,QuestionDesc,QuestionSort
	,AnswerName
	FROM GuessView
	WHERE GuessID = @GuessID
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