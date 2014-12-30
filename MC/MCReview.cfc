component {

function WhereActSort(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @UsrID Int = ?
	SELECT QuestionName,AnswerName,Earned
	,CorrectAnswerName
	FROM GuessView
	JOIN (
		SELECT 
		 QuestionID AS Correct_QuestionID
		,AnswerName AS CorrectAnswerName
		FROM AnswerView
		WHERE Correct=1
	) Correct
	ON Correct_QuestionID = QuestionID
	WHERE UsrID = @UsrID
	AND ActSort = ?
	'
	params = [
		 session.Usr.UsrID
		,arg.ActSort
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}
