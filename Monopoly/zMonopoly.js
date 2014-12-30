// $('.modal').modal('show')
window.done = function() {
	window.location.replace(location.href)
}
window.timer = 0

;(function() {
	$(document).on('keyup','[name=partAGuessName]',StartTheTimer)
	function StartTheTimer() {
		clearTimeout(window.timer)
		window.timer = setTimeout(Save,3000)
	}
	function Save(myEvent) {
		var local = {}
		if (myEvent.which >= 32) {
			local.url = 'Monopoly.cfc'
			local.type = 'POST';
			local.dataType = 'text' // Unexpected end of input
			local.data = {}
			local.data.method = 'Save'
			local.data.GuessID = $('[name=partAGuessID]').val()
			local.data.GuessName = $(this).val()
			local.Promise = $.ajax(local)
			local.Promise.done(done)
			local.Promise.fail(fail)
		}
	}
})()

;(function() {
	$(document).on('keypress','[name=cssGuessName]',Save)
	function Save() {
		var local = {}

		local.url = 'Monopoly.cfc'
		local.type = 'POST';
		local.dataType = 'text' // Unexpected end of input
		local.data = {}
		local.data.method = 'Save'
		local.data.GuessID = dom.cssGuessID.val()
		local.data.GuessName = dom.cssGuessName.val()
		local.Promise = $.ajax(local)
		local.Promise.done(done)
		local.Promise.fail(fail)
	}
})()

