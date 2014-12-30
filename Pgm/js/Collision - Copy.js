canvas = document.getElementById("myCanvas").getContext("2d")
var player = {}
player.img = document.getElementById("player")
player.width = player.img.width
player.height = player.img.height
player.left=0
player.top=100
var obstacle = {}
obstacle.left = 0
obstacle.top = 0

function draw() {
	checkKeyboard()
	canvas.fillStyle = "white"
	canvas.fillRect(0,0,400,300)
	
	canvas.fillStyle = "DarkGoldenrod"
	canvas.fillRect(obstacle.left, obstacle.top, 20, 20)
	canvas.drawImage(player.img, player.left, player.top)
	
	// Collision detection
	if (player.left + player.width <= obstacle.left) {
	} else if (player.left >= obstacle.left + 20) {
	} else if (player.top + player.height <= obstacle.top) {
	} else if (player.top >= obstacle.top + 20) {
	} else {
		obstacle.left = 0
	}
	obstacle.left = obstacle.left - 3
	if (obstacle.left < 0) {
		obstacle.left = 400
		obstacle.top = Math.random()*300
	}
	requestAnimationFrame(draw)
}
draw()

function checkKeyboard() {
	if (key.isPressed(37)) player.left = player.left - 10
	if (key.isPressed(38)) player.top = player.top - 10
	if (key.isPressed(39)) player.left = player.left + 10
	if (key.isPressed(40)) player.top = player.top + 10
	
	if (player.left < 0) player.left = 0
	if (player.top < 0) player.top = 0
	if (player.left > 400 - player.width) player.left = 400 - player.width
	if (player.top > 300 - player.height) player.top = 300 - player.height
}
