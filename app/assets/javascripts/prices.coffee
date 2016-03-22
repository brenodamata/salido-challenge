# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  locations = $('#price_location_id').html()
  order_types = $('#price_order_type_id').html()
  menu_items = $('#price_menu_item_id').html()
  $('#price_brand_id').change ->
    brand = $('#price_brand_id :selected').text()
    location_options = $(locations).filter("optgroup[label=\"#{brand}\"]").html()
    if location_options
      $('#price_location_id').html(location_options)
      day_parts = $('#price_day_part_id').html()
      $('#price_location_id').change ->
        location = $('#price_location_id :selected').text()
        day_part_options = $(day_parts).filter("optgroup[label=\"#{location}\"]").html()
        if day_part_options
          $('#price_day_part_id').html(day_part_options)
        else
          $('#price_day_part_id').empty()
    else
      $('#price_location_id').empty()

    order_type_options = $(order_types).filter("optgroup[label=\"#{brand}\"]").html()
    if order_type_options
      $('#price_order_type_id').html(order_type_options)
    else
      $('#price_order_type_id').empty()

    menu_item_options = $(menu_items).filter("optgroup[label=\"#{brand}\"]").html()
    if menu_item_options
      $('#price_menu_item_id').html(menu_item_options)
    else
      $('#price_menu_item_id').empty()

  day_parts = $('#price_day_part_id').html()
  $('#price_location_id').change ->
    location = $('#price_location_id :selected').text()
    day_part_options = $(day_parts).filter("optgroup[label=\"#{location}\"]").html()
    if day_part_options
      $('#price_day_part_id').html(day_part_options)
    else
      $('#price_day_part_id').empty()

  $(".submit_search").click ->
    if validateForm() == false
      return false

  $(document).on "ajax:success", "form", (xhr, data, response) ->
    console.log(data)
    if data.status
      data.status


  validateForm = ->
    if $("#price_menu_item_id").val() == ''
      alert('Please select a menu item')
      return false
