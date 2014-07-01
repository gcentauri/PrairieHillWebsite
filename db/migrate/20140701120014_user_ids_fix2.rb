class UserIdsFix2 < ActiveRecord::Migration
  def change
    remove_column :shifts, :user_ids
    add_column :shifts, :user_ids, :text, array: true, default: []
  end
end
