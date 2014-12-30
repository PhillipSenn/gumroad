canvas = document.getElementById("myCanvas").getContext("2d")
var obstacle = {}
var player = {}
player.img = document.getElementById("player")
player.width = player.img.width
player.height = player.img.height
player.left=0
player.top=100
obstacle.left = 0
obstacle.top = 0

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
