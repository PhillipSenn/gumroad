Stripe.setPublishableKey('pk_WMRAFml8LGNp9ryfsctbhECkE84jE') // Test\
dom.form = $('form')

;(function() {
	$(document).on('click','[name=Save]',clicked)
	
	function clicked() {
		$(this).prop('disabled',true)
		Stripe.card.createToken(dom.form,done) // Ask Stripe to create a one time token before truly submitting the form.
	}
	
	function done(status, response) {
		if (response.error) {
			dom.form.find('[name=Save]').removeAttr('disabled') // Enabled
			dom.msg.text(response.error.message).addClass('label-danger') // You must supply either a card, customer, or bank account to create a token.
			return
		}
		dom.form.append($('<input type="hidden" name="card">').val(response.id))
		dom.form.submit()
	}
})();


;(function() {
	$(document).on('change','[name=PersonName]',changed)
	function changed() {
		dom.msg.removeClass('label-info')
		if ($(this).val().length === 0) {
			dom.msg.text('Please enter a name').addClass('label-info')
		}
	}
})();
