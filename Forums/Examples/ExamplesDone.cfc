component {
function AlreadyAnswered(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @UsrID Int = ?
	SELECT *
	FROM AnswerView
	LEFT JOIN(
		SELECT COUNT(*) AS Guesses
		,Guess_AnswerID
		FROM GuessView
		WHERE CourseID = (
			SELECT CourseID
			FROM UsrView
			WHERE UsrID = @UsrID
		)
		AND GuessDateTime is not null
		GROUP BY Guess_AnswerID
	) Guess
	ON Guess_AnswerID = AnswerID
	LEFT JOIN(
		SELECT AnswerID AS myAnswerID
		,GuessName,GuessDateTime
		FROM GuessView
		WHERE UsrID = @UsrID
	) myGuess
	ON myAnswerID = AnswerID
	WHERE ActSort = ?
	'
	params = [
		 session.Usr.UsrID
		,arg.ActSort
	]

	include '/Inc/queryExecute.cfm'
	return result
}

function WhereQuestionID(arg) {
	include '/Inc/newQuery.cfm'
	local.sql = '
	DECLARE @UsrID Int = ?
	SELECT *
	FROM GuessView
	WHERE UsrID = @UsrID
	AND QuestionID = ?
	'
	params = [
		 session.Usr.UsrID
		,arg.QuestionID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

}
