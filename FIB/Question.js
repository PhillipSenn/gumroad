Ding = new Audio('uinpuzz.wav') // http://www.qwizx.com/gssfx/usa/wof.htm
Buzz = new Audio('http://www.qwizx.com/gssfx/usa/ubuzzer.wav')
Applause = new Audio('Applause.wav') // C:\Program Files\Microsoft Office 15\root\office15\MEDIA

$('#Save').removeClass('btn-primary').addClass('btn-default')

;(function() {
	var Variables = {}
	Variables.letter = ''
	Variables.rotateInterval
	Variables.rotateDegrees=0
	
	function FixUsrName(AnswerName,GuessName) {
		var i,local = {}
		
		local.str = ''
		local.goVanna = false
		local.Finished = true
		for (i=0; i< AnswerName.length; i++) {
			local.letter = AnswerName.substr(i,1).toUpperCase()
			if (local.letter === ' ') {
				local.str += ' '
			} else if (GuessName.toUpperCase().indexOf(local.letter) > -1) {
				if (local.letter === Variables.letter) {
					local.str += '<span data-letter="' + local.letter + '" class="Vanna btn btn-lg btn-primary">&nbsp;</span>'
					local.goVanna = true
				} else {
					local.str += '<span class="btn btn-lg btn-primary">' + local.letter + '</span>'
				}
				if (i==0) {
					if ('AEIOU'.indexOf(local.letter) > -1) {
						$('#n').text('n')
					} else {
						$('#n').html('&nbsp;')
					}
				}
			} else {
				local.str += '<span class="btn btn-lg btn-default">&nbsp;</span>'
				local.Finished = false
			}
		}
		if (local.Finished) {
			$('#spinner').slideUp('slow')
			$('#Save').removeAttr('disabled').removeClass('btn-default').addClass('btn-primary')
		}
		$('#UsrName').html(local.str)
		if (local.goVanna) {
			Ding.play()
			setTimeout(goVanna,1000)
		}
		
		local.Earned = 10
		for (i=0; i < GuessName.length; i++) {
			local.letter = GuessName.substr(i,1).toUpperCase()
			if (AnswerName.toUpperCase().indexOf(local.letter) > -1) {
				$('#Letter' + local.letter).addClass('btn-success').removeClass('available')
			} else {
				$('#Letter' + local.letter).addClass('btn-danger').removeClass('available')
				local.Earned = (local.Earned > 1) ? local.Earned -=1 : 1
				if ('AEIOU'.indexOf(local.letter) > -1) {
					local.Earned = (local.Earned > 1) ? local.Earned -=1 : 1
				}
			}
		}
		$('#Earned').text(local.Earned)
		$('input[name=Earned]').val(local.Earned)
		Variables.letter = ''
	}


	Read()
	function Read() {
		var local = {}

		local.global		= false
		local.context		= this
		local.type 			= 'GET'
		local.dataType		= 'json'
		local.url			= 'FIB.cfc'
		local.data			= {}
		local.data.method	= 'Read'
		local.data.GuessID= $('input[name=GuessID]').val()
		local.Promise		= $.ajax(local)
		local.Promise.done(ReadDone)
		local.Promise.fail(ReadFail)
	}
	
	function ReadDone(response, status,xhr) {
		var local = {}

		if (response.DATA.length) {
			local.GuessName = response.DATA[0][0].toUpperCase()
			local.AnswerName = response.DATA[0][1].toUpperCase()
			FixUsrName(local.AnswerName,local.GuessName)
		}
		local.myArray = $('#UsrName .btn')
		Variables.rotateDegrees=180
		local.Rotate = startYRotate.bind(this,local.myArray)
		Variables.rotateInterval = setInterval(local.Rotate,10)
	}
	function ReadFail(xhr,status,response) {
		dom.fail(xhr,status,response)
	}


	$(document).on('click','.available',availableClicked)
	function availableClicked(myEvent) {
		LetterChosen($(this).text())
	}
	key('A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,0,1,2,3,4,5,6,7,8,9',myKeyMaster)
	function myKeyMaster(myEvent, handler) {
		LetterChosen(handler.key)
	}
	function LetterChosen(argLetter) {
		var local = {}

		Variables.letter = argLetter
		
		local.global		= false
		local.type			= 'POST'
		local.dataType		= 'json'
		local.url			= 'FIB.cfc'
		local.data			= {}
		local.data.method	= 'GuessLetter'
		local.data.GuessID= $('input[name=GuessID]').val()
		local.data.letter	= argLetter
		local.context		= local.data
		local.Promise		= $.ajax(local)
		local.Promise.done(done)
		local.Promise.fail(fail)
	}
	function done(response,status,xhr) {
		var local = {}

		if (response.DATA.length) {
			local.GuessName = response.DATA[0][0].toUpperCase()
			local.AnswerName = response.DATA[0][1].toUpperCase()
		}
		if (local.AnswerName.indexOf(this.letter) === -1) {
			Buzz.play()
		}
		FixUsrName(local.AnswerName,local.GuessName)
	}
	function fail(xhr,status,response) {
		dom.fail(xhr,status,response)
	}

	function goVanna() {
		var local = {}
		
//		local.myArray = $('.Vanna') // I don't know why it's getting into an infinite loop here if I have two or more characters.
//		debugger
//		Variables.rotateDegrees=180
//		local.Rotate = startYRotate.bind(this,local.myArray)
//		Variables.rotateInterval = setInterval(local.Rotate,10)
		$('.Vanna').each(function(index, element) {
			var local = {}
			Variables.letter = $(this).data('letter')
			$(this).removeClass('Vanna').text(Variables.letter)
		})
		if (!$('#UsrName .btn-default').length) {
			$('#UsrName .btn-primary').removeClass('btn-primary').addClass('btn-success')
			$('#spinner').slideUp('slow')
			$('#Save').removeAttr('disabled').removeClass('btn-default').addClass('btn-primary')
			Applause.play()
		}
	}

	function startYRotate(myArray) {
		var local = {}
		
		local.el = myArray[0]
		Variables.rotateDegrees+=7
		local.el.style.transform="rotateY(" + Variables.rotateDegrees + "deg)"
		local.el.style.webkitTransform="rotateY(" + Variables.rotateDegrees + "deg)"
		local.el.style.OTransform="rotateY(" + Variables.rotateDegrees + "deg)"
		local.el.style.MozTransform="rotateY(" + Variables.rotateDegrees + "deg)"
		if (Variables.rotateDegrees >= 360) {
			clearInterval(Variables.rotateInterval)
			if (myArray.length > 1) {
				local.Rotate = startYRotate.bind(this,myArray.slice(1))
				Variables.rotateDegrees=0
				Variables.rotateInterval = setInterval(local.Rotate,1)
			}
		}
	}
})()

