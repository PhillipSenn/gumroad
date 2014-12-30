<html>
<head>
<style>
#topRow div, #leftColumn div, #rightColumn div, #bottomRow div {
	background-repeat: no-repeat;
}
#Chance3 {
	background-image:url(Chance3.jpg);
}

body {
	margin-top: 10px;
}
form {
	position:absolute;
}
.square {
	border: 1px solid #000;
	position: absolute;
}
#leftColumn .square {
	left: 10px;
}
.property:hover {
	background-color:#999;
	color:white;
}
.full:hover {
	background-color:#999;
	color:white;
}

.red {
  background-color:#FF0000 /* Change this to ED1B24 */
}
.green {
  background-color:#00FF00 /* Change this to 1FB25A */
}
.blue {
  background-color:#0000FF /* Change this to 0072BB */
}

.purple {
  background-color:#130C5B
}
.lightBlue {
  background-color:#AAE0FA
}
.pink {
  background-color:#D93A96
}
.orange {
  background-color:#F7941D
}
.yellow {
  background-color:#FEF200
}



#leftColumn .property, #rightColumn .property {
	float:left;
}
#leftColumn .full, #rightColumn .full {
	float:none; /* todo: fill the entire square when hovered over */
}
.leftHeader {
	float:left;
	outline-right:2px solid black;
	width:20px;
}
.rightHeader {
	float:left;
	outline-left:2px solid black;
	width:20px;
}
#Player1 {
	position:absolute;
	font-size:2em;
}
.floatLeft {
	float:left;
}
#navigation {
	position:absolute;
}
</style>
</head>
<body>
<div id="topRow">
	<div class="square">
		<div class="full property">
			<img src="FreeParking.jpg" width="60px" class="floatLeft">
			Free<br>Parking
		</div>
	</div>
	<div class="square">
		<div class="property">Kentucky Avenue</div>
		<div class="red bottomHeader">&nbsp;</div>
	</div>
	<div class="square">
		<div class="full property">
			<img src="Chance2.jpg" width="30px" class="floatLeft">
			Chance
		</div>
	</div>
	<div class="square">
		<div class="property">Indiana Avenue</div>
		<div class="red bottomHeader">&nbsp;</div>
	</div>
	<div class="square">
		<div class="property">Illinois Avenue</div>
		<div class="red bottomHeader">&nbsp;</div>
	</div>
	<div class="square">
		<div class="full property">
			B &amp; O Railroad
			<img src="RR3.jpg" width="70px">
		</div>
	</div>
	<div class="square">
		<div class="property">Atlantic Avenue</div>
		<div class="yellow bottomHeader">&nbsp;</div>
	</div>
	<div class="square">
		<div class="property">Ventnor Avenue</div>
		<div class="yellow bottomHeader">&nbsp;</div>
	</div>
	<div class="square">
		<div class="full property">
			Water Works
			<div>
				<img src="WaterWorks.jpg" width="55px">
			</div>
		</div>
	</div>
	<div class="square">
		<div class="property">Marvin Gardens</div>
		<div class="yellow bottomHeader">&nbsp;</div>
	</div>
	<div class="square">
		<div class="full property">
			<img src="gotoJail.jpg" width="75px" class="floatLeft">
			Go To Jail
		</div>
		<div class="yellow bottomHeader"></div>
	</div>
</div>
<div id="leftColumn">
	<div class="square">
		<div class="property">New York<br>Avenue</div>
		<div class="orange rightHeader">&nbsp;</div>
	</div>
	<div class="square">
		<div class="property">Tennessee Avenue</div>
		<div class="orange rightHeader">&nbsp;</div>
	</div>
	<div class="square">
		<div class="full property">
			Community Chest
			<img src="CommunityChest.jpg" width="60px">
		</div>
	</div>
	<div class="square">
		<div class="property">St. James Place</div>
		<div class="orange rightHeader">&nbsp;</div>
	</div>
	<div class="square">
		<div class="full property">
			<div class="floatLeft">
				Penn-<br>sylvania<br>Railroad
			</div>
			<img src="RR2.jpg" width="50px">
		</div>
	</div>
	<div class="square">
		<div class="property">Virginia Avenue</div>
		<div class="pink rightHeader">&nbsp;</div>
	</div>
	<div class="square">
		<div class="property">States Avenue</div>
		<div class="pink rightHeader">&nbsp;</div>
	</div>
	<div class="square">
		<div class="full property">
			Electric Company
			<div>
				<img src="ElectricCompany.jpg" width="50px">
			</div>
		</div>
	</div>
	<div class="square">
		<div class="property">St. Charles Place</div>
		<div class="pink rightHeader">&nbsp;</div>
	</div>
