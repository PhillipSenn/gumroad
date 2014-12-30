component {

function Login(ID) {
	if (Len(arguments.ID) != 36) return;
	if (Mid(arguments.ID,09,1) != '-') return;
	if (Mid(arguments.ID,14,1) != '-') return;
	if (Mid(arguments.ID,19,1) != '-') return;
	if (Mid(arguments.ID,24,1) != '-') return;

	for (var i=1; i <= Min(36,Len(arguments.ID)); i++) {
		if (!Find(Mid(arguments.ID,i,1),'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-')) return;
	}
	if (Find('--',arguments.ID)) return;

	include '/Inc/newQuery.cfm'
	sql = '
	SELECT *
	FROM UsrView
	WHERE GloballyUniqueIdentifier = ?
	'
	params = [
		arguments.ID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

function Assignments() {
	include '/Inc/newQuery.cfm'
	sql = "
	DECLARE @UsrID Int = ?
	SELECT ActName,ActSort,ActLink,AssignmentStart,AssignmentStop
	,CatName
	,NumberComplete
	,Questions
	,100 * isNull(NumberComplete,0)/Questions AS PctComplete
	,GuessDateTime
	FROM AssignmentView
	LEFT JOIN(
		SELECT 
		 Paper_AssignmentID
		,Count(*) AS NumberComplete
		,min(GuessDateTime) AS GuessDateTime
		FROM GuessView
		WHERE UsrID = @UsrID
		AND GuessDateTime is not null
		GROUP BY Paper_AssignmentID
	) Complete
	ON Paper_AssignmentID = AssignmentID
	WHERE CourseID = (
		SELECT CourseID
		FROM UsrView
		WHERE UsrID = @UsrID
	)
	AND CatName <> 'Attendance'
	ORDER BY case when actname like '%chat room%' then 0 else 1 end 
	,AssignmentStart,AssignmentStop,CatSort,ActSort
	"
	params = [
		session.Usr.UsrID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

function Chats() {
	include '/Inc/newQuery.cfm'
	sql = "
	DECLARE @UsrID Int = ?
	SELECT Sum(Earned) AS Earned
	FROM GuessView
	WHERE UsrID = @UsrID
	AND ActName like '%chat%'
	"
	params = [
		session.Usr.UsrID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

function Pictures() {
	include '/Inc/newQuery.cfm'
	sql = "
	SELECT 
	 UsrName
	,Datediff(minute,GuessDateTime,getdate()) AS Minutes
	,CourseSort
	FROM GuessView
	WHERE ActName like 'forum 4%'
	AND QuestionName like '%who took the photo%'
	AND GuessDateTime is not null
	ORDER BY GuessDateTime DESC
	"
	include '/Inc/queryExecute.cfm'
	return result
}
}
