<html>
<head>
<style>
#GO {
	background-image:url(GO.jpg);
}
.CommunityChest {
	background-image:url(CommunityChest.jpg);
}
#Reading {
	background-image:url(RR1.jpg);
}
#Chance1 {
	background-image:url(Chance1.jpg);
}
#JustVisiting {
	background-image:url(Jail.jpg);
}
#ElectricCompany {
	background-image:url(Electric.jpg);
}
#Pennsylvania {
	background-image:url(RR2.jpg);
}
#FreeParking {
	background-image:url(FreeParking.jpg);
}
#Chance2 {
	background-image:url(Chance2.jpg);
}
#BORailRoad {
	background-image:url(RR3.jpg);
}
#WaterWorks {
	background-image:url(WaterWorks.jpg);
}
#GoToJail {
	background-image:url(gotoJail.jpg);
}
#ShortLine {
	background-image:url(RR4.jpg);
}
#Chance3 {
	background-image:url(Chance3.jpg);
}
LuxuryTax {
	background-image:url(LuxuryTax.jpg);
}

body {
	margin-top: 0px;
}
.square {
	border: 1px solid #000;
	position: absolute;
	overflow: auto;
}
#leftColumn .square {
	left: 0px;
}
.red {
	background-color:#FF0000
}
.yellow {
	background-color:yellow
}
.property:hover {
	background-color:#999;
	color:white;
}
.full:hover {
	background-color:#999;
	color:white;
}
</style>
</head>
<body>
<div id="topRow">
	<div class="square" id="freeParking">
		<div class="full property">Free Parking</div>
	</div>
	<div class="square">
		<div class="property">Kentucky Avenue</div>
		<div class="red bottomHeader">&nbsp;</div>
	</div>
	<div class="square" id="chance2">
		<div class="full property">Chance</div>
	</div>
	<div class="square">
		<div class="property">Indiana Avenue</div>
		<div class="red bottomHeader">&nbsp;</div>
	</div>
	<div class="square">
		<div class="property">Illinois Avenue</div>
		<div class="red bottomHeader">&nbsp;</div>
	</div>
	<div class="square" id="RR3">
		<div class="full property">B &amp; O Railroad</div>
	</div>
	<div class="square">
		<div class="property">Atlantic Avenue</div>
		<div class="yellow bottomHeader">&nbsp;</div>
	</div>
	<div class="square">
		<div class="property">Ventnor Avenue</div>
		<div class="yellow bottomHeader">&nbsp;</div>
	</div>
	<div class="square" id="waterWorks">
		<div class="full property">Water Works</div>
	</div>
	<div class="square">
		<div class="property">Marvin Gardens</div>
		<div class="yellow bottomHeader">&nbsp;</div>
	</div>
	<div class="square" id="gotoJail">
		<div class="full property">Go to Jail</div>
		<div class="yellow bottomHeader"></div>
	</div>
</div>
<div id="leftColumn">
	<div class="square">
		<div class="property">New York Avenue</div>
	</div>
	<div class="square">
		<div class="property">Tennessee Avenue</div>
	</div>
	<div class="square CommunityChest">
		<div class="property">Community Chest</div>
	</div>
	<div class="square">
		<div class="property">St. James Place</div>
	</div>
	<div class="square">
		<div class="property">Pennsylvania Railroad</div>
	</div>
	<div class="square">
		<div class="property">Virginia Avenue</div>
	</div>
	<div class="square">
		<div class="property">States Avenue</div>
	</div>
	<div class="square" id="electricCompany">
		<div class="property">Electric Company</div>
	</div>
	<div class="square">
		<div class="property">St. Charles Place</div>
	</div>
</div>
<div id="rightColumn">
	<div class="square">
		<div class="property">Pacific Avenue</div>
	</div>
	<div class="square">
		<div class="property">North Carolina Avenue</div>
	</div>
	<div class="square CommunityChest">
		<div class="property">Community Chest</div>
	</div>
	<div class="square">
		<div class="property">Pennsylvania Avenue</div>
	</div>
	<div class="square">
		<div class="property">Short Line</div>
	</div>
	<div class="square" id="chance3">
		<div class="property">Chance</div>
	</div>
	<div class="square">
		<div class="property">Park Place</div>
	</div>
	<div class="square">
		<div class="property">Luxury Tax</div>
	</div>
	<div class="square">
		<div class="property">Boardwalk</div>
	</div>
</div>
<div id="bottomRow">
	<div class="square" id="justVisiting">
		<div class="property">Just Visiting</div>
	</div>
	<div class="square">
		<div class="property">Connecticut Avenue</div>
	</div>
	<div class="square">
		<div class="property">Vermont Avenue</div>
	</div>
	<div class="square" id="chance1">
		<div class="property">Chance</div>
	</div>
	<div class="square">
		<div class="property">Oriental Avenue</div>
	</div>
	<div class="square" id="Reading">
		<div class="property">Reading Railroad</div>
	</div>
	<div class="square">
		<div class="property">Income Tax</div>
	</div>
	<div class="square">
		<div class="property">Baltic</div>
	</div>
	<div class="square CommunityChest">
		<div class="property">Community Chest</div>
	</div>
	<div class="square">
		<div class="property">Mediter- ranean Avenue</div>
	</div>
	<div class="square" id="GO">
		<div class="property">GO</div>
	</div>
</div>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> 
<script>

$(window).resize(resized)
function resized() {
	var innerHeight = window.innerHeight - 20
	$('#topRow .square').each(topRow)
	function topRow(idx,element) {
		this.style.left = window.innerWidth / 11 * idx + 'px'
		this.style.width = window.innerWidth / 11 + 'px'
		this.style.height = innerHeight / 11 + 'px'
	}
	$('#leftColumn .square').each(leftColumn)
	function leftColumn(idx,element) {
		this.style.top = (innerHeight / 11 * (idx+1)) + 'px'
		this.style.width = innerWidth / 11 + 'px'
		this.style.height = innerHeight / 11 + 'px'
	}
	$('#rightColumn .square').each(rightColumn)
	function rightColumn(idx,element) {
		this.style.top = (innerHeight / 11 * (idx+1)) + 'px'
		this.style.width = innerWidth / 11 + 'px'
		this.style.height = innerHeight / 11 + 'px'
		this.style.left = window.innerWidth / 11 * 10 + 'px'
	}
	$('#bottomRow .square').each(bottomRow)
	function bottomRow(idx,element) {
		this.style.top = (innerHeight / 11 * 10) + 'px'
		this.style.left = window.innerWidth / 11 * idx + 'px'
		this.style.width = window.innerWidth / 11 + 'px'
		this.style.height = innerHeight / 11 + 'px'
	}
	$('#topRow .property').each(topRowProperty)
	function topRowProperty() {
		this.style.height = innerHeight / 11 - 20 + 1
	}
	$('.full').each(fullProperty)
	function fullProperty() {
		this.style.height = innerHeight / 11
	}
}
resized()
</script>
</body>
</html>
