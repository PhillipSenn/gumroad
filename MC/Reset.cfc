component {

function Save(arg) {
	include '/Inc/newQuery.cfm'
	sql = "
	DECLARE @UsrID Int = ?
	UPDATE Guess SET
	 Earned=0
	,GuessDateTime = null
	WHERE GuessID IN(
		SELECT GuessID
		FROM GuessView
		WHERE UsrID = @UsrID
		AND CatName = 'Research Paper'
		AND ActName like 'Quiz%'
	)
	"
	params = [
		session.Usr.UsrID
	]
	include '/Inc/queryExecute.cfm'
}
}
