dom.classmates = $('#classmates')

;(function() {
	var Variables = {}
	Variables.StartTime = new Date()
	Variables.Counter = 0
	
	var local = {}
	local.url = fw.home + '/com/KeyLog.cfc'
	local.data = {}
	local.data.method = 'WhereGuessID'
	local.data.GuessID = $('[name=GuessID]').val()
	local.Promise = $.ajax(local)
	local.Promise.done(done)
	local.Promise.fail(fail)
	function done(response) {
		if (!response.DATA.length) return
		var i = 0
		//    UsrID = response.DATA[i][0]
		var UsrName = response.DATA[i][1]
		var KeyLogSort = response.DATA[i][2]
		var elapsed = response.DATA[i][3]
		var UsrID   = 0
		setTimeout(myCode,elapsed) /* Wait until the right start time */
		function myCode() {
			if (UsrID != response.DATA[i][0]) {
				UsrID = response.DATA[i][0]
				dom.classmates.append('<div id=' + UsrID + '></div>')
				dom.UsrID = $('#' + UsrID)
				Variables.UsrName = response.DATA[i][1] + ': '
				Variables.Counter = 0
				typeTheirNameFirst() 
				setTimeout(myCode,3000) /* Wait a few seconds and then start typing their response */
			} else {
				var KeyLogSort = response.DATA[i][2]
				if (KeyLogSort === 8) {
					// var X = $('#' + UsrID).text()
					// $('#' + UsrID).text(X.substr(0,X.length-1))
					$('#' + UsrID).append('(backspace)')
				} else {
					$('#' + UsrID).append(fw.chr(KeyLogSort))
				}
				i += 1
				if (i < response.DATA.length) {
					setTimeout(myCode,(response.DATA[i][3] - response.DATA[i-1][3]))
				}
			}
		}
	}
	function typeTheirNameFirst() {
		dom.UsrID.append(Variables.UsrName.substr(Variables.Counter,1))
		Variables.Counter += 1
		if (Variables.Counter < Variables.UsrName.length) {
			setTimeout(typeTheirNameFirst,120)
		}
	}
})()

