component {
function Save(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @UsrID Int = ?
	DECLARE @PersonID Int = ?

	UPDATE Person SET
	 FirstName = ?
	,LastName = ?
	WHERE PersonID = @PersonID
	UPDATE Usr 
	SET UsrName = ?
	WHERE UsrID = @UsrID
	'
	params = [
		 session.Usr.UsrID
		,session.Usr.PersonID
		,arg.FirstName
		,arg.LastName
		,arg.UsrName
	]
	include '/Inc/queryExecute.cfm'
}

}
