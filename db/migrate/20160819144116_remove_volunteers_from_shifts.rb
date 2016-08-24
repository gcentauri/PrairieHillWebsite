class RemoveVolunteersFromShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :volunteers, :string
    remove_column :shifts, :volunteers, :string
  end
end
