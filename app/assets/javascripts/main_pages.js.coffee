# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  `$.ajaxSetup({
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  }
  });`
  $("form#sign_in_user, form#sign_up_user").bind("ajax:success", (event, xhr, settings) ->
    console.log(xhr, "JSON RESPONSE")
    
  ).bind("ajax:error", (event, xhr, settings, exceptions) ->
    console.log(xhr, "ERRR RESPONSE")
    error_messages =  if xhr.responseJSON['errors']
      $.map(xhr.responseJSON["errors"], (v, k) ->
        console.log(v, k)
        "<div class='alert alert-danger pull-left'>" + k + " " + v + "</div>"
      ).join ""
    else
      "<div class='alert alert-danger pull-left'>Unknown error</div>"
    $('.modal-footer').html(error_messages)
  )
