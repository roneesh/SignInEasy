require 'mandrill'
require 'json'

class Notification

  attr_accessor :email_status, :text_status

  def initialize(guest)
    @guest = guest
    @employee = Employee.find_by_id(@guest.employee_id)
    @services = ServiceList.find_by_organization_id(@guest.organization_id)
    @email_status = "unsent"
    @text_status = "unsent"
  end

  def send
    #send_email if (@services.email_notification?) && email_allowed?
    #send_text if (@services.text_notification?) && text_allowed?
    send_email if email_allowed?
    puts "between send_email and send_text"
    # send_text if text_allowed?
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
    message_body = "Your guest #{@guest.name} has arrived!"

    message = {  
      :subject=> "1871 Notification: Your guest #{@guest.name} has arrived!",  
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
    @email_status = sending[0]["status"]
    puts @email_status
  end

  def send_text
    trigger_request = Typhoeus::Request.new(
      trigger_url,
      method: :post
    )
    trigger_request.run
  end

  def trigger_url
    response = text_request.run
    parsed_response = JSON.parse(response.options[:response_body])
    parsed_response["trigger"]
  end

  def text_request
    guest_first_name = @guest.name.split.first
    employee_first_name = @employee.name.split.first
    employee_last_name = @employee.name.split.last

    Typhoeus::Request.new(
      "http://developer.alertcaster.com/developer/api/alert-create-simple",
      method: :post,
      body: ({
        "apikey" => "009d0068cctdLLGt",
        "name" => "Guest notification",
        "sms" => "1871 Notification: Your guest #{@guest.name} has arrived! Please come to the front desk to greet them.",
        "recipient" => [{
          "name" => "#{employee_first_name}, #{employee_last_name}",
          "email" => @employee.email,
          "mobile" => @employee.phone
        }],
      })
    )
  end

end

