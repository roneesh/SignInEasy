
$('.visitor-ui-form.a').ready(function(){

  $('.meeting-btn').click(function(){
    $('.btn-grid').fadeOut('fast')
    $('.form-with-host').fadeIn('fast');
  })
  

  $('.drop-in-btn').click(function(){
    $('.btn-grid').fadeOut('fast');
    $('.form-with-host').fadeIn('fast');  
  })
  

  $('.tour-btn').click(function(){
    $('.btn-grid').fadeOut('fast');
    $('.form-without-host').fadeIn('fast');
  })


  $('.event-btn').click(function(){
    $('.btn-grid').fadeOut('fast');
    $('.form-without-host').fadeIn('fast');
  })

  $('.info-btn').click(function(){
    $('.btn-grid').fadeOut('fast');
    $('.form-without-host').fadeIn('fast');
  })


  $('.other-btn').click(function(){
    $('.btn-grid').fadeOut('fast');
    $('.form-other').fadeIn('fast');
  })

  $('.form-cancel-btn').click(function(){
    location.reload();
  })

})
