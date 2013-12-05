
$('.visitor-ui-form.a').ready(function(){

  $('.meeting-btn').click(function(){
    $('.btn-grid').fadeOut('fast')
    $('.form-meeting').fadeIn('fast');
  })
  

  $('.drop-in-btn').click(function(){
    $('.btn-grid').fadeOut('fast');
    $('.form-dropin').fadeIn('fast');  
  })
  

  $('.tour-btn').click(function(){
    $('.btn-grid').fadeOut('fast');
    $('.form-tour').fadeIn('fast');
  })


  $('.event-btn').click(function(){
    $('.btn-grid').fadeOut('fast');
    $('.form-event').fadeIn('fast');
  })

  $('.info-btn').click(function(){
    $('.btn-grid').fadeOut('fast');
    $('.form-information').fadeIn('fast');
  })


  $('.other-btn').click(function(){
    $('.btn-grid').fadeOut('fast');
    $('.form-other').fadeIn('fast');
  })

  $('.form-cancel').click(function(){
    location.reload();
  })

// Upon sucessful registration this activates the confirmation window

  // $('.other-btn').click(function(){
  //   $('.form').fadeOut('fast');
  //   $('.show-page-text').fadeIn('fast');
  // })  

// Sucessful AJAX request submission

 // $('#your_form').on 'ajax:success', (event, data, status, xhr) ->
  // Your success logic


})