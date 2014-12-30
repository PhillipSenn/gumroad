google.load('visualization', '1', {packages: ['corechart']})
google.setOnLoadCallback(drawChart)
var myChart

function drawChart() {
	var local = {}
	myChart = google.visualization.arrayToDataTable([])
	myChart.addColumn('string', 'Day')
	myChart.addColumn('number', 'Earned')
	myChart.addColumn('number', 'Class Average')

	// local.type = 'GET'
	local.url = 'Activity.cfc'
	local.dataType = 'json'
	local.data = {}
	local.data.method = 'Accumulated'
	local.Promise = $.ajax(local)
	local.Promise.done(done)
	local.Promise.fail(fail)
}
function done(response) {
	var local = {}
	local.arr = []
	debugger
	for (var i=0; i<response.DATA.length; i++) {
		local.arr[0] = '' + response.DATA[i][0] // Counter
		local.arr[1] = 0 + response.DATA[i][1] // Earned
		local.arr[2] = 0 + response.DATA[i][2] // Average
		myChart.addRow(local.arr)
	}
	new google.visualization.LineChart($('#visualization')[0]).draw(
		myChart, {
			curveType: 'function',
			width: 900, 
			height: 500,
			title:$('#UsrName').val(),
			hAxis: {
				title: 'Day'
			},
			vAxis: {
				title: 'Stats',
				minValue: 0
			}
		}
	)
	$('h1').hide()
}
/*
function fail(xhr,status,response) {
	$('#failStatus').text(status + ': ')
	$('#errorThrown').text(response)
	$('#xhrResponse').html(xhr.responseText)
	debugger
}
*/
