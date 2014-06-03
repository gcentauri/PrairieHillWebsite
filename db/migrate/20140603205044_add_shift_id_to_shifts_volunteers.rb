class AddShiftIdToShiftsVolunteers < ActiveRecord::Migration
  def change
    add_column :shifts_volunteers, :shift_id, :integer
    add_index :shifts_volunteers, :shift_id
  end
end
