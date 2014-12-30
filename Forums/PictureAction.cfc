component {

function Save(arg) {
	include '/Inc/newQuery.cfm'
	local.sql = '
	DECLARE @UsrID Int = ?
	UPDATE Paper SET
	 PaperName = ?
	,PaperDesc = ?
	WHERE PaperID = ?
	AND Paper_UsrID = @UsrID
	'
	params = [
		 session.Usr.UsrID
		,arg.PaperName
		,arg.PaperDesc
		,arg.PaperID
	]
	include '/Inc/queryExecute.cfm'
}

function SavePhotoBy(arg) {
	include '/Inc/newQuery.cfm'
	local.sql = '
	DECLARE @UsrID Int = ?
	UPDATE Guess SET
	 GuessName = ?
	,GradeDateTime= null
	WHERE GuessID = ?
	' // and usrid=
	params = [
		 session.Usr.UsrID
		,arg.GuessName
		,arg.GuessID
	]
	include '/Inc/queryExecute.cfm'
}
}
