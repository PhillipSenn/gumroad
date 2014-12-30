(function() {
	local.url = 'Monopoly.cfc'
	local.dataType = 'text' // Unexpected end of input
	local.data = {}
	local.data.method = 'Move'
	local.data.GuessID = $('[name=GuessID]').val()
	local.Promise = $.ajax(local)
	local.Promise.done(done)
	local.Promise.fail(fail)

})()