component {

function FirstUnansweredQuestion(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT TOP 1 *
	FROM GuessView
	WHERE PaperID = ?
	AND GuessDateTime is null
	ORDER BY QuestionSort,QuestionID
	'
	params = [
		arg.PaperID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

function Save(arg) {
	include '/Inc/newQuery.cfm'
	sql = "
	DECLARE @UsrID Int = ?
	DECLARE @GuessID Int = ?
	DECLARE @GuessName Varchar(max) = ?
	
	UPDATE Guess SET
	 Earned=10
	,GuessDateTime = getdate()
	,GuessName = @GuessName
	WHERE GuessID=@GuessID

	DECLARE @QuestionDesc Varchar(1024) = (
		SELECT QuestionDesc
		FROM GuessView
		WHERE GuessID=@GuessID
	)

	DECLARE @ActID Int = (
		SELECT ActID
		FROM Act
		WHERE ActName like '%chat%'
	)
	DECLARE @PaperID Int = (
		SELECT PaperID
		FROM PaperView
		WHERE ActID = @ActID
		AND UsrID = @UsrID
	)
	DECLARE @AnswerID Int = (
		SELECT AnswerID
		FROM AnswerView
		WHERE ActID = @ActID
	)
	
	INSERT INTO Guess(Guess_PaperID,Guess_AnswerID,GuessName,GuessDateTime) VALUES(
		 @PaperID
		,@AnswerID
		,'<div><span class=heading>' + @QuestionDesc + '</span></div>' + @GuessName
		,getdate()
	)
	SELECT Convert(Varchar,GuessDateTime,127) AS GuessDateTime
	FROM Guess
	WHERE GuessID = Scope_Identity()
	"
	params = [
		 session.Usr.UsrID
		,arg.GuessID
		,arg.GuessName
	]
	include '/Inc/queryExecute.cfm'
	Application.Chat.DateTime = result.GuessDateTime
}

function Others(arg) {
	include '/Inc/newQuery.cfm'
	sql = "
	SELECT *
	FROM GuessView
	WHERE QuestionID = ?
	AND GuessDateTime is not null
	AND CourseID = ?
	AND GuessName <> ''
	ORDER BY GuessID
	"
	params = [
		 arg.QuestionID
		,session.Usr.CourseID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

}