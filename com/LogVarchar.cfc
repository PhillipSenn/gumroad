component {

function Save(arg) {
	var LogTable = new com.LogTable().WhereLogTableName(arg)
	
	params = [
		 LogTable.LogTableID
		,arg.LogFieldName
	]
	LogField = new com.LogField().WhereLogFieldName(params)
	RemoteAddr = new com.RemoteAddr().WhereRemoteAddrName()
	include '/Inc/newQuery.cfm'
	params = [
		 session.Usr.UsrID
		,LogField.LogFieldID
		,arg.LogVarcharPK
		,arg.LogVarcharName
		,RemoteAddr.RemoteAddrID
	]
	sql = '
	DECLARE @UsrID Int = ?
	INSERT INTO LogVarchar(LogVarchar_UsrID,LogVarchar_FieldID,LogVarcharPK,LogVarcharName,LogVarchar_RemoteAddrID)
	VALUES(@UsrID,?,?,?,?)
	'
	include '/Inc/queryExecute.cfm'
}
}
