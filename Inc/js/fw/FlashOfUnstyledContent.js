/* 
If you use class="fouc", it won't appear until the page has loaded.
*/
fw.FlashOfUnstyleContent = function() {
	var result = $('.fouc')
	if (result.length) {
		result.show('fast')
	}
}
fw.FlashOfUnstyleContent()
