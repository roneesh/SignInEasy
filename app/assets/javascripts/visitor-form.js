
// Guests new form/button UI

$('.visitor-ui-form.a').ready(function(){

  $('.meeting-btn').click(function(){
    $('.btn-grid').hide('fast')
    $('.form-meeting').fadeIn('fast');
  })
  

  $('.drop-in-btn').click(function(){
    $('.btn-grid').fadeOut('fast');
    $('.form-dropin').fadeIn('fast');  
  })
  

  $('.tour-btn').click(function(){
    $('.btn-grid').hide('fast');
    $('.form-tour').fadeIn('fast');
  })


  $('.event-btn').click(function(){
    $('.btn-grid').hide('fast');
    $('.form-event').fadeIn('fast');
  })

  $('.info-btn').click(function(){
    $('.btn-grid').fadeOut('fast');
    $('.form-information').fadeIn('fast');
  })


  $('.other-btn').click(function(){
    $('.btn-grid').hide('fast');
    $('.form-other').fadeIn('fast');
  })

  $('.form-cancel').click(function(){
    location.reload();
  })

// submit button disable/enable

  if($('#employee_autocomplete').val() ==  "") 
     $('#registerButton').prop('disabled', true);

  // $('#employee_autocomplete').keyup(function(){
  //     if($('#employee_autocomplete').val() !=  "") 
  //          $('#registerButton').prop('disabled', false);    
  //     else
  //          $('#registerButton').prop('disabled', true);   
  // });

  $('#employee_autocomplete').bind('railsAutocomplete.select', function(event, data){
  /* Do something here */
    if (data.item.id) {
      $('#guest_employee_id').val(data.item.id);
      $('#registerButton').prop('disabled', false);
      $('#notify').text("Your registering will notify: " + data.item.value);
      // $('#employee_autocomplete').(function() {
      //   console.log('Im being called from change!');
      //   $('#guest_employee_id').val("");
      //   $('#registerButton').prop('disabled', true);
      // });
      console.log(data.item);
    };
  });

  // $('#employee_autocomplete').change(function() {
  //   console.log('Im being changed!');
  // }); 

// Dashboard show/hide based on date


  $('#todays_guests').click(function(){
    $('.box').hide();
    $('.todays_guests').show();
  })

  $('#yesterdays_guests').click(function(){
    $('.box').hide();
    $('.yesterdays_guests').show();
  })

  $('#weeks_guests').click(function(){
    $('.box').hide();
    $('.weeks_guests').show();
  })

  $('#months_guests').click(function(){
    $('.box').hide();
    $('.months_guests').show();
  })


  // Modal Form

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





