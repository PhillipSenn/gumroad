var player = {}
player.img = document.getElementById('player')
player.width = player.img.width
player.height = player.img.height
player.left=0
player.top=100
canvas = document.getElementById('myCanvas').getContext('2d')

;(function() {
	function draw() {
		checkKeyboard()
		canvas.fillStyle = 'white'
		canvas.fillRect(0,0,400,300)
		
		canvas.drawImage(player.img, player.left, player.top)
		requestAnimationFrame(draw)
	
	}
	draw()

	function checkKeyboard() {
		if (document.activeElement !== document.body) return
		GuessName()
	}
})()

;(function() {
	$('[name=GuessName]').on('keyup',keyup)
	function keyup() {
		var result = '<script id="myScript">var GuessName=function() {' + $(this).val() + '}</scr'+'ipt>'
		$('#myScript').remove()
		$('body').append($(result)[0])
	}
})();
