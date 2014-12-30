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
		,arg.LogIntPK
		,arg.LogIntSort
		,RemoteAddr.RemoteAddrID
	]
	sql = '
	DECLARE @UsrID Int = ?
	INSERT INTO LogInt(LogInt_UsrID,LogInt_FieldID,LogIntPK,LogIntSort,LogInt_RemoteAddrID)
	VALUES(@UsrID,?,?,?,?)
	'
	include '/Inc/queryExecute.cfm'
}
}
