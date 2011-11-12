# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

	$('.add_button').click (event) -> 
		event.preventDefault()
		$.post(
				"/names.json"
				name: $('#name').val()
				-> 
					alert('Added Successfully!')
				'json'
			)
			.error (response) -> 
				response = $.parseJSON(response.responseText)
				alert("Name " + response.name)