</div>
<form>
	<textarea id="GuessName" rows="30" autofocus></textarea>
	<div id="navigation">
		<button type="button" name="Roll">Click here to move the piece around the board</button>
	</div>
</form>
<div id="rightColumn">
	<div class="square">
		<div class="green leftHeader">&nbsp;</div>
		<div class="property">Pacific<br>Avenue</div>
	</div>
	<div class="square">
		<div class="green leftHeader">&nbsp;</div>
		<div class="property">North<br>Carolina<br>Avenue</div>
	</div>
	<div class="square">
		<div class="full property">
			Community Chest
			<img src="CommunityChest.jpg" width="60px">
		</div>
	</div>
	<div class="square">
		<div class="green leftHeader">&nbsp;</div>
		<div class="property">Pennsylvania<br>Avenue</div>
	</div>
	<div class="square">
		<div class="full property">
			<img src="RR4.jpg" class="floatLeft" width="50px">
			Short<br>Line
		</div>
	</div>
	<div class="square" id="Chance3">
		<div class="full property">Chance</div>
	</div>
	<div class="square">
		<div class="blue leftHeader">&nbsp;</div>
		<div class="property">Park Place</div>
	</div>
	<div class="square">
		<div class="full property">
			<img src="LuxuryTax.jpg" width="50px" class="floatLeft">
			Luxury<br>Tax
		</div>
	</div>
	<div class="square">
		<div class="blue leftHeader">&nbsp;</div>
		<div class="property">Boardwalk</div>
	</div>
</div>
<div id="bottomRow">
	<div class="square" id="JustVisiting">
		<div class="full property">Just Visiting</div>
	</div>
	<div class="square">
		<div class="lightBlue topHeader">&nbsp;</div>
		<div class="property">Connecticut Avenue</div>
	</div>
	<div class="square">
		<div class="lightBlue topHeader">&nbsp;</div>
		<div class="property">Vermont Avenue</div>
	</div>
	<div class="square">
		<div class="full property">
			<img src="Chance1.jpg" width="30px" class="floatLeft">
			Chance
		</div>
	</div>
	<div class="square">
		<div class="lightBlue topHeader">&nbsp;</div>
		<div class="property">Oriental Avenue</div>
	</div>
	<div class="square">
		<div class="full property">
			Reading Railroad
			<div>
				<img src="RR1.jpg" width="60px">
			</div>
		</div>
	</div>
	<div class="square" id="IncomeTax">
		<div class="full property">Income Tax</div>
	</div>
	<div class="square">
		<div class="purple topHeader">&nbsp;</div>
		<div class="property">Baltic</div>
	</div>
	<div class="square">
		<div class="full property">
			Community Chest
			<img src="CommunityChest.jpg" width="60px">
		</div>
	</div>
	<div class="square">
		<div class="purple topHeader">&nbsp;</div>
		<div class="property">Mediter- ranean Avenue</div>
	</div>
	<div class="square">
		<div class="full property">
			<img src="Go.jpg" width="70px">
		</div>
	</div>
</div>
<div hidden id="Player1">&#x265b;</div>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> 
<script>
var dom = {}
dom.Player1 = $('#Player1')

