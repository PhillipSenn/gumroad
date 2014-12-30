component extends='com' {
Variables.fw.TableName = 'LogTable'

function WhereLogTableName(arg) {
	include '/Inc/newQuery.cfm'
	params = [
		arg.LogTableName
	]
	sql = '
	DECLARE @LogTableName Varchar(128) = ?
	IF NOT EXISTS(SELECT LogTableID FROM LogTable WHERE LogTableName = @LogTableName)
	INSERT INTO LogTable(LogTableName) VALUES(@LogTableName)
	SELECT LogTableID FROM LogTable WHERE LogTableName = @LogTableName
	'
	include '/Inc/queryExecute.cfm'
	return result
}

}