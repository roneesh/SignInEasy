console.log('new.js being hit')
$('#new_employee_link').hide().after('<%= j render("employee_form", {:employee => @employee}) %>');
