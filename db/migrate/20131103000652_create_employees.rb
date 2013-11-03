class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :phone
      t.integer :organization_id

      t.timestamps
    end
  end
end
