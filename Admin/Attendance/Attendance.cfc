component {

function WhereCourseID(arg) {
	include '/Inc/newQuery.cfm'
	params = [
		arg.CourseID
	]
	sql = '
	DECLARE @CalendarID Int = (
		SELECT CalendarID
		FROM Calendar
		WHERE CalendarDate = Cast(getdate() AS Date)
	)
	SELECT *
	FROM UsrView
	LEFT JOIN (
		SELECT Attendance_UsrID,CalendarDate
		FROM AttendanceView
		WHERE Attendance_CalendarID = @CalendarID
	) Attendance
	ON Attendance_UsrID = UsrID
	WHERE CourseID = ?
	ORDER BY LastName,FirstName
	'
	include '/Inc/queryExecute.cfm'
	return result
}

function Save(arg) {
	include '/Inc/newQuery.cfm'
	params = [
		arg.UsrID
	]
	sql = '
	DECLARE @UsrID Int = ?
	DECLARE @CalendarID Int = (
		SELECT CalendarID
		FROM Calendar
		WHERE CalendarDate = Cast(getdate() AS Date)
	)
	IF NOT EXISTS(SELECT * FROM AttendanceView WHERE UsrID=@UsrID AND CalendarID=@CalendarID)
	INSERT INTO Attendance(Attendance_UsrID,Attendance_CalendarID) VALUES(@UsrID,@CalendarID)
	'
	include '/Inc/queryExecute.cfm'
}
}