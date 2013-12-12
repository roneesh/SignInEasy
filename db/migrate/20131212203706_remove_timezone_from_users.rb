class RemoveTimezoneFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :timezone, :string
  end
end
