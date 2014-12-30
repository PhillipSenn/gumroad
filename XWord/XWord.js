var request = {} // todo rename
request.Words = ','

;(function() {
	$('#Words input').each(BuildWords)
	function BuildWords() {
		request.Words += $(this).val() + ','
	}
})()

;(function() {
	var Variables = {}
	Variables.Row = parseInt($('#row').val())
	Variables.Col = parseInt($('#col').val())
	Variables.Rows = $('tbody tr').length
	Variables.Cols = $('tbody tr:first td').length
	Variables.Dir = 1 // 1 = Right, 2 = Down

	Variables.rowText = '' // Used when determining the text of a row
	tbody = $('tbody')
	$('tbody').on('click','td',tdClicked)
	function tdClicked() {
		// Print('tdClicked')
		Variables.Col = $(this).index() + 1
		Variables.Row = $(this).closest('tr').index() + 1
		MoveIt()
	}
	
	$('#letters').on('click','a',letters)
	function letters() {
		var local = {}
		
		local.which = this.id.substr(3,2)
		local.which = parseInt(local.which)
		local.td = tbody.find('tr:eq(' + (Variables.Row-1) + ') td:eq(' + (Variables.Col-1) + ')')
		if (local.td.data('letter') === local.which) {
			local.Char = String.fromCharCode(local.which)
			local.td.html('<div class="btn btn-lg btn-warning">' + local.Char + '</div>')
			CheckLR(local.td)
			CheckDN(local.td)
		}
		if (Variables.Dir === 1 && Variables.Col < Variables.Cols) {
			Variables.Col += 1
		} else if (Variables.Dir === 2 && Variables.Row < Variables.Rows) {
			Variables.Row += 1
		}
		MoveIt()
	}
	$(document).on('keydown',keydownEvent)
	$(document).on('keyup'  ,keyupEvent)
	function keydownEvent(myEvent) {
		// Print('keydownEvent(' + myEvent.which + ')')
		var local = {}
		myEvent.preventDefault()
		local.Char = String.fromCharCode(myEvent.which)
		local.MoveIt = false
		if (myEvent.which === 37 && Variables.Col > 1)  { // Left arrow
			Variables.Col -= 1
			Variables.Dir = 1 // 1 = Right, 2 = Down
			local.MoveIt = true
		} else if (myEvent.which === 8 && Variables.Col > 1)  { // Backspace
			Variables.Col -= 1
			Variables.Dir = 1 // 1 = Right, 2 = Down
			local.MoveIt = true
		} else if (myEvent.which === 38 && Variables.Row > 1)  {
			Variables.Row -= 1
			Variables.Dir = 2 // 1 = Right, 2 = Down
			local.MoveIt = true
		} else if (myEvent.which === 39 && Variables.Col < Variables.Cols)  {
			Variables.Col += 1
			Variables.Dir = 1 // 1 = Right, 2 = Down
			local.MoveIt = true
		} else if (myEvent.which === 40 && Variables.Row < Variables.Rows)  {
			Variables.Row += 1
			Variables.Dir = 2 // 1 = Right, 2 = Down
			local.MoveIt = true
		}
		if (local.MoveIt) {
			MoveIt()
		}
	}
	function keyupEvent(myEvent) {
		// Print('keyupEvent(' + myEvent.which + ')')
		var local = {}
		myEvent.preventDefault()
		local.Char = String.fromCharCode(myEvent.which)
		if (isValid(myEvent.which)) {
			local.td = tbody.find('tr:eq(' + (Variables.Row-1) + ') td:eq(' + (Variables.Col-1) + ')')
			if (local.td.data('letter') === myEvent.which) {
				local.td.html('<div class="btn btn-lg btn-warning">' + local.Char + '</div>')
				CheckLR(local.td)
				CheckDN(local.td)
			}
			if (Variables.Dir === 1 && Variables.Col < Variables.Cols) {
				Variables.Col += 1
			} else if (Variables.Dir === 2 && Variables.Row < Variables.Rows) {
				Variables.Row += 1
			}
		}
		MoveIt()
	}
	
	function isValid(which) {
		// Print('isValid(' + which + ')')
		var local = {}
		local.result = false
		if (which >= 65 && which <= 90) { // A-Z
			local.result = true
		}
		if (which === 32) { // Space
			local.result = true
		}
		if (which === 191) { // Slash
			local.result = true
		}
		if (which >= 48 && which <= 57) { // 0-9
			local.result = true
		}
		return local.result
	}
	function MoveIt() {
		var local = {}
		
		$('#cursor').removeAttr('id')
		local.td = tbody.find('tr:eq(' + (Variables.Row-1) + ') td:eq(' + (Variables.Col-1) + ')')
		local.td.attr('id','cursor')
		if (local.td.hasClass('empty')) {
			$('#hint').empty()
		} else {
			local.hint = local.td.attr('title')
			local.hint = local.hint.replace('\n','<br>')
			$('.msg').html(local.hint)
		}
	}
	MoveIt()
	
	function CheckLR(argTD) {
		// Print('CheckLR(' + argTD.text() + ')')
		var local = {}
		local.Word = ''
		local.Start = argTD

		while(local.Start.index() > 0) {
			if (local.Start.prev().hasClass('empty')) {
				break
			}
			local.Start = local.Start.prev()
		}

		local.Stop = local.Start
		Variables.AllBlanksFilledIn = true
		do {
			local.Word += String.fromCharCode(local.Stop.data('letter'))
			if (!local.Stop.find('.btn').length) {
				Variables.AllBlanksFilledIn = false
			}
			if (local.Stop.index() >= 20) {
				break
			}
			local.Stop = local.Stop.next()
		} while(!local.Stop.hasClass('empty'))
		if (Variables.AllBlanksFilledIn) {
			if (request.Words.indexOf(',' + local.Word + ',') > -1) {
				Save(local.Start,1)
				local.td = local.Start
				for (var c=local.Start.index(); c<=local.Stop.index(); c++) {
					local.td.find('.btn-warning').removeClass('btn-warning').addClass('btn-success')
					local.td = local.td.next()
				}
			}
		}
		if (Variables.Row == 21) {
			Variables.Dir = 1 // If you're on the bottom row, then the direction should be to the right.
		} else {
			local.tr = argTD.closest('tr').next() // .parent() didn't work here.  I may want to watch out for that.
			local.td = local.tr.find('td:eq(' + argTD.index() + ')')
			if (local.td.hasClass('empty')) {
				Variables.Dir = 1 // If the next cell down is empty, then you must be going across.
			}
		}
	}

	function CheckDN(argTD) {
		// Print('CheckDN(' + argTD.text() + ')')
		var local = {}
		local.Word = ''
		local.Start = argTD

		while(local.Start.parent().index() > 0) {
			local.PrevRow = local.Start.parent().prev()
			local.PrevCell = local.PrevRow.find('td:eq(' + local.Start.index() + ')')
			if (local.PrevCell.hasClass('empty')) {
				break
			}
			local.Start = local.PrevCell
		}

		local.Stop = local.Start
		Variables.AllBlanksFilledIn = true
		do {
			local.Word += String.fromCharCode(local.Stop.data('letter'))
			if (!local.Stop.find('.btn').length) {
				Variables.AllBlanksFilledIn = false
			}
			if (local.Stop.parent().index() >= 20) {
				break
			}
			local.NextRow = local.Stop.parent().next()
			local.Stop = local.NextRow.find('td:eq(' + local.Stop.index() + ')')
		} while(!local.Stop.hasClass('empty'))
		if (Variables.AllBlanksFilledIn) {
			if (request.Words.indexOf(',' + local.Word + ',') > -1) {
				Save(local.Start,2)
				local.td = local.Start
				for (var r=local.Start.parent().index(); r<=local.Stop.parent().index(); r++) {
					local.td.find('.btn-warning').removeClass('btn-warning').addClass('btn-success')
					local.tr = local.td.parent().next()
					local.td = local.tr.find('td:eq(' + local.td.index() + ')')
				}
			}
		}
		if (Variables.Col == 21) {
			Variables.Dir = 2 // If you're at the right-hand column, then the direction should be down.
		} else if (argTD.next().hasClass('empty')) {
			Variables.Dir = 2 // If the next cell over is empty, then you must be going down.
		}
	}
	function Save(argTD,AnswerSort) {
		var local = {}

		local.type = 'POST'
		local.url = 'XWord.cfc'
		local.data = {}
		local.data.method = 'Save'
		local.data.GuessIDs = argTD.data('guessids')
		local.data.AnswerSort = AnswerSort
		local.Promise = $.ajax(local)
		local.Promise.done(done)
		local.Promise.fail(fail)
	}
	function done(response) {
		if (response.msg) {
			$('.msg').html(response.msg)
		} else {
			$('.progress-bar').css({width: response.Earned + '%'})
			$('.progress-bar').parent().addClass('active progress-striped')
			if (response.Earned >= 100) {
				$('.btn-success').removeClass('btn-success').addClass('btn-primary')
				setTimeout(Yay,1000)
			} else {
				setTimeout(RemoveActive,900)
			}
		}
		function RemoveActive() {
			$('.progress-bar').parent().removeClass('active progress-striped')
		}
	}
	
	function Yay() {
		window.location = dom.fw.home + '/Fireworks-master'
	}
})()

