class Notification

  class Email
  end

  class Text
  end

end

# Email and text notifications only public interface is send

class Notification::Email

  def initialize(guest)
    @destination_email = Employee.find_by_id(guest.employee_id).email
  end

  def send

  end

  private

end

class Notification::Text

  def initialize(guest)
    @destination_number = Employee.find_by_id(guest.employee_id).phone
  end

  def send

  end

  private


end