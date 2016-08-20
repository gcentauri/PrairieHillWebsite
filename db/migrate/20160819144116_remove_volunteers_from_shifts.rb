class RemoveVolunteersFromShifts < ActiveRecord::Migration
  def change
    remove_column :shifts, :volunteers, :string
  end
end
