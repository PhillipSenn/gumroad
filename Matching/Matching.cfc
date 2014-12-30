component {

function Answer(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @UsrID Int = ?
	SELECT *
	FROM AnswerView
	LEFT JOIN (
		SELECT AnswerID AS Guess_AnswerID
		,Earned
		FROM GuessView
		WHERE UsrID = @UsrID
	) Guess
	ON Guess_AnswerID = AnswerID
	WHERE ActID=?
	AND Correct=1
	ORDER BY AnswerName
	'
	params =  [
		 session.Usr.UsrID
		,arg.ActID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

function Question(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @UsrID Int = ?
	SELECT *
	FROM AnswerView
	LEFT JOIN (
		SELECT GuessID
		,QuestionID AS Guess_QuestionID
		,Earned
		,GuessDateTime
		,GradeDateTime
		FROM GuessView
		WHERE UsrID = @UsrID
	) Guess
	ON Guess_QuestionID = QuestionID
	WHERE ActID=?
	AND Correct=1
	ORDER BY GuessID
	'
	params = [
		 session.Usr.UsrID
		,arg.ActID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

remote function Save() returnformat='json' {
	include '/Inc/newQuery.cfm'
	// He chose an AnswerName, but we've got to find the AnswerName that has an Answer_QuestionID=
	sql = '
	DECLARE @GuessID Int = ?
	DECLARE @AnswerID Int = ?
	DECLARE @Earned Int = 0
	SELECT @AnswerID = AnswerID -- This is his true answer to the question
	FROM AnswerView
	WHERE QuestionID = (
		SELECT QuestionID
		FROM GuessView
		WHERE GuessID = @GuessID
	)
	AND AnswerName = (
		SELECT AnswerName
		FROM Answer
		WHERE AnswerID = @AnswerID
	)
	SELECT @Earned = Points -- Now find out what he has won.
	FROM AnswerView
	WHERE AnswerID = @AnswerID
	AND Correct=1
	UPDATE Guess SET
	 Guess_AnswerID = @AnswerID
	,Earned = @Earned
	,GuessDateTime = getdate()
	,GradeDateTime = getdate()
	WHERE GuessID = @GuessID
	'
	// INSERT INTO Wrk(Wrk_GuessID,Wrk_AnswerID) VALUES(@GuessID,@AnswerID)
	params = [
		 arguments.GuessID
		,arguments.AnswerID
	]
	include '/Inc/queryExecute.cfm'

	new com.Attendance().Save(arguments) // The only thing I know is the GuessID
	
	// Return a response so that JavaScript can know how to treat the drop.
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT Earned
	,isNull(SumEarned,0) AS SumEarned
	FROM GuessView
	JOIN (
		SELECT PaperID
		,Sum(Earned) AS SumEarned
		FROM GuessView
		GROUP BY PaperID
	) Total
	ON GuessView.PaperID = Total.PaperID
	WHERE GuessID = ?
	'
	params = [
		arguments.GuessID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

}