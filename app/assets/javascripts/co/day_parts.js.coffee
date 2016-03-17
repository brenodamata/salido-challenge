jQuery ->
	locations = $('#day_part_location_id').html()
	console.log(locations)
	$('#day_part_brand_id').change ->
		brand = $('#day_part_brand_id :selected').text()
		options = $(locations).filter("optgroup[label=#{brand}]").html()
		console.log(options)
		if options
			$('#'day_part_location_id).html(options)
		else
			$('#'day_part_location_id).empty()