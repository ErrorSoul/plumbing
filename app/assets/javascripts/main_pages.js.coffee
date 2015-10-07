# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  `$.ajaxSetup({
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  }
  });`
  $("form#sign_up_user").bind("ajax:success", (event, xhr, settings) ->
    console.log(xhr, "JSON RESPONSE")
    $(this).parents('.modal').modal('hide')
    $('#modal_button').hide()
    $('#real_order_button').show()
  ).bind("ajax:error", (event, xhr, settings, exceptions) ->
    console.log(xhr, "ERRR RESPONSE")
    arr_fields = ["name", "password", "email", "password_confirmation"]
    $.map(arr_fields, (k) ->
      $("#form_#{k}").removeClass('has-error')
      find_p = $("#form_#{k}").find('p')
      if find_p.length > 0
          find_p.html("")
    )
    error_messages =  if xhr.responseJSON['errors']
      $.map(xhr.responseJSON["errors"], (v, k) ->

        $("#form_#{k}").removeClass('has-error')
        console.log($("#form_#{k}"), "FORM_FIELD")
        find_p = $("#form_#{k}").find('p')
        if find_p.length > 0
          find_p.html("")
        $("#form_#{k}").addClass('has-error')
        if find_p.length > 0
          find_p.html("#{v}")
        else
          $("#form_#{k}").append("<p class='text-danger'> #{v} </p>")
      )
    else
      console.log("<div class='col-sm-3 alert alert-danger pull-left'>Unknown error</div>")

    #$('.modal-footer').html(error_messages)
  )

  $("form#sign_in_user").bind("ajax:success", (event, xhr, settings) ->
    console.log(xhr, "JSON RESPONSE")
    $('#remote_id').html('')
    if xhr['id'] is undefined
      if $('#remote_id').length > 0
        $('#remote_id').html('Неправильный логин или пароль')
      else
        $(".modal-header").append("<div id='remote_id' class='col-sm-12 alert alert-info'>Неправильный логин или пароль</div>")

    else

      $(this).parents('.modal').modal('hide')
      $('#modal_button').hide()
      $('#real_order_button').show()
    ).bind("ajax:error", (event, xhr, settings, exceptions) ->
      console.log(xhr, "ERRR RESPONSE")
      error_messages =  if xhr.responseJSON['errors']
        $.map(xhr.responseJSON["errors"], (v, k) ->
          $("#form_#{k}").removeClass('has-error')
          find_p = $("#form_#{k}").find('p')
          if find_p.length > 0
            find_p.html("")
          $("#form_#{k}").addClass('has-error')

          if find_p.length > 0
            find_p.html("#{v}")
          else
            $("#form_#{k}").append("<p class='text-danger'> #{v} </p>")

        )
      else
        console.log("<div class='col-sm-3 alert alert-danger pull-left'>Unknown error</div>")
      #$('.modal-footer').html(error_messages)
  )
