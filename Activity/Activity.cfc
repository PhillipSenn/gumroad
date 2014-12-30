component {

remote function Accumulated() returnformat='json' {
	include '/Inc/newQuery.cfm'
	local.sql = '
	DECLARE @UsrID Int = #Val(session.Usr.UsrID)#
	DECLARE @CourseID Int = #Val(session.Usr.CourseID)#
	DECLARE @TermStart DateTime
	DECLARE @Students Int = 0
	SELECT @Students=COUNT(*) 
	FROM UsrView
	WHERE CourseID=@CourseID
	AND UsrID <> @UsrID
	AND isAdmin=0
	
	SELECT @TermStart=min(TermStart)
	FROM Term
	
	;WITH CTE3 AS(
		SELECT
		CAST(isNull(GradeDateTime,GuessDateTime) AS Date) AS Course_Date
		,Earned AS Course_Earned
		FROM GuessView
		WHERE CourseID=@CourseID
		AND UsrID <> @UsrID
		AND isAdmin=0
	)
	,CTE4 AS(
		SELECT Course_Date
		,DatePart(DAY,Course_Date) AS Day
		,DatePart(MONTH,Course_Date) as Month
		,DateDiff(d,@TermStart,Course_Date) AS Counter
		,SUM(Course_Earned)/@Students AS Average
		FROM CTE3
		GROUP BY Course_Date
	)
	,CTE1 AS(
		SELECT
		CAST(isNull(GradeDateTime,GuessDateTime) AS Date) AS Usr_Date
		,Earned AS Usr_Earned
		FROM GuessView
		WHERE UsrID = @UsrID
	)
	,CTE2 AS(
		SELECT Usr_Date
		,SUM(Usr_Earned) AS Usr_Earned
		FROM CTE1
		GROUP BY Usr_Date
	)
	,CTE5 AS(
		SELECT Course_Date,Usr_Date,Month,Day,Counter,Average,Usr_Earned
		FROM CTE4
		LEFT JOIN CTE2
		ON Course_Date = Usr_Date
	)
	SELECT Counter
	,(SELECT SUM(Usr_Earned)
		FROM CTE5 X
		WHERE X.Usr_Date <= CTE5.Course_Date
	) AS Earned
	,(SELECT SUM(Average)
		FROM CTE5 Y
		WHERE Y.Course_Date <= CTE5.Course_Date
	) AS Average
	FROM CTE5
	ORDER BY Course_Date
	'
	include '/Inc/queryExecute.cfm'
	return local.result
}

function byDate() {
	include '/Inc/newQuery.cfm'
	local.sql = '
	DECLARE @UsrID Int = ?
	;WITH CTE1 AS(
		SELECT Convert(Varchar,GuessDateTime,101) AS GuessDate
		,SUM(Earned) AS Earned
		,SUM(Points) AS Points
		FROM GuessView
		WHERE UsrID = @UsrID
		AND GuessDateTime is not null
		GROUP BY Convert(Varchar,GuessDateTime,101)
	)
	SELECT *
	FROM Calendar
	LEFT JOIN CTE1
	ON CalendarDate = GuessDate
	ORDER BY CalendarDate
	'
	params = [
		session.Usr.UsrID
	]
	include '/Inc/queryExecute.cfm'
	return local.result
}
}
