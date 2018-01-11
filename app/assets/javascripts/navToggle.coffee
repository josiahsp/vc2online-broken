$(document).on "ready page:change", ->
	$('#navbutton').click ->
		$('#navmenu').toggleClass('visible')