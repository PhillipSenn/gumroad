component {

function Save(arg) {
	local.result = {}
	local.result.msg = ""
	local.svc = new query()
	local.sql = "
	if exists (select * from sysobjects where id = object_id(N'LRBak.dbo.#arg.TableName#') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DROP TABLE LRBak.dbo.#arg.TableName#
	SELECT * 
	INTO LRBak.dbo.#arg.TableName#
	FROM LR2014Fall1.dbo.#arg.TableName#
	"
	local.svc.setSQL(local.sql)
	local.svc.setDataSource('LRBak')
	local.obj = local.svc.execute()

	if (arg.EmailData) {
		include "/Inc/newQuery.cfm"
		sql = "
		SELECT *
		FROM LR2014Fall1.dbo.#arg.TableName#
		ORDER BY #arg.TableName#ID DESC
		"
		include '/Inc/queryExecute.cfm'
		return result
	}
}
}
