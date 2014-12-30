component {

function NextQuestion(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT TOP 1 *
	FROM GuessView
	WHERE UsrID = ?
	AND ActID = ?
	AND GuessDateTime IS NULL
	ORDER BY QuestionSort
	'
	params = [
		 session.Usr.UsrID
		,arg.ActID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

function WhereQuestionID(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT *
	FROM AnswerView
	WHERE QuestionID = ?
	ORDER BY AnswerSort,NewID()
	'
	params = [
		arg.QuestionID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

function Save(arg) {
	include '/Inc/newQuery.cfm'
	// Doesn't update if guessed already
	sql = '
	DECLARE @AnswerID Int = ?
	DECLARE @Earned Int = 0
	SELECT @Earned = Points
	FROM AnswerView
	WHERE AnswerID = @AnswerID
	AND Correct=1
	UPDATE Guess SET
	 Guess_AnswerID = @AnswerID
	,GuessDateTime = getdate()
	,GradeDateTime = getdate()
	,Earned = @Earned
	WHERE GuessID = ?
	AND GuessDateTime is null
	'
	params = [
		 arg.AnswerID
		,arg.GuessID
	]
	include '/Inc/queryExecute.cfm'
	return result
}
/*
function UpdateAttendance(arg) {
	include '/Inc/newQuery.cfm'
	// Find the ActID And QuestionID for what was just answered.
	// Find the attedance ActID for this ActID
	// Update Guess for the attendance activity whose QuestionSort is the QuestionID that was just answered.
	sql = '
	DECLARE @UsrID Int = ?
	DECLARE @GuessID Int = ?
	DECLARE @ActID Int
	DECLARE @QuestionID Int
	DECLARE @Att_ActID Int
	DECLARE @Att_GuessID Int
	
	SELECT
	 @ActID = ActID
	,@QuestionID = QuestionID
	FROM GuessView
	WHERE GuessID = @GuessID
	SELECT @Att_ActID = Att_ActID
	FROM Att
	WHERE For_ActID = @ActID

	SELECT @Att_GuessID = GuessID
	FROM GuessView
	WHERE ActID = @Att_ActID
	AND QuestionSort = @QuestionID
	AND UsrID = @UsrID

	UPDATE Guess SET
	 GuessDateTime = getdate()
	,GradeDateTime = getdate()
	WHERE GuessID = @Att_GuessID
	
	UPDATE Guess SET
	 Guess.Earned=Points
	FROM Guess
	JOIN GuessView
	ON Guess.GuessID = GuessView.GuessID
	WHERE Guess.GuessID = @Att_GuessID
	AND DateDiff(hour,getdate(),AssignmentStop) > -23
	'
	// Reminder: QuestionSort = @QuestionID
	params = [
		 session.Usr.UsrID
		,arg.GuessID
	]
	include '/Inc/queryExecute.cfm'
}
*/

}
