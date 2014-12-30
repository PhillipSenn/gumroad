component {

function WherePaperID(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT *
	FROM GuessView
	JOIN XWord
	ON XWord_QuestionID = QuestionID
	WHERE PaperID = ?
	ORDER BY AnswerSort,XWordRow,XWordCol -- Process across first.
	'
	params = [
		arg.PaperID
	]
	include '/Inc/queryExecute.cfm'
	return result
}


remote function Save(GuessIDs,AnswerSort) returnformat="json" {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT *
	FROM GuessView
	WHERE (
		GuessID = ? OR
		GuessID = ?
	)
	AND AnswerSort=?
	'
	params = [
		 ListFirst(arguments.GuessIDs)
		,ListLast(arguments.GuessIDs)
		,arguments.AnswerSort
	]
	include '/Inc/queryExecute.cfm'

	local.PaperID = result.PaperID // used with the score
	local.GuessID = result.GuessID // used with attendance

	sql = '
	UPDATE Guess SET
	 Earned=?
	,GuessDateTime=getdate()
	,GradeDateTime=getdate()
	WHERE GuessID =?
	'
	params = [
		result.Points,result.GuessID
	]
	include '/Inc/queryExecute.cfm'
	new com.Attendance().Save(local) // GuessID

	local.Guess = Score(local) // PaperID
	result.Earned = local.Guess.Earned
	return result
}

function Score(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @PaperID Int = ?
	;WITH CTE1 AS(
		SELECT ActID,Questions,KeepWorkingOnIt
		FROM PaperView
		WHERE PaperID = @PaperID
	)
	,CTE2 AS(
		select Question_ActID
		,count(*) AS Answered
		FROM GuessView
		WHERE PaperID = @PaperID
		AND GuessDateTime is not null
		GROUP BY Question_ActID
	)
	,CTE3 AS(
		select ActID AS Guess_ActID
		,Sum(Earned) AS Earned
		from guessView
		WHERE PaperID = @PaperID
		GROUP BY ActID
	)
	SELECT Earned
	,CASE WHEN KeepWorkingOnIt=1 THEN 
		isNull(Earned,0)
	ELSE
		isNull(100.0*Answered/Questions,0)
	END AS PctComplete 
	,isNull(Answered,0) AS Answered
	,Questions
	FROM CTE1
	LEFT JOIN CTE2
	ON Question_ActID = ActID
	LEFT JOIN CTE3
	ON Guess_ActID = ActID
	'
	params = [
		arg.PaperID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

}

