class CreateServiceLists < ActiveRecord::Migration
  def change
    create_table :service_lists do |t|
      t.integer :organization_id
      t.boolean :email_notification
      t.boolean :text_notification

      t.timestamps
    end
  end
end
