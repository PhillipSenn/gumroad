component {
function WhereCourseSort(CourseSort) {
	include '/Inc/newQuery.cfm'
	sql = "
	DECLARE @CourseSort Int = ?
	SELECT COUNT(*) AS Chats
	,Max(Votes) AS Votes
	,Max(Usrs) AS Usrs
	FROM GuessView
	JOIN (
		SELECT CourseSort AS Vote_CourseSort
		,COUNT(*) AS Votes
		FROM VoteView
		GROUP BY CourseSort
	) Vote
	ON Vote_CourseSort = CourseSort
	JOIN (
		SELECT CourseSort AS Usr_CourseSort
		,COUNT(*) AS Usrs
		FROM UsrView
		GROUP BY CourseSort
	) Usr
	ON Usr_CourseSort = CourseSort
	WHERE ActName like '%chat%'
	AND CourseSort = @CourseSort
	"
	params = [
		arguments.CourseSort
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}
