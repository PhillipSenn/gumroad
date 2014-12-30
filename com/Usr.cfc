component extends='com' {
Variables.fw.TableName = 'Usr'
Variables.fw.TableSort = 'LastName,FirstName,UsrName,PersonName,UsrID'


function (arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT *
	FROM View
	JOIN 
	ON ID = 
	WHERE ID = ?
	GROUP BY
	ORDER BY
	'
	params = [
		arg.ID
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}
