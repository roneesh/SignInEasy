class AddVisitingReasonToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :reason, :string
  end
end
