(function() {
	$(document).on('change','input[type=checkbox]',checkboxChanged);
	function checkboxChanged() {
		$(this).closest('form').submit();
	};
	$('a').hover(function() {
		var classes = $(this).attr('class').split(" ");
		$.each(classes, function(Index, myClass) {
			if (myClass === 'btn-danger') {
			} else {
				$('a.' + myClass).toggleClass('btn-info');
			}
		});
	});
})();
