component {

function SavePaper(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	UPDATE Paper
	SET PaperName = ?
	WHERE PaperID = ?
	'
	params = [
		 arg.PaperName
		,arg.PaperID
	]
	include '/Inc/queryExecute.cfm'
}

function SaveGuess(arg) { // This could be used by Paper.Upload()
	include '/Inc/newQuery.cfm'
	sql = '
	UPDATE Guess
	SET Earned=(
		SELECT Points
		FROM GuessView
		WHERE GuessID = Guess.GuessID
	)
	,GuessDatetime = getdate()
	,GradeDateTime = null
	WHERE Guess_PaperID = ?
	'
	params = [
		arg.PaperID
	]
	include '/Inc/queryExecute.cfm'
}
}
