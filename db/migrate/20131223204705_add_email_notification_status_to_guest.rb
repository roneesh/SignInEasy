class AddEmailNotificationStatusToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :email_notification_status, :string
    add_column :guests, :text_notification_status, :string
  end
end
