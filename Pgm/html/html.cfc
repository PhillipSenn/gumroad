component {

function Save(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @GuessID Int = ?
	UPDATE Guess SET
	 GuessName = ?
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
	]
	include '/Inc/queryExecute.cfm'
	return result
}

function Instructions(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT *
	FROM AnswerView
	WHERE QuestionID = ?
	AND Answersort = 1 
	'
	params = [
		 arg.QuestionID
	]
	include '/Inc/queryExecute.cfm'
	return result
}


remote function SaveDraft(GuessName,GuessID) returnformat='json' {
	include '/Inc/newQuery.cfm'
	sql = "
	DECLARE @GuessID Int = ?
	UPDATE Guess SET GuessName = ?
	WHERE GuessID = @GuessID
	SELECT *
	FROM Guess
	WHERE GuessID = @GuessID
	"
	params = [
		 arguments.GuessID
		,arguments.GuessName // URLEncodedFormat was done in JavaScript
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}
