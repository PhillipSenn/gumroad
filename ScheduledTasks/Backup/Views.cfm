<cfscript>
myFile = 'C:\home\Lenoir-Rhyne.com\SQL\@Views.sql'
sql = FileRead(myFile) 

svc = new mail()
svc.setBody(sql)
svc.setFrom('LRDev<Phillip.Senn@my.lr.edu>')
svc.setPassword('lru2016!')
svc.setPort(465)
svc.setServer('smtp.gmail.com')
svc.setSubject('LRViews.sql')
svc.setTo('Professor Senn<Phillip.Senn@my.lr.edu>')
svc.setType('text')
svc.setUserName('Phillip.Senn@my.lr.edu')
svc.setUseSSL(true)
svc.addParam(file=myFile)
svc.Send()

myFile = ExpandPath('.') & '\LRDev.sql' // Now we're no longer looking in the assets folder, we're looking in the current folder.
Complete = FileRead(myFile) // Now we're getting the complete backup
FileWrite(myFile,Complete & sql) // and adding the views to it

svc = new mail()
svc.setBody('Attached is the complete backup')
svc.setFrom('Professor Senn<Phillip.Senn@my.lr.edu>')
svc.setPassword('lru2016!')
svc.setPort(465)
svc.setServer('smtp.gmail.com')
svc.setSubject('LRDev.sql')
svc.setTo('Professor Senn<Phillip.Senn@my.lr.edu>')
svc.setType('html')
svc.setUserName('Phillip.Senn@my.lr.edu')
svc.setUseSSL(true)
svc.addParam(file=myFile)
svc.Send()
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>Yay!</h1>
#myFile#
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>