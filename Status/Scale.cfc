component {

function WhereScaleID(arg) {
	include '/Inc/newQuery.cfm'
	sql = "
	DECLARE @UsrID Int = ?
	SELECT AssignmentView.*
	,PaperID,GuessID,GuessDateTime
	,Earned
	,CASE WHEN Guess_AssignmentID is null THEN 'Yes' ELSE 'Not Yet' END AS Graded
	FROM AssignmentView
	LEFT JOIN (
		SELECT
		 PaperID
		,Paper_AssignmentID
		,Max(GuessID) AS GuessID
		,Max(GuessDateTime) AS GuessDateTime
		,Sum(Earned) AS Earned
		FROM GuessView
		WHERE UsrID = @UsrID
		GROUP BY PaperID,Paper_AssignmentID
	) Guess
	ON Paper_AssignmentID = AssignmentID
	LEFT JOIN (
		SELECT AssignmentID AS Guess_AssignmentID
		FROM GuessView
		WHERE UsrID = @UsrID
		AND GradeDateTime is null
		GROUP BY AssignmentID
	) NonGraded
	ON Guess_AssignmentID = AssignmentID
	WHERE ScaleID = ?
	AND CourseID = (
		SELECT CourseID
		FROM UsrView
		WHERE UsrID = @UsrID
	)
	ORDER BY AssignmentStop,AssignmentStart,ActSort
	"
	params = [
		 session.Usr.UsrID
		,arg.ScaleID
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}
