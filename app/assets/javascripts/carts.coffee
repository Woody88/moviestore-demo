# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(window).load ->
  $('#mycart .fi-x').click (e) ->
    e.preventDefault()
    $this = $(this)
    url = $this.closest('a').data('targeturl')

    $.ajax url: url, type: 'put', success: (data) ->
      $('.cart-count').html(data)
      $this.closest('.cart-movie').slideUp()

  $('.clear_cart').click (e) ->
    e.preventDefault()
    $this = $(this)
    url = $this.data('removeurl')
    
    $.ajax url: url, type: 'put', success: (data) ->
      $('.cart-count').html(data)
      $('.cart-movie').remove().slideUp()
      $('.checkout').remove()
      $this.remove()