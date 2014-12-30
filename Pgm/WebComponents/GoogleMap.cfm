<cfscript>
form.GuessName = form.cssCode & '
' & form.htmlCode & '
' & form.jsCode
new com.Guess().Save(form)
new com.Attendance().Save(form)
Guess = new com.Guess().get(form)
</cfscript>


<cfoutput>
<html>
<head>
#form.cssCode#
</head>
<body>
#form.htmlCode#
<cfif FindNoCase('platform.js',form.jsCode)>
	<script src="platform.js"></script>
	<link rel="import" href="GoogleWebComponents/google-map/google-map.html">
	<!---
	<link rel="import" href="GoogleWebComponents/google-map/google-map-directions.html">
	--->
</cfif>
</body>
</html>
</cfoutput>