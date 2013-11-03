class Guest < ActiveRecord::Base
  belongs_to :organization

  def run_notification_service
    notification = Notification.new(self)
    notification.send
  end

end
