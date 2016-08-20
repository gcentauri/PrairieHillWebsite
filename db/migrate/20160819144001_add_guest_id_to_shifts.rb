class AddGuestIdToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :guest_id, :integer
  end
end
