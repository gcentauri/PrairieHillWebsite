class AddGuestVolsToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :guest, :string
    add_index :shifts, :guest
  end
end
