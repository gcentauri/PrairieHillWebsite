class AddUserIdToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :user_ids, :text
    add_index :shifts, :user_ids
  end
end
