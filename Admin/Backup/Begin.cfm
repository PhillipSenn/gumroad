<cfscript>
param name="form.EmailData" default=true;
Script_Name = GetFileFromPath(cgi.SCRIPT_NAME);
i = FindNoCase('.cfm',Script_Name);
form.TableName = Left(Script_Name,i-1);
response = new Begin().Save(form);
myPath = ExpandPath('.');
myFile = myPath & '\#form.TableName#.sql';
</cfscript>
