class Guest < ActiveRecord::Base
  belongs_to :organization

  def run_notification_service
    if email_enabled? && email_allowed?
      email = Notification::Email.new(self)
      email.send
    end
    
    if text_enabled? && text_allowed?
      text = Notification::Text.new(self)
      text.send
    end

  end

  private

  def email_enabled?
    ServiceList.where(organization_id: self.organization_id).email_notification?
  end

  def email_allowed?
    #Employee.find_by_id(self.employee_id).allow_email?
  end

  def text_enabled?
    ServiceList.where(organization_id: self.organization_id).text_notification?
  end

  def text_allowed?
    #Employee.find_by_id(self.employee_id).allow_text?
  end

end
