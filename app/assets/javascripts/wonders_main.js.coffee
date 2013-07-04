# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	$('[rel=popover]').popover(
		placement:'bottom',
		html: true,
		content: ->
			$('#popover_content_wrapper').html());

$(document).on('page:load', ready)
$(document).ready(ready)