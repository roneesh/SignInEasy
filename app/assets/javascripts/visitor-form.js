
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
  //   $('.btn-grid').fadeOut('fast');
  //   $('.form-other').fadeIn('fast');
  // })  

// refresh page after 4 seconds
  // window.setTimeout(function() {
  //   location.reload();
  // }, 4000);

})