create table Audit(
 AuditID Int Identity Primary Key NONCLUSTERED
,session_UsrID Int
,AuditName VarChar(128)
,AuditSort Int
,AuditDateTime DateTime default getdate()
,Audit_TermID Int
,Audit_CourseID Int
,Audit_CatID Int
,Audit_ScaleID Int
,Audit_ActID Int
,Audit_AttID Int
,Audit_QuestionID Int
,Audit_AnswerID Int
,Audit_PersonID Int
,Audit_UsrID Int
,Audit_AssignmentID Int
,Audit_PaperID Int
,Audit_GuessID Int
)
GO

component {
Variables.fw.TableName = 'Audit'

function Save(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	DECLARE @UsrID Int = ?
	INSERT INTO Audit
	(session_UsrID
	,AuditName
	,AuditSort
	,Audit_TermID
	,Audit_CourseID
	,Audit_CatID
	,Audit_ScaleID
	,Audit_ActID
	,Audit_AttID
	,Audit_QuestionID
	,Audit_AnswerID
	,Audit_PersonID
	,Audit_UsrID
	,Audit_AssignmentID
	,Audit_PaperID
	,Audit_GuessID
	) VALUES(@UsrID,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
	'
	params = arg
	include '/Inc/queryExecute.cfm'
	return result
}
}
	/* Now audit it */
	params = [
		 session.Usr.UsrID
		,result.GuessName
		,result.Earned
		,result.TermID
		,result.CourseID
		,result.CatID
		,result.ScaleID
		,result.ActID
		,result.AttID
		,result.QuestionID
		,result.AnswerID
		,result.PersonID
		,result.UsrID
		,result.AssignmentID
		,result.PaperID
		,result.GuessID
	]
	new com.Audit().Save(params)
