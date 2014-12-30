component {

function Approved() {
	include '/Inc/newQuery.cfm'
	sql = '
	SELECT *
	FROM ResearchTopicView
	'
	if (!session.Usr.isAdmin) {
		sql &= 'WHERE isApproved = 1
		'
	}
	sql &= 'ORDER BY ResearchTopicID'
	params = [
	]
	include '/Inc/queryExecute.cfm'
	return result
}

function Save(arg) {
	include '/Inc/newQuery.cfm'
	sql = '
	INSERT INTO ResearchTopic(ResearchTopicName,ResearchTopicDesc,ResearchTopic_UsrID) VALUES(?,?,?)
	'
	params = [
		 arg.ResearchTopicName
		,arg.ResearchTopicDesc
		,session.Usr.UsrID
	]
	include '/Inc/queryExecute.cfm'

}
}
