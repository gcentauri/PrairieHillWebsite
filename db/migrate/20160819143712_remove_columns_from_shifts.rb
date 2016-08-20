class RemoveColumnsFromShifts < ActiveRecord::Migration
  def change
    remove_column :shifts, :title
    remove_column :shifts, :time
    remove_column :shifts, :vols_needed
    remove_column :shifts, :volunteer
    remove_column :shifts, :guest
  end
end
