component {

function Progress() {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @UsrID Int = ?
	SELECT UsrID,FirstName,LastName,UsrName,PersonName,GloballyUniqueIdentifier,Earned
	,GuessDate
	FROM UsrView
	LEFT JOIN (
		SELECT Paper_UsrID
		,Sum(Earned) AS Earned
		,max(GuessDateTime) AS GuessDate
		FROM GuessView
		GROUP BY Paper_UsrID
	) Guess
	ON Paper_UsrID = UsrID
	WHERE CourseID = (
		SELECT CourseID
		FROM UsrView
		WHERE UsrID = @UsrID
	)
	ORDER BY LastName,FirstName
	'
	params = [
		session.Usr.UsrID
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}
