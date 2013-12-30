class AddMobileNumberColumnToGuests < ActiveRecord::Migration
  def change
  	add_column :guests, :mobile_number, :string
  end
end
