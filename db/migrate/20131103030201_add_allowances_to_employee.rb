class AddAllowancesToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :allow_email, :boolean, default: true
    add_column :employees, :allow_text, :boolean, default: true
  end
end
