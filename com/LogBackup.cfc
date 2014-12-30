component {

function Top1(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT TOP 1 *
	FROM LogBackup
	ORDER BY LogBackupID DESC
	'
	include '/Inc/queryExecute.cfm'
	return result
}

function Top1Guess(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT TOP 1 *
	FROM Guess
	ORDER BY GuessID DESC
	'
	include '/Inc/queryExecute.cfm'
	return result
}

function Save(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	INSERT INTO LogBackup(LogBackup_GuessID) VALUES(?)
	'
	params = [
		arg.GuessID
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}
