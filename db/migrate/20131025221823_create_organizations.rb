class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :admin_id

      t.timestamps
    end

    create_table :organizations_users do |t|
      t.belongs_to :user
      t.belongs_to :organization
    end

  end
end
