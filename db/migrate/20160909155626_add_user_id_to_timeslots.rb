class AddUserIdToTimeslots < ActiveRecord::Migration
  def change
    add_column :timeslots, :user_id, :integer
  end
end
