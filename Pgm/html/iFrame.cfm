<cfscript>
Guess = new com.Guess().get(url)
</cfscript>

<cfoutput query="Guess">
<html>
<head>
<link rel="stylesheet" href="iframe.css">
</head>
<body>
#URLDecode(GuessName)#
</body>
</html>
</cfoutput>