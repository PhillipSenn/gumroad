component {

function WhereCourseSort(arg) {
	include '/Inc/newQuery.cfm'
	sql = "
	SELECT *
	FROM GuessView
	WHERE ActName = 'Forum 4: Picture'
--	AND PaperName <> ''
	AND QuestionName like '%who took the photo%'
	AND GuessDateTime is not null
	"
	if (arg.CourseSort) {
		sql &= "AND CourseSort = ?
		"
		params = [
			arg.CourseSort
		]
	}
	sql &= "ORDER BY GuessDateTime DESC
	"
	include '/Inc/queryExecute.cfm'
	return result
}
}
