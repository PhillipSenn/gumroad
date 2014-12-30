component {
function Stats() {
	include '/Inc/newQuery.cfm'
	sql = "
	SELECT CourseSort,UsrID,UsrName,Likes,Liked,Earned,Guesses
	FROM UsrView
	LEFT JOIN (
		SELECT Paper_UsrID
		,COUNT(*) AS Likes
		FROM Vote
		JOIN GuessView
		ON Vote_GuessID = GuessID
		WHERE ActName like '%chat%'
		GROUP BY Paper_UsrID
	) Guess1
	ON Paper_UsrID = UsrID
	LEFT JOIN (
		SELECT Vote_UsrID
		,COUNT(*) AS Liked
		FROM VoteView
		WHERE ActName like '%chat%'
		GROUP BY Vote_UsrID
	) Guess2
	ON Vote_UsrID = UsrID
	LEFT JOIN (
		SELECT UsrID AS Earned_UsrID
		,SUM(Earned) AS Earned
		,COUNT(*) AS Guesses
		FROM GuessView
		WHERE ActName like '%chat%'
		GROUP BY UsrID
	) Guess
	ON Earned_UsrID = UsrID
	WHERE CourseID = ?
	ORDER BY Liked DESC,Likes DESC
	";
	params = [
		session.Usr.CourseID
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}
