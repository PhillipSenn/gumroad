USE LR2014Fall2
select *
from calendar
create table Attendance(
AttendanceID Int Identity Primary Key NONCLUSTERED
,Attendance_UsrID Int
,Attendance_CalendarID Int
)
GO
DROP View AttendanceView
GO
create View AttendanceView AS
SELECT *
FROM Attendance
JOIN UsrView
ON Attendance_UsrID = UsrID
JOIN Calendar
ON Attendance_CalendarID = CalendarID
GO
select *
from attendanceview
delete from attendance

