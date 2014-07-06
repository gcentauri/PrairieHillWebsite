class AddVolunteerStringToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :volunteer, :string
  end
end
