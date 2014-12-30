component {

function SumByCategory(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @UsrID Int = ?
	DECLARE @FinalStart smalldatetime = ?
	DECLARE @CourseID Int = (
		SELECT CourseID
		FROM UsrView
		WHERE UsrID = @UsrID
	)
	;WITH CTE1 AS(
		SELECT
		 Assignment_ScaleID
		,SUM(Earned) AS Earned
		,CASE WHEN getdate() < AssignmentStop AND getdate() < @FinalStart THEN Sum(Earned) ELSE Count(*)*100 END AS Perfect
		FROM AssignmentView
		LEFT JOIN (
			SELECT
			 Paper_AssignmentID
			,SUM(Earned) AS Earned
			FROM GuessView
			WHERE UsrID = @UsrID
			GROUP BY Paper_AssignmentID
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
		 ,arg.FinalStart
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









/*

function Final() {
	include "/Inc/newQuery.cfm";
	sql = '
	DECLARE @UsrID Int = #Val(session.Usr.qry.UsrID)#;
	SELECT *
	FROM GuessView
	WHERE UsrID = @UsrID
	AND CatName = 'Final '
	AND QuestionName NOT LIKE '%on time%'
	ORDER BY GradeDateTime DESC
	';
	include "/Inc/execute.cfm";
	return result;
}

function Graded() {
	include "/Inc/newQuery.cfm";
	sql = '
	DECLARE @UsrID Int = #Val(session.Usr.qry.UsrID)#;
	SELECT TOP 1 ActName
	FROM GuessView
	WHERE UsrID = @UsrID
	AND GradeDateTime is null
	';
	include "/Inc/execute.cfm";
	return result;
}

function Ranking() {
	include "/Inc/newQuery.cfm";
	sql = "
	DECLARE @CourseID Int = #Val(session.Usr.qry.CourseID)#;
	SELECT UsrView.*
	,isNull(Earned,0) AS Earned
	,isNull(Textbook_Earned,0) AS Textbook_Earned
	,isNull(Forums_Earned,0) AS Forums_Earned
	,isNull(Research_Earned,0) AS Research_Earned
	,isNull(Programming_Earned,0) AS Programming_Earned
	,isNull(Presentation_Earned,0) AS Presentation_Earned
	,isNull(Final_Earned,0) AS Final_Earned
	FROM UsrView
	LEFT JOIN(
		SELECT Paper_UsrID
		,Sum(Earned) AS Earned
		FROM GuessView
		GROUP BY Paper_UsrID
	) Paper
	ON Paper_UsrID = UsrID
	LEFT JOIN(
		SELECT UsrID AS Textbook_UsrID
		,Sum(Earned) AS Textbook_Earned
		FROM GuessView
		WHERE CatName='Textbook'
		GROUP BY UsrID
	) Textbook
	ON Textbook_UsrID = UsrID

	LEFT JOIN(
		SELECT UsrID AS Forums_UsrID
		,Sum(Earned) AS Forums_Earned
		FROM GuessView
		WHERE CatName='Forums'
		GROUP BY UsrID
	) Forums
	ON Forums_UsrID = UsrID

	LEFT JOIN(
		SELECT UsrID AS Research_UsrID
		,Sum(Earned) AS Research_Earned
		FROM GuessView
		WHERE CatName='Research Paper'
		GROUP BY UsrID
	) Research
	ON Research_UsrID = UsrID

	LEFT JOIN(
		SELECT UsrID AS Programming_UsrID
		,Sum(Earned) AS Programming_Earned
		FROM GuessView
		WHERE CatName='Programming'
		GROUP BY UsrID
	) Programming
	ON Programming_UsrID = UsrID

	LEFT JOIN(
		SELECT UsrID AS Presentation_UsrID
		,Sum(Earned) AS Presentation_Earned
		FROM GuessView
		WHERE CatName='Presentation'
		GROUP BY UsrID
	) Presentation
	ON Presentation_UsrID = UsrID

	LEFT JOIN(
		SELECT UsrID AS Final_UsrID
		,Sum(Earned) AS Final_Earned
		FROM GuessView
		WHERE CatName='Final'
		GROUP BY UsrID
	) Final
	ON Final_UsrID = UsrID

	WHERE CourseID = @CourseID
	AND isAdmin=0
	ORDER BY Earned DESC
	";
	include "/Inc/execute.cfm";
	return result;
}
*/
}
