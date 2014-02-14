class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_type
      t.references :imageable, polymorphic: true
      t.timestamps
    end
  end
end
