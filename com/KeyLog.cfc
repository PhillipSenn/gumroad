component {

remote function Save(GuessID,KeyLogSort) returnformat='json' {
	include '/Inc/newQuery.cfm'
	params = [
		 arguments.GuessID
		,arguments.KeyLogSort
	]
	sql = '
	INSERT INTO KeyLog(KeyLog_GuessID,KeyLogSort) VALUES(?,?)
	'
	include '/Inc/queryExecute.cfm'
}

remote function WhereGuessID(GuessID) returnformat='json' {
	include '/Inc/newQuery.cfm'
	params = [
		 session.Usr.UsrID
		,arguments.GuessID
	]
	sql = '
	DECLARE @UsrID Int = ?
	SELECT 
	 UsrID,UsrName
	,KeyLogSort
	,Datediff(millisecond,GuessDateTime,KeyLogDateTime) AS Elapsed
	FROM KeyLogView
	WHERE QuestionID = (
		SELECT QuestionID
		FROM GuessView
		WHERE GuessID = ?
	)
	AND (KeyLogSort = 8 OR KeyLogSort >= 32)
	AND UsrID <> @UsrID
	ORDER BY Datediff(millisecond,GuessDateTime,KeyLogDateTime)
	'
	include '/Inc/queryExecute.cfm'
	return result
}
}
