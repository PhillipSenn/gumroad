component {

function PhotoBy(arg) {
	include '/Inc/newQuery.cfm'
	local.sql = "
	SELECT *
	FROM GuessView
	WHERE PaperID = ?
	AND QuestionName like '%who took the photo%'
	"
	params = [
		arg.PaperID
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}
