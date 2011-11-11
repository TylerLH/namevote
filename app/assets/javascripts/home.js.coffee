# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

	topten =	$.getJSON(
				"/topten.json"
				(response) ->
					$('ol.top_ten').empty
					$('ol.top_ten').before('<h2>Top Ten Names</h2>')
					$.each(
							response
						(key, value) -> 
							console.log('Got em!!!')
							$('ol.top_ten').append('<li>'+ value.name.capitalize() + ' // ' +value.votes+ ' Votes'+ '<a href="/vote/'+value.id+'" class="vote_link">I Like This!</a>'+ '</li>')
						)
			)

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

	topten