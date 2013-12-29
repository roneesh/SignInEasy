class AddEmpNameToGuestRecord < ActiveRecord::Migration
  def change
    add_column :guests, :hosting_member, :string
  end
end
