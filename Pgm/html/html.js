dom.output = $('#output')
dom.GuessName = $('#GuessName')

;(function() {
	$('#GuessName').bind('input propertychange', propertychange)
	function propertychange() {
		/*
		var local = {}
		local.srcdoc = '<html><head><style>canvas{border:10px groove gray}'
		local.srcdoc += 'body {background-color:white}</style></head><body>'
		local.srcdoc += dom.GuessName.val()
		local.srcdoc += '</body></html>'
		dom.output.attr('srcdoc',local.srcdoc)
		*/
		dom.output.html(dom.GuessName.val())
	}
})()

;(function() {
	var Variables = {}
	Variables.Index = 0
	$('.animate').each(animate)
	function animate(index, element) {
		$('.breakdown').hide()
		$(this).after('<h3 id="myText"></h3>')
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

$('#myModal').modal()

;(function() {
	$(document).on('click','#seeAssignment',click)
	function click() {
		dom.GuessName.focus()
	}
})();
