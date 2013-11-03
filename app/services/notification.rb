class Notification

  def initialize(guest)
    @guest = guest
    @employee = Employee.find_by_id(@guest.employee_id)
    @services = ServiceList.where(organization_id: @guest.orgnization_id)
  end

  def send
    send_email if (services.email_notification?) && email_allowed?
    send_text if (services.text_notification?) && text_allowed?
  end

  private

  def email_allowed?
    @employee.allow_email?
  end

  def text_allowed?
    @employee.allow_text?
  end

  def send_email
    destination_email = @employee.email
  end

  def send_text
    destination_phone = @employee.phone
    message = "Your guest #{@guest.name.first} has arrived!"
  end

end

