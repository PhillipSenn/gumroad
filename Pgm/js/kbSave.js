dom.htmlOutput = $('#htmlOutput')

;(function() {
	var Variables = {}
	
	$('[name=htmlCode]').on('keyup',keyup)
	function keyup() {
		dom.htmlOutput.html($(this).val())
		player.img = document.getElementById('player')
		player.width = player.img.width
		player.height = player.img.height
		player.left=0
		player.top=100
		canvas = document.getElementById('myCanvas').getContext('2d')
	}
})()


;(function() {
	$('[name=cssCode]').on('keyup',keyup)
	function keyup() {
		$('#myCSS').remove()
		$('<style>' + $(this).val() + '</style>').appendTo('head')
	}
})()