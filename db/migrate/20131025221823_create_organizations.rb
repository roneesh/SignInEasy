class CreateOrganizations < ActiveRecord::Migration
  
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :admin_id

      t.timestamps
    end
  end

end
