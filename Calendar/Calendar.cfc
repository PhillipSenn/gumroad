component {

function WhereCourseID(arg) {
	include '/Inc/newQuery.cfm'
	params = [
		 arg.CourseID
	]
	sql = "
	SELECT ActSort,ActLink,ActName
	,AssignmentStart,AssignmentStop
	FROM AssignmentView
	WHERE CourseID = ?
	AND CatName <> 'Attendance'
	"
	include '/Inc/queryExecute.cfm'
	return result
}

}
