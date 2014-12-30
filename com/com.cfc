component {
/*
7/25/2014:
https://developer.mozilla.org/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB
calls it get
So I'm going to start calling it: get.
*/

function get(arg) {
	include '/Inc/newQuery.cfm'
	sql = 'SELECT * FROM '
	if (IsDefined('Variables.fw.Schema')) {
		sql &= Variables.fw.Schema & '.'
	}
	sql &= Variables.fw.TableName
		& 'View WHERE ' 
		& Variables.fw.TableName 
		& 'ID=?' 

	if (IsSimpleValue(arg)) {
		params = [
			{sqltype:'integer',value:arg}
		]
	} else {
		params = [
			{sqltype:'integer',value:arg['#Variables.fw.TableName#ID']}
		]
	}

	include '/Inc/queryExecute.cfm'
	return result
}

function Where(FieldName,FieldValue,OrderBy) {
	include '/Inc/newQuery.cfm'
	sql = 'SELECT *
FROM '
	if (IsDefined('Variables.fw.Schema')) {
		sql &= Variables.fw.Schema & '.'
	}
	sql &= Variables.fw.TableName & 'View'
	if (IsDefined('FieldName')) {
		sql &= '
WHERE ' & arguments.FieldName & ' = ?'
		if (IsSimpleValue(arguments.FieldValue)) {
			params = [{sqltype='integer',value:arguments.FieldValue}]
		} else {
			params = [{sqltype='integer',value:arguments.FieldValue['#arguments.FieldName#']}]
		}
	}
	if (IsDefined('arguments.OrderBy')) {
		sql &= '
ORDER BY ' & arguments.OrderBy
	} else if (IsDefined('Variables.fw.TableSort')) {
		sql &= '
ORDER BY ' & Variables.fw.TableSort
	}
	include '/Inc/queryExecute.cfm'
	return result
}

function Delete(arg) {
	include '/Inc/newQuery.cfm'
	sql = 'DELETE FROM '
		& Variables.fw.TableName
		& ' WHERE '
		& Variables.fw.TableName
		& 'ID=?'
	params = [
		arg['#Variables.fw.TableName#ID']
	]
	include '/Inc/queryExecute.cfm'
	return result
}
}