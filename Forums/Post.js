dom.ActSort = $('[name=ActSort]')

$('input[name=hideMyUpVotes]').on('click',hideMyUpVotes)
function hideMyUpVotes() {
	window.location.replace('Post.cfm?ActSort=' + dom.ActSort.val() + '&hideMyUpVotes=' + $(this).is(':checked'))
}
