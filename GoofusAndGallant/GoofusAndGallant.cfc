component {
/*
function PaperWhereActSort() {
	include "/Inc/newQuery.cfm"
	local.sql = "
	DECLARE @ActSort Int = #Val(form.ActSort)#
	DECLARE @CourseID Int = #Val(session.Usr.qry.CourseID)#

	SELECT *
	FROM GuessView
	JOIN (
		SELECT PaperID AS Textarea_PaperID
		,GuessName AS Textarea_GuessName
		FROM GuessView
		WHERE QuestionName like '%textarea%'
	) Textarea
	ON Textarea_PaperID = PaperID
	WHERE ActSort = @ActSort
	AND Attachment <> ''
	AND AnswerName like '%attachment%'
	AND CourseID = @CourseID
	ORDER BY PaperID DESC
	"
	include '/Inc/execute.cfm'
	return local.result
}
*/

function UpdatePaperName(arg) {
	include '/Inc/newQuery.cfm'
	local.sql = '
	UPDATE Paper SET
	 PaperName = ?
	WHERE PaperID = ?
	'
	params = [
		 arg.PaperName
		,arg.PaperID
	]
	include '/Inc/queryExecute.cfm'
}

}


