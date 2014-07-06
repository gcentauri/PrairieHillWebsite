class RemoveUserIdsColumn < ActiveRecord::Migration
  def change
    remove_column :shifts, :user_ids
  end
end
