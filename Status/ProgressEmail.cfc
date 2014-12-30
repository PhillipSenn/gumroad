component {

function ByDate(arg) {
	include '/Inc/newQuery.cfm'
	sql = "
	DECLARE @UsrID Int = ?

	SELECT CalendarDate,AssignmentStart,AssignmentStop
	,ActName,ActLink,ActSort
	,Earned
	,CatSort
	FROM Calendar
	LEFT JOIN (
		SELECT CatSort,ActName,ActLink,ActSort
		,Earned
		,Convert(Varchar,AssignmentStart,101) AS AssignmentStart
		,Convert(Varchar,AssignmentStop,101) AS AssignmentStop
		FROM AssignmentView
		LEFT JOIN (
			SELECT Paper_AssignmentID
			,Sum(Earned) AS Earned
			FROM GuessView
			WHERE UsrID = @UsrID
			GROUP BY Paper_AssignmentID
		) Guess
		ON Paper_AssignmentID = AssignmentID
		WHERE CourseID = (
			SELECT CourseID
			FROM UsrView
			WHERE UsrID = @UsrID
		)
		AND CatName <> 'Attendance'
	) Assignment
	ON CalendarDate = AssignmentStart
	ORDER BY CalendarDate,AssignmentStop,CatSort,ActName
	"
	params = [
		 arg.UsrID
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}
