<cfoutput>
<cfif request.fw.js>
	<cfif FileExists(request.fw.jsName)>
		<script src="#GetFileFromPath(request.fw.jsName)#"></script>
	</cfif>
	<script src="#request.fw.home#/Inc/js/fw/FlashOfUnstyledContent.js"></script>
</cfif>
</cfoutput>
</body>
</html>
