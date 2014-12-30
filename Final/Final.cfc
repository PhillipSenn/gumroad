component {

function SavedDocuments() {
	include '/Inc/newQuery.cfm'
	sql = "
	SELECT Attachment,StudentFileName,ActName
	,Max(GuessDateTime) AS GuessDateTime
	,Max(GradeDateTime) AS GradeDateTime
	,Sum(Earned) AS Earned
	FROM GuessView
	WHERE UsrID = ?
	AND Attachment <> ''
	GROUP BY Attachment,StudentFileName,ActName,AssignmentStart,AssignmentStop
	ORDER BY AssignmentStart,AssignmentStop
	"
	params = [
		session.Usr.UsrID
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}