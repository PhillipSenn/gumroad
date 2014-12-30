component extends="com" {
Variables.fw.TableName = 'Guess'
Variables.fw.TableSort = 'GuessDateTime DESC'

function Create(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @PaperID Int = ?
	IF NOT EXISTS(
		SELECT GuessID
		FROM GuessView
		WHERE PaperID = @PaperID
	) BEGIN
		INSERT INTO Guess(Guess_PaperID,Guess_AnswerID)
		SELECT TOP #arg.Questions#
		@PaperID
		,AnswerID
		FROM AnswerView
		WHERE ActID = (
			SELECT ActID
			FROM PaperView
			WHERE PaperID=@PaperID
		)
		AND Correct=1
		ORDER BY NewID()
	END
	SELECT *
	FROM GuessView
	WHERE GuessID IN(
		SELECT Max(GuessID)
		FROM GuessView
		WHERE PaperID=@PaperID
		GROUP BY QuestionID
	)
	ORDER BY QuestionSort,QuestionID
	'
	params = [
		arg.PaperID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

function WherePaperID(arg) { // WordSearch.cfm
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT *
	FROM GuessView
	WHERE PaperID=?
	ORDER BY QuestionSort,QuestionID,AnswerSort,AnswerID,GuessID
	'
	params = [
		arg.PaperID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

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


/* I don't update the GuessDateTime because it's used as a start time to show the classmates typing. */
function Save(arg) {
	include '/Inc/newQuery.cfm'
	params = [
		 arg.GuessID
		,arg.GuessName
	]
	sql = '
	DECLARE @GuessID Int = ?
	UPDATE Guess SET
	 GuessName = ?
	,GradeDateTime = getdate()
	,Earned = (
		SELECT Points
		FROM GuessView
		WHERE GuessID = Guess.GuessID
	)
	WHERE GuessID = @GuessID
	'
	include '/Inc/queryExecute.cfm'
	local.LogTableName = Variables.fw.TableName
	local.LogFieldName = 'GuessName'
	local.LogVarcharPK = arg.GuessID
	local.LogVarcharName = arg.GuessName
	new com.LogVarchar().Save(local)
	return result
}

function ResetWherePaperID(arg) {
	sql = '
	DECLARE @PaperID Int = ?
	UPDATE Guess SET
	 Earned=0
	,GradeDateTime = null
	WHERE Guess_PaperID = @PaperID
	SELECT *
	FROM GuessView
	WHERE PaperID = @PaperID
	'
	params = [
		arg.PaperID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

function UpdateGradeDateTimeWherePaperID(arg) {
	// Now that Earned has posted, update the GradeDateTime
	sql = '
	DECLARE @PaperID Int = ?
	UPDATE Guess 
	SET GradeDateTime = getdate()
	WHERE Guess_PaperID = @PaperID
	AND GradeDateTime is null
	'
	params = [
		arg.PaperID
	]
	include '/Inc/queryExecute.cfm'
}

function WhereActSort(arg) {
	include '/Inc/newQuery.cfm'
	params = [
		 session.Usr.UsrID
		,arg.ActSort
	]
	sql = '
	DECLARE @UsrID Int = ?
	SELECT *
	FROM GuessView
	WHERE UsrID = @UsrID
	AND ActSort = ?
	'
	include '/Inc/queryExecute.cfm'
	return result
}

}
