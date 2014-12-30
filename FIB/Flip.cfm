<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<a id="myButton" class="btn" href="JavaScript:;">Test</a>
<cfinclude template="/Inc/foot.cfm">
<script>

(function() {
	Rotate();
	var y,ny=0,rotYINT
	function Rotate() {
		y=document.getElementById('myButton');
		rotYINT=setInterval(startYRotate,10);
		
	}
	function startYRotate() {
		ny+=1;
		y.style.transform="rotateY(" + ny + "deg)"
		y.style.webkitTransform="rotateY(" + ny + "deg)"
		y.style.OTransform="rotateY(" + ny + "deg)"
		y.style.MozTransform="rotateY(" + ny + "deg)"
		if (ny>=360)	{
			clearInterval(rotYINT)
			if (ny>=360){
				ny=0
			}
		}
	}
})();
</script>
<cfinclude template="/Inc/End.cfm">