$(window).resize(resized)
resized()
function resized() {
	var myHeight = window.innerHeight - 40
	var myWidth = window.innerWidth - 40
	$('#topRow .square').each(topRow)
	function topRow(idx,element) {
		this.style.left = 10 + myWidth / 11 * idx + 'px'
		this.style.width = myWidth / 11 + 'px'
		this.style.height = myHeight / 11 + 'px'
	}
	$('#leftColumn .square').each(leftColumn)
	function leftColumn(idx,element) {
		this.style.top = 10 + (myHeight / 11 * (idx+1)) + 'px'
		this.style.width = myWidth / 11 + 'px'
		this.style.height = myHeight / 11 + 'px'
	}
	$('#rightColumn .square').each(rightColumn)
	function rightColumn(idx,element) {
		this.style.top = 10 + (myHeight / 11 * (idx+1)) + 'px'
		this.style.width = myWidth / 11 + 'px'
		this.style.height = myHeight / 11 + 'px'
		this.style.left = 10 + myWidth / 11 * 10 + 'px'
	}
	$('#bottomRow .square').each(bottomRow)
	function bottomRow(idx,element) {
		this.style.top = 10 + (myHeight / 11 * 10) + 'px'
		this.style.left = 10 + myWidth / 11 * idx + 'px'
		this.style.width = myWidth / 11 + 'px'
		this.style.height = myHeight / 11 + 'px'
	}
	$('.property').each(Properties)
	function Properties() {
		this.style.height = myHeight / 11 - 20 + 2
	}
	$('.full').each(fullProperty)
	function fullProperty() {
		this.style.height = myHeight / 11
	}
	document.forms[0].style.left = 10 + myWidth / 11 + 10 + 'px'
	document.forms[0].style.top = 10 + (myHeight / 11) + 10 + 'px'
	document.forms[0].style.height = myHeight - (myHeight / 11) * 2 + 'px'
	document.getElementById('GuessName').style.width = myWidth / 11 * 9 / 2 + 'px'
	document.getElementById('GuessName').style.height = myHeight / 11 * 9 - 20 + 'px'
	document.getElementById('navigation').style.left = myWidth / 11 * 9 / 2 + 'px'
	document.getElementById('navigation').style.top = myHeight / 11 + 'px'

	$('#leftColumn .property').each(leftColumnProperty)
	function leftColumnProperty() {
		this.style.height = myHeight / 11
		this.style.width = myWidth / 11 - 20
	}
	$('.rightHeader').each(rightHeader)
	function rightHeader() {
		this.style.height = myHeight / 11
	}
	$('#leftColumn .full').each(leftColumnFull)
	function leftColumnFull() {
		this.style.width = myWidth / 11
	}

	$('#rightColumn .property').each(rightColumnProperty)
	function rightColumnProperty() {
		this.style.height = myHeight / 11
		this.style.width = myWidth / 11 - 20
	}
	$('#rightColumn .full').each(rightColumnFull)
	function rightColumnFull() {
		this.style.width = myWidth / 11
	}
	$('.leftHeader').each(leftHeader)
	function leftHeader() {
		this.style.height = myHeight / 11
	}

	var Variables = {}
	Variables.die1 = roll()
	Variables.die2 = roll()
	Variables.die1 = 1
	Variables.die2 = 100
	var column = 1
	var row = 1
	myLeft = column*myWidth/11 - myWidth/11/2
	myTop = row*myHeight/11 - myHeight/11/2
	document.getElementById('Player1').style.left = myLeft
	document.getElementById('Player1').style.top = myTop
	dom.Player1.removeAttr('hidden')

	function roll() {
		return Math.floor(Math.random() * 6) + 1
	}
	
	function MoveMe1() {
		if (row === 11 && column !== 1) {
			column -= 1
		} else if (column === 1 && row !== 1) {
			row -= 1
		} else if (row === 1 && column !== 11) {
			column += 1
		} else if (column === 11) {
			row += 1
		}
		myLeft = column*myWidth/11 - myWidth/11/2
		myTop = row*myHeight/11 - myHeight/11/2
		dom.Player1.animate({left:myLeft ,top:myTop},'fast',placePosition)
	}
	function placePosition() {
		if (Variables.Counter < Variables.die1 + Variables.die2) {
			setTimeout(MoveMe1,250)
		}
		Variables.Counter += 1
	}
	$('[name=Roll]').click(newTurn)
	function newTurn() {
		Variables.Counter = 0
		placePosition()
	}


}


/*
$('.rightHeader:eq(0)').append('<img src="../../emoji/hotel.png" width="25">')
$('.rightHeader:eq(1)').append('<img src="../../emoji/hotel.png" width="25">')
$('.rightHeader:eq(2)').append('<img src="../../emoji/hotel.png" width="25">')
$('.bottomHeader:eq(3)').append('<img src="../../emoji/house.png" width="25">')
$('.bottomHeader:eq(3)').append('<img src="../../emoji/house.png" width="25">')
$('.bottomHeader:eq(3)').append('<img src="../../emoji/house.png" width="25">')
$('.bottomHeader:eq(3)').append('<img src="../../emoji/house.png" width="25">')
$('.bottomHeader:eq(4)').append('<img src="../../emoji/house.png" width="25">')
$('.bottomHeader:eq(4)').append('<img src="../../emoji/house.png" width="25">')
$('.bottomHeader:eq(4)').append('<img src="../../emoji/house.png" width="25">')
$('.bottomHeader:eq(4)').append('<img src="../../emoji/house.png" width="25">')
$('.bottomHeader:eq(5)').append('<img src="../../emoji/house.png" width="25">')
$('.bottomHeader:eq(5)').append('<img src="../../emoji/house.png" width="25">')
$('.bottomHeader:eq(5)').append('<img src="../../emoji/house.png" width="25">')
$('.bottomHeader:eq(5)').append('<img src="../../emoji/house.png" width="25">')
*/
</script>
</body>
</html>
