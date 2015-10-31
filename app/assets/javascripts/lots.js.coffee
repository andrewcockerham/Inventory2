# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
# ready = ->
  if document.getElementById('full_po_checkbox_full_po_qty')
      $('#full_po_checkbox_full_po_qty').on "click", -> #.onchange = ->
      # document.getElementById('full_po_checkbox').onchange = ->
        console.log('changed')
        $(".received_qty").toggle()
        # document.getElementById('received_qty').style.display = (if @checked then "none")# else "block")
      # document.getElementById('full_po_qty').style.display = (if @checked then "block" else "none")
  # return
  # $(document).ready(ready)
  # $(document).on('page:load', ready)
# return

# ready = ->
#   # FUNCTION TO AUTOFILL ITEMS DROPDOWN BASED ON PO SELECTED
#   items = $('#item_select_id').html()
#   $('.purchase_order_select').change ->
#     po = $('.purchase_order_select :selected').text()

#     options = $(items).filter((index) ->
#       $(this).attr("label") is po)
#     if options
#       $('#item_select_id').html(options)
# return


# if $('#full_po_checkbox').length

# FUNCTION TO AUTOFILL ITEMS DROPDOWN BASED ON PO SELECTED
