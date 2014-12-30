dom.chats = $('#chats')
dom.hideMyUpVotes = $('input[name=hideMyUpVotes]')
dom.hideMyChats = $('input[name=hideMyChats]')
dom.ActSort = $('[name=ActSort]')
dom.OtherUsrID = $('[name=OtherUsrID]')

;(function() {
	var Variables = {}
	Variables.DateTime = '2000-12-31T23:59:59.999' // string!
	Variables.UsrID = fw.int($('input[name=UsrID]').val()) // Don't allow upvoting of your own chats.

	function Watcher() {
		var local = {}
		var result
		
		local.url = 'ChatNap.cfc'
		local.data = {}
		local.data.method = 'WhereChatDateTimeGT' // Check every second, and come back after 30 seconds if there's been no change.
		local.data.ChatDateTime = Variables.DateTime
		result = $.ajax(local)
		result.done(done)
		result.fail(fail)
	}
	Watcher()

	function done(response) {
		var local = {}
		var result
		
		if (!response) { // onApplicationStart will cause this
			window.location = dom.fw.home
		}
		if (response > Variables.DateTime) {
			Variables.newDateTime = response

			local.url = 'Chat.cfc'
			local.data = {}
			local.data.method = 'WhereGuessDateTimeGT'
			local.data.GuessDateTime = Variables.DateTime
			local.data.OtherUsrID = dom.OtherUsrID.val()
			result = $.ajax(local) // < IE 9
			result.done(GuessDone)
			result.fail(fail)
		} else {
			setTimeout(Watcher,1000)
			// todo: if there's no keyboard or mouse activity, then sleep for 30 seconds instead of 1.
		}
	}
	function GuessDone(response) {
		var local = {}
		var result = ''
		for (var i=0; i< response.DATA.length; i++) {
			local.PersonName		= response.DATA[i][0]
			local.FirstName		= response.DATA[i][1]
			local.GuessName		= response.DATA[i][2]
			local.GuessDateTime	= response.DATA[i][3]
			local.GuessID			= response.DATA[i][4]
			local.UsrID				= response.DATA[i][5]
			local.AlreadyVoted	= response.DATA[i][6]
			if (local.UsrID === Variables.UsrID) { 
				result = '<tr id="' + local.GuessID + '">'
			} else {
				result = '<tr id="' + local.GuessID + '">'
			}
			result += '<td class="cursorHelp" title="' + local.PersonName + '">'
			if (dom.OtherUsrID.val()) {
				result += local.FirstName
			} else {
				result += '<a href="Chat.cfm?ActSort=' + dom.ActSort.val()
				result += '&OtherUsrID=' + local.UsrID
				result += '">'
				result += local.FirstName
				result += '</a>'
			}
			result += '</td>'
			result += '<td>' + local.GuessName + '</td>'
			local.D = local.GuessDateTime
			local.D = new Date(local.D)
			result += '<td class="date" data-date="' + local.D.valueOf() + '">' + (local.D.getMonth()+1) + '/' + local.D.getDate() + '</td>'
			result += '<td class="time" data-time="' + local.D.valueOf() + '">'
			local.minutes = fw.right('0' + local.D.getMinutes(),2)
			result += local.D.getHours() + ':' + local.minutes + '</td>'
			if (local.UsrID === Variables.UsrID) { 
				result += '<td class="myOwnPost cursorPointer" data-guessid="' + local.GuessID + '">'
				result += '<img hidden src="delete_Icon.jpg" width="24px">'
				result += '</td>'
			} else if (local.AlreadyVoted) {
				result += '<td>'
				result += '<img src="thumbsUp.png" width="24px">'
				result += '</td>'
			} else {
				result += '<td>'
				result += '<img class="upvote" data-guessid="' + local.GuessID + '" src="thumbsUpGrayscale.gif" width="24px">'
				result += '</td>'
			}
			result += '<td class="num"></td>'
			result += '</tr>'
			dom.chats.append(result)
		}
		local.url = 'Vote.cfc'
		local.data = {}
		local.data.method = 'WhereVoteDateTimeGT'
		local.data.VoteDateTime = Variables.DateTime
		result = $.ajax(local)
		result.done(VoteDone)
		result.fail(fail)
	}
	function VoteDone(response) {
		var local = {}

		for (var i=0; i< response.DATA.length; i++) {
			local.GuessID	= response.DATA[i][0]
			local.Votes 	= response.DATA[i][1]
			$('#' + local.GuessID).find('td:last').text(local.Votes)
		}
		Variables.DateTime = Variables.newDateTime
		setTimeout(Watcher,1000)
	}
})()

;(function() {
	$(document).on('click','#Save',Save)
	function Save() {
		var local = {}
		var result
		
		local.url = 'Chat.cfc'
		local.type = 'post'
		local.data = {}
		local.data.method = 'Save'
		local.data.PaperID = $('#PaperID').val()
		local.data.GuessName = $('#GuessName').val()
		if (local.data.GuessName) {
			result = $.ajax(local) // < IE 9
			result.done(done)
			result.fail(fail)
		}
	}
	function done(response) {
		$('#GuessName').val('').focus()
	}

})()

;(function() {
	$(document).on('click','img.upvote',clicked)
	function clicked() {
		$(this).attr('src','thumbsUp.png').removeClass('upvote') // Right away - don't wait for the callback
		var local = {}
		var result
		
		local.url = 'Vote.cfc'
		local.type = 'post'
		local.context = this
		local.data = {}
		local.data.method = 'Save'
		local.data.GuessID = $(this).data('guessid')
		result = $.ajax(local)
		result.done(done)
		result.fail(fail)
	}
	function done(response) {
		if (dom.hideMyUpVotes.is(':checked')) {
			$(this).closest('tr').slideUp('slow')
		}
	}
})()

$('input[name=hideMyUpVotes]').on('click',hideMyUpVotes)
function hideMyUpVotes() {
	window.location.replace('Chat.cfm?ActSort=' + dom.ActSort.val() + '&hideMyUpVotes=' + $(this).is(':checked'))
}
$('input[name=hideMyChats]').on('click',hideMyChats)
function hideMyChats() {
	window.location.replace('Chat.cfm?ActSort=' + dom.ActSort.val() + '&hideMyChats=' + $(this).is(':checked'))
}
$('input[name=showOther]').on('click',showOther)
function showOther() {
	window.location.replace('Chat.cfm?ActSort=' + dom.ActSort.val())
}

$(document).on('mouseenter','#chats td.myOwnPost',mouseenter)
$(document).on('mouseleave','#chats td.myOwnPost',mouseleave)
function mouseenter() {
	$(this).find('img').prop('hidden',false)
}
function mouseleave() {
	$(this).find('img').prop('hidden',true)
}

(function() {
	var Variables = {}
	
	$(document).on('click','#chats td.myOwnPost',confirmDelete)
	function confirmDelete() {
		Variables.context = this
		Variables.GuessID = $(this).closest('tr').attr('id')
		$('#deleteMe').modal('show')
	}

	$('[name=Delete]').on('click',deleteConfirmed)
	function deleteConfirmed() {
		var local = {}
		var result
		local.url = 'Chat.cfc'
		local.context = Variables.context
		local.data = {}
		local.data.method = 'Delete'
		local.data.GuessID = Variables.GuessID
		result = $.ajax(local)
		result.done(done)
		result.fail(fail)
	}
	function done() {
		$(this).closest('tr').slideUp('slow',hideModal)
		function hideModal() {
			$('#deleteMe').modal('hide')
		}
	}
})()
