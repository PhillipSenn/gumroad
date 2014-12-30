component extends='com' {
Variables.fw.TableName = 'RemoteAddr'

function WhereRemoteAddrName() {
	include '/Inc/newQuery.cfm'
	params = [
		cgi.REMOTE_ADDR
	]
	sql = '
	DECLARE @RemoteAddrName Varchar(128) = ?
	IF NOT EXISTS(SELECT RemoteAddrID FROM RemoteAddr WHERE RemoteAddrName = @RemoteAddrName)
	INSERT INTO RemoteAddr(RemoteAddrName) VALUES(@RemoteAddrName)
	SELECT RemoteAddrID FROM RemoteAddr WHERE RemoteAddrName = @RemoteAddrName
	'
	include '/Inc/queryExecute.cfm'
	return result
}

}