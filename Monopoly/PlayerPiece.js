var column = 1
var row = 2
function roll() {
	return Math.floor(Math.random() * 6) + 1
}
$('#partA .bottomHeader:eq(0)').append('<img src="../../emoji/hotel.png" width="25">')
$('#partA .bottomHeader:eq(1)').append('<img src="../../emoji/house.png" width="25">')
$('#partA .bottomHeader:eq(1)').append('<img src="../../emoji/japanese_castle.png" width="25" title="japanese_castle">')


;(function() {
	var Variables = {}
	Variables.die1 = roll()
	Variables.die2 = roll()
	Variables.Counter = 0
	placePosition()
	
	function MoveMe1() {
		$('#Player1').remove()
		if (row == 11 && column != 1) {
			column = column - 1
		} else if (column == 1 && row != 1) {
			row = row - 1
		} else if (row == 1 && column != 11) {
			column = column + 1
		} else if (column == 11) {
			row = row + 1
		}
		placePosition()
	}
	function placePosition() {
		if (row == 1) {
			$('#partA .property:eq(' + (column-1) + ')').append('<div id="Player1">&#x265b;</div>');
		} else if (column == 1 && row > 1) {
			$('#partB .property:eq(' + (row-2) + ')').append('<div id="Player1">&#x265b;</div>');
		} else if (column == 11 && row > 1 && row < 11) {
			$('#partC .property:eq(' + (row-2) + ')').append('<div id="Player1">&#x265b;</div>');
		} else if (row == 11 && column > 1) {
			$('#partD .property:eq(' + (column-1) + ')').append('<div id="Player1">&#x265b;</div>');
		}

		Variables.Counter += 1
		if (Variables.Counter < Variables.die1 + Variables.die2) {
			setTimeout(MoveMe1,1000)
		}
		log(row + ',' + column)
	}
})()

