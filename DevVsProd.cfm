<cfscript>
if (session.fw.dataSource == 'LRDev') {
	session.fw.dataSource = 'LR2014Fall2'
} else {
	session.fw.dataSource = 'LRDev'
}
location(request.fw.home,false)
</cfscript>

