component {

function Next(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT TOP 1 *
	FROM GuessView
	WHERE PaperID = ?
	AND GuessDateTime is null
	ORDER BY GuessID -- arbitrary
	'
	params = [
		arg.PaperID
	]
	include '/Inc/queryExecute.cfm'
	return result
}


remote function GuessLetter() returnformat='json' {
	var L = Left(arguments.letter,1)
	include '/Inc/newQuery.cfm'
	sql = "
	UPDATE Guess SET
	GuessName = GuessName + '#L#'
	WHERE GuessID = ?
	AND GuessName NOT LIKE '%#L#%'
	"
	params = [
		arguments.GuessID
	]
	include '/Inc/queryExecute.cfm'

	include '/Inc/newQuery.cfm'
	sql = '
	SELECT GuessName,AnswerName
	FROM GuessView
	WHERE GuessID = ?
	'
	params = [
		arguments.GuessID
	]
	include '/Inc/queryExecute.cfm'
	return result
}

remote function Read() returnformat='json' {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT GuessName,AnswerName
	FROM GuessView
	WHERE GuessID = ?
	'
	params = [
		arguments.GuessID
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}
