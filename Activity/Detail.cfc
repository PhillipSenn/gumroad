component {

function WhereGuessDate(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @UsrID Int = ?
	SELECT GuessDateTime,ActName,QuestionName,Earned
	FROM GuessView
	WHERE UsrID = @UsrID
	AND Convert(Varchar,GuessDateTime,101) = ?
	ORDER BY CatSort,GuessDateTime
	'
	params = [
		 session.Usr.UsrID
		,arg.CalendarDate
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}
