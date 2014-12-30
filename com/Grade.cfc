component extends='com' {
Variables.fw.TableName = 'Grade'

function WhereGradeSortLE(GradeSort) {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT *
	FROM Grade
	WHERE CAST(GradeSort AS Decimal(9,2)) <= ?
	ORDER BY GradeSort DESC
	'
	params = [
		 arguments.GradeSort
	]
	include '/Inc/queryExecute.cfm'
	return result
}

}