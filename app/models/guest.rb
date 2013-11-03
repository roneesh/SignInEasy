class Guest < ActiveRecord::Base
  belongs_to :organization

  def run_notification_service
    notification = Notifcation.new(self)
    notification.send
  end

end
