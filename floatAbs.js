var offset = 78
$('#topRow div').each(myFunction)
function myFunction(idx,element) {
	this.style.left = window.innerWidth / 11 * idx + 'px'
	this.style.width = window.innerWidth / 11 + 'px'
	this.style.height = window.innerHeight / 11 + 'px'
}
$('#leftColumn div').each(leftColumn)
function leftColumn(idx,element) {
	this.style.top = (window.innerHeight / 11 * (idx+1)) + 'px'
	this.style.width = window.innerWidth / 11 + 'px'
	this.style.height = window.innerHeight / 11 + 'px'
}
