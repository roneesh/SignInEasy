class Guest < ActiveRecord::Base
  belongs_to :organization

  def run_notification_service
    if email_enabled?
      Notification::Email.new(self)
    elsif text_enabled? 
      Notification::Text.new(self)
    end
  end

  def email_enabled?
    ServiceList.where(organization_id: self.organization_id).email_notification
  end

  def text_enabled?
    ServiceList.where(organization_id: self.organization_id).text_notification
  end

end
