jQuery ->
  $(".form-navigation a").on "click", (event) ->
    event.preventDefault()
    $('.form-navigation').fadeOut('slow').delay(800)
    if $(event.target).hasClass('meeting-btn')
      $('#meeting-radio-btn').attr('checked', 'true')
      $('.visiting-reason-display').html('Scheduled Meeting')
    if $(event.target).hasClass('tour-btn')
      $('#tour-radio-btn').attr('checked', 'true')
      $('.visiting-reason-display').html('Scheduled Tour')
    if $(event.target).hasClass('event-btn')
      $('#event-radio-btn').attr('checked', 'true')
      $('.visiting-reason-display').html('Scheduled Event')
    if $(event.target).hasClass('information-btn')
      $('#information-radio-btn').attr('checked', 'true')
      $('.visiting-reason-display').html('More Information')
    $('.form-holder').css("display", "block").delay(800)
  
  # $('#employee_autcomplete').autocomplete
  #   source: $('#employee_autcomplete').data('autocomplete-source')

  $('#form-back-btn').on "click", (event) ->
    location.reload()