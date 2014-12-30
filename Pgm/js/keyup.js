// Go easy on this use. 
// I think it's retaining the old code plus adding this one.
;(function() {
	$('[name=GuessName]').on('keyup',keyup)
	function keyup() {
		var result = '<script id="myScript">' + $(this).val() + '</scr'+'ipt>'
		$('#myScript').remove()
		$('body').append($(result)[0])
	}
})();
