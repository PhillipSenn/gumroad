keyLog = function() {
	var Variables = {}
	Variables.GuessID = $('[name=GuessID]').val()
	Variables.which = 0 /* A=65 */
	Variables.key = []

	$(document).on('keypress',keypress)
	function keypress(myEvent) {
		var local = {}
		local.url = fw.home + '/com/KeyLog.cfc'
		local.data = {}
		Variables.which = myEvent.which
		local.dataType = 'text'
		local.data.method = 'Save'
		local.data.GuessID = Variables.GuessID
		local.data.KeyLogSort = myEvent.which /* Known as keyCode in vanilla JavaScript */
		local.Promise = $.ajax(local)
		local.Promise.fail(fail)
	}

	window.onkeydown = function(myEvent) {
		var local = {}
		
		if (myEvent.keyCode === 8) {
			local.url = fw.home + '/com/KeyLog.cfc'
			local.data = {}
			local.data.method = 'Save'
			local.data.GuessID = Variables.GuessID
			if (Variables.key[17]) { // Ctrl
				local.data.KeyLogSort = myEvent.keyCode - 64
			} else {
				local.data.KeyLogSort = myEvent.keyCode
			}
			local.Promise = $.ajax(local)
		}
		Variables.key[myEvent.keyCode] = true
	}
	window.onkeyup = function(myEvent) {
		Variables.key[myEvent.keyCode] = false
	}
}
keyLog()

