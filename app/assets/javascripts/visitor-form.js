
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

// submit button 

  if($('#employee_autocomplete').val() ==  "") 
     $('#registerButton').prop('disabled', true);

  $('#employee_autocomplete').keyup(function(){
      if($('#employee_autocomplete').val() !=  "") 
           $('#registerButton').prop('disabled', false);    
      else
           $('#registerButton').prop('disabled', true);   
  });

  // model form

  $('.model-button-group').click(function(){
    if($("value")=="meeting"){
        $(".box").hide();
        $(".todays_guests").show();
    }
    if($("value")=="tour"){
        $(".box").hide();
        $(".yesterdays_guests").show();
    }
    if($(this).attr("value")=="event"){
        $(".box").hide();
        $(".weeks_guests").show();
    }
    if($(this).attr("value")=="other"){
        $(".box").hide();
        $(".months_guests").show();
    }
});

})