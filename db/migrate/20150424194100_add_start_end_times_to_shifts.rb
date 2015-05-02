class AddStartEndTimesToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :start_time, :datetime
    add_column :shifts, :end_time, :datetime
  end
end
