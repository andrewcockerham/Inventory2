# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	## FOR THE NEW PURCHASE ORDER PAGE DROPDOWN BOXES
	items = $('#quantity_item_select').html()
	# console.log(items)
	$('.supplier_select').change ->
		supplier = $('.supplier_select :selected').text()
		# options = $("optgroup").filter((index) ->
		#   $(this).attr("label") is supplier)
		options = $(items).filter((index) ->
		  $(this).attr("label") is supplier)
		if options
			$('#quantity_item_select').html(options)
		# else
		# 	$('#quantity_item_select').empty()
		$(document).ready(ready)
		$(document).on('page:load', ready)

		return
		# (button on click)
		# (filter table to only show pending pos)
		# FOR FILTERING THE PO INDEX PAGE FOR PENDING POS

# jQuery ->		
# 		$("#pending_po_button_id").click ->
# 			# console.log('button clicked')
# 		  alert "handler for pending po button called"
# 		  row = $('#my_row').html()
# 		  options = $("tr").filter((index) ->
# 		    $(this).attr("label") is supplier)
# 		  return
		



		# $(".supplier_select").change alert_me_test
			# $("#supplier_select").on 'click', (event) ->
			# $(".supplier_select").change = ->
			# 	$(this).hide()

			# alert_me_test = ->
			#   alert "this is a test"
		 #  return

#   $('form1					').on 'click', '.remove_fields', (event) ->
#     $(this).prev('input[type=hidden]').val('1')
#     $(this).closest('fieldset').hide()
#     event.preventDefault()

# 	$('form').on 'click', '.add_fields', (event) ->
# 	  time = new Date().getTime()
# 	  regexp = new RegExp($(this).data('id'), 'g')
# 	  $(this).before($(this).data('fields').replace(regexp, time))
# 	  event.preventDefault()