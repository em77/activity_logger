# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  flatpickr '[data-behavior=\'flatpickr-date\']',
    allowInput: true
    altInput: true
    altFormat: 'F j, Y'
    dateFormat: 'Y-m-d'

  flatpickr '[data-behavior=\'flatpickr-time\']',
    allowInput: true
    enableTime: true
    noCalendar: true
    dateFormat: "h:i K"

  $('[data-behavior=\'flatpickr-date\']').next().focus ->
    $(this).on 'click.a keyup.a', (e) ->
      $(this).off('click.a keyup.a').select()
      return
    return
