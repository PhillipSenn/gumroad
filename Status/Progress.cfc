component {

function DetailByCategory() {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @UsrID Int = ?
	SELECT
	 CatName
	,ScaleID,ScaleSort
	,ActName,ActSort,ActLink
	,isNull(Earned,0) AS Earned
	FROM AssignmentView
	LEFT JOIN(
		SELECT
		 Paper_AssignmentID
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
	ORDER BY CatSort,AssignmentStart,AssignmentStop,ActName
	'
	params = [
		  session.Usr.UsrID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

function SumByCategory() {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @UsrID Int = ?
	DECLARE @CourseID Int = (
		SELECT CourseID
		FROM UsrView
		WHERE UsrID = @UsrID
	)
	;WITH CTE1 AS(
		SELECT
		 Assignment_ScaleID
		,SUM(Earned) AS Earned
		,Sum(Perfect) AS Perfect
		FROM AssignmentView
		LEFT JOIN (
			SELECT
			 Paper_AssignmentID
			,SUM(Earned) AS Earned
			,100 AS Perfect
			FROM GuessView
			WHERE UsrID = @UsrID
			GROUP BY Paper_AssignmentID,AssignmentStop,LastDayOfClasses
		) Guess
		ON Paper_AssignmentID = AssignmentID
		WHERE CourseID = @CourseID
		AND (
			AssignmentStop < getdate()
			OR EXISTS(
				SELECT * 
				FROM GuessView
				WHERE UsrID = @UsrID
				AND AssignmentID = AssignmentView.AssignmentID
				AND GradeDateTime is not null
			)
		)
		GROUP BY Assignment_ScaleID,AssignmentStop,FinalStart
	)
	SELECT ScaleView.*
	,isNull(Earned,0) AS Earned
	,isNull(Perfect,0) AS Perfect
	FROM ScaleView
	LEFT JOIN (
		SELECT Assignment_ScaleID
		,Sum(Earned) AS Earned
		,Sum(Perfect) AS Perfect
		FROM Scale
		LEFT JOIN CTE1
		ON Assignment_ScaleID = ScaleID
		GROUP BY Assignment_ScaleID
	) Assignment
	ON Assignment_ScaleID = ScaleID
	WHERE CourseID = @CourseID
	ORDER BY CatSort
	'
	params = [
		  session.Usr.UsrID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

function WhereGradeSortLE(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT *
	FROM Grade
	WHERE CAST(GradeSort AS Decimal(9,2)) <= ?
	ORDER BY GradeSort DESC
	'
	params = [
		 arg.GradeSort
	]
	include '/Inc/queryExecute.cfm'
	return result
}

}
