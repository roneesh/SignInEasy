class AddEmployeeIdToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :employee_id, :integer
  end
end
