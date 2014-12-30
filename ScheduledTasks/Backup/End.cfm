<cfscript>
param name="sql" default="";
svc = new mail(); // The body of the email will be the table definition only.
EmailBody = "set nocount on
set statistics time off
set statistics io off
SET ANSI_NULL_DFLT_OFF ON
" & sqlTable;

sql = EmailBody & sql; // The data will be in the attachment, not the body
myPath = ExpandPath('.');
myFile = myPath & '\#form.TableName#.sql';
FileWrite(myFile,sql);

svc.setBody(EmailBody);
svc.setFrom('Professor Senn<Phillip.Senn@my.lr.edu>');
svc.setPassword('lru2016!');
svc.setPort(465);
svc.setServer('smtp.gmail.com');
svc.setSubject('LRDev #form.TableName#');
svc.setTo('Professor Senn<Phillip.Senn@my.lr.edu>');
svc.setType('text');
svc.setUserName('Phillip.Senn@my.lr.edu');
svc.setUseSSL(true);
if (form.EmailData) {
	svc.addParam(file=myFile);
}
// svc.Send();


Complete = FileRead(myPath & '\LRDev.sql'); 
FileWrite(myPath & '\LRDev.sql',Complete & sql); 
</cfscript>
