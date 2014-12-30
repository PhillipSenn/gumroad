dom.output = $('#output')
dom.GuessName = $('#GuessName')
dom.htmlCode = $('[name=htmlCode]')

;(function() {
	$('[name=GuessName]').bind('input propertychange', propertychange)
	$('[name=htmlCode]').bind('input propertychange', propertychange)
	function propertychange() {
		dom.output.html('<style>' + dom.GuessName.val() + '</style>' + dom.htmlCode.val())
	}
	propertychange()
})()

;(function() {
	var Variables = {}
	Variables.Index = 0
	$('.animate').each(animate)
	function animate(index, element) {
		$('.breakdown').hide()
		$(this).after('<h1 id="myText"></h1>')
		Variables.myText = $(this).text()
		// Variables.myText = Variables.myText.replace(/&lt;/g, "<");
		showNextLetter()
	};
	
	function showNextLetter() {
		Variables.Index += 1
		$('#myText').text(Variables.myText.substr(0,Variables.Index))
		if (Variables.Index < Variables.myText.length) {
			setTimeout(showNextLetter,Math.random()*1000);
		} else {
			Variables.Index = 0
			setTimeout(showNextLetter,5000);
		}
	}
})();

