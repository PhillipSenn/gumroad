dom.hideCorrectAnswers = $('#hideCorrectAnswers')

;(function() {
	var Variables = {}
	Variables.start = function(myEvent, ui ) {
		$(this).addClass('btn-info')
	}
	Variables.stop = function(myEvent, ui ) {
		$(this).removeClass('btn-info')
	}
	Variables.revert = true
	$('.AnswerID').draggable(Variables)
})()

;(function() {
	var myDroppable = {}
	myDroppable.over = function(myEvent, ui ) {
		$(this).removeClass('ui-state-error').addClass('ui-state-highlight')
	}
	myDroppable.out = function(myEvent, ui ) {
		$(this).removeClass('ui-state-highlight')
	}
	myDroppable.drop = function(myEvent, ui ) {
		var local = {}

		$('.progress-bar').parent().addClass('active progress-striped')
		local.type = 'POST'
		local.url = 'Matching.cfc'
		local.dataType = 'json'
		local.data = {}
		local.data.method = 'Save'
		local.data.GuessID = myEvent.target.id
		local.data.GuessID = local.data.GuessID.substr(5) // Guess123
		local.data.AnswerID = ui.draggable[0].id
		local.data.AnswerID = local.data.AnswerID.substr(6) // Answer123
		local.context = local.data
		local.Promise = $.ajax(local)
		local.Promise.done(done)
		local.Promise.fail(fail)
	}
	$('.GuessID').droppable(myDroppable)

	function done(response,status,xhr) {
		var local = {}
		local.Earned = response.DATA[0][0]
		local.SumEarned = response.DATA[0][1]
		if (local.Earned) {
			$('#Answer' + this.AnswerID).removeClass('ui-state-error').addClass('ui-state-focus').prepend('&#10004;')
			$('#Guess' + this.GuessID).removeClass('ui-state-error ui-state-highlight ui-droppable').addClass('ui-state-focus').append('&#10004;')
			$('.progress-bar').css({width: local.SumEarned + '%'})
			$('#Earned').text('Earned: ' + local.SumEarned)
			if (local.SumEarned >= 100) {
				// dom.hideCorrectAnswers.removeAttr('checked') // showCorrectAnswers()!
				// window.location = 'MatchingDone.cfm?ActSort=' + $('#ActSort').val()
			} else {
				setTimeout(RemoveActive,900)
			}
			hideCorrectAnswers()
			
		} else {
			RemoveActive()
			$('#Answer' + this.AnswerID).addClass('ui-state-error')
			$('#Guess' + this.GuessID).addClass('ui-state-error')
		}
	}
	function RemoveActive() {
		$('.progress-bar').parent().removeClass('active progress-striped')
	}
	function fail(xhr,status,response) {
		dom.fail(xhr,status,response)
	}
	
	dom.hideCorrectAnswers.click(hideCorrectAnswers)
	function hideCorrectAnswers() {
		
		if (dom.hideCorrectAnswers.is(':checked')) {
			$('.ui-state-focus').slideUp('slow')
		} else {
			$('.ui-state-focus').slideDown('slow')
		}
	}
})()

;(function() {
	$(document).on('change','select',selectChanged)
	function selectChanged() {
		$(this).closest('form').submit()
	}
})()