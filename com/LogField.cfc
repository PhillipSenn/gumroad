component extends='com' {
Variables.fw.TableName = 'LogField'

function WhereLogFieldName(arg) {
	include '/Inc/newQuery.cfm'
	params = arg /* TableID, FieldName */
	sql = '
	DECLARE @LogTableID Int = ?
	DECLARE @LogFieldName Varchar(128) = ?
	IF NOT EXISTS(SELECT LogFieldID FROM LogFieldView WHERE LogTableID = @LogTableID AND LogFieldName = @LogFieldName)
	INSERT INTO LogField(LogField_TableID,LogFieldName) VALUES(@LogTableID,@LogFieldName)
	SELECT LogFieldID FROM LogFieldView WHERE LogTableID = @LogTableID AND LogFieldName = @LogFieldName
	'
	include '/Inc/queryExecute.cfm'
	return result
}

}