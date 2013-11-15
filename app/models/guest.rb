class Guest < ActiveRecord::Base
  belongs_to :organization
  belongs_to :employee

  attr_accessor :employee_name

  def initialize(params = {})
    @employee_name = params[:employee_name] || nil
    super #without call to super guest object doesn't initialize
  end

  # Not part of this issue
  def run_notification_service
    notification = Notification.new(self)
    notification.send
  end

  def set_id
    self.employee_id = employee
  end

  def employee
    Employee.find_by_name(@employee_name).try(:id)
  end 


  # ensures all email addresses are saved in lowercase preventing possible duplicate entries
  def downcase_email_address
    self.email = self.email.downcase 
  end


end