class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.integer :organization_id
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
