component {

function Send(arg) {
	local.Usr = new com.Usr().get(arg)
	local.emailBody = Replace(  arg.emailBody,'FirstName',local.Usr.FirstName);
	local.emailBody = Replace(local.emailBody,'Click here to login','<a href="http://www.Lenoir-Rhyne.com#request.fw.home#?ID=' & local.Usr.GloballyUniqueIdentifier & '">Click here to login</a>')
	if (!IsDefined('arg.Silent')) {
		WriteOutput('<p>To: ' & local.Usr.Email & '<br>Subject: ' & arg.EmailSubject & '<br>' & local.emailBody & '</p>');
	}
	local.svc = new mail()
	local.svc.setBody(local.EmailBody)
	local.svc.setFrom('Professor Senn<Phillip.Senn@my.lr.edu>')
	local.svc.setPassword('')
	include 'Password.cfm'
	local.svc.setPort(465)
	local.svc.setServer('smtp.gmail.com')
	local.svc.setSubject(arg.EmailSubject)
	local.svc.setTo('#local.Usr.UsrName#<#local.Usr.Email#>')
	
	// local.svc.setTo('PhillipSenn@gmail.com')
	
	local.svc.setType('html')
	local.svc.setUseSSL(true)
	local.svc.setUserName('Phillip.Senn@my.lr.edu')
	local.svc.Send()
}
}
