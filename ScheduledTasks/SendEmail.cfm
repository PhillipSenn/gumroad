<cfscript>
Guess = new com.LogBackup().Top1Guess()
LogBackup = new com.LogBackup().Top1()

svc = new mail()
svc.setBody('test2')
svc.setFrom('Professor Senn<Phillip.Senn@my.lr.edu>')
svc.setPassword('lru2016!')
svc.setPort(465)
svc.setServer('smtp.gmail.com')
svc.setSubject('test2')
svc.setTo('Phillip.Senn@my.lr.edu')
svc.setType('html')
svc.setUseSSL(true)
svc.setUserName('Phillip.Senn@my.lr.edu')
svc.Send()
</cfscript>
