dom.GuessName = $('[name=GuessName]')

;(function() {
	var GuessName = dom.GuessName.val()
	$(document).on('keyup',dom.GuessName,keyup)
	function keyup() {
		if ($(this).val() != GuessName) {
			$('#otherAssignments').hide()
			$('[name=Save]').removeAttr('disabled')
			dom.msg.empty().removeClass('label-info')
		}
	}
	$('#reset').click(myReset)
	function myReset() {
		if (confirm('Are you sure?')) {
			dom.GuessName.val($('#AnswerName').html())
		}
	}
})()
