component {

function WhereActID(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @UsrID Int = ?
	SELECT GuessName,GuessComment,DisplayName,FirstName
	FROM GuessView
	WHERE ActID=?
	AND CourseID=(
		SELECT CourseID
		FROM UsrView
		WHERE UsrID=@UsrID
	)
	AND GuessDateTime is not null
	AND UsrID <> @UsrID
	ORDER BY GuessDateTime DESC
	'
	params = [
		 session.Usr.UsrID
		,arg.ActID
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}
