class RemoveTimezoneFromOrganizations < ActiveRecord::Migration
  def change
  	remove_column :organizations, :timezone, :string
  end
end
