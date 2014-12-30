</main>
<cfoutput>
<cfif request.fw.js>
	<div id="fw-home">#request.fw.home#</div>
	<script src="#request.fw.home#/Inc/js/fw.js"></script>
	<cfif request.fw.bootstrap>
		<script src="//cdn.jsdelivr.net/bootstrap/latest/js/bootstrap.js"></script>
	</cfif>
	<script src="#request.fw.home#/Inc/js/Lenoir-Rhyne.js"></script>
</cfif>
</cfoutput>
