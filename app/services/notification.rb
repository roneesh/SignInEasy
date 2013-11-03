require 'mandrill'

class Notification

  def initialize(guest)
    @guest = guest
    @employee = Employee.find_by_id(@guest.employee_id)
    @services = ServiceList.find_by_organization_id(@guest.organization_id)
  end

  def send
    send_email if (@services.email_notification?) && email_allowed?
    send_text if (@services.text_notification?) && text_allowed?
  end

  private

  def email_allowed?
    @employee.allow_email?
  end

  def text_allowed?
    @employee.allow_text?
  end

  def send_email
    m = Mandrill::API.new
    message_body = "Your guest #{@guest.name.split.first} is here!"

    message = {  
      :subject=> "Your guest is here",  
      :from_name=> "SignInEasy",  
      :text=>message_body,  
      :to=>[  
        {  
          :email=> @employee.email,  
          :name=> @employee.name 
      }],  
      :html=>"<html><h1>#{message_body}</h1></html>",  
      :from_email=>"donotreply@signineasy.co"  
    }  
    sending = m.messages.send message  
    puts sending
  end

  def send_text
    destination_phone = @employee.phone
    message = "#{destination_phone} your guest #{@guest.name.first} has arrived!"
    puts message
  end

end

