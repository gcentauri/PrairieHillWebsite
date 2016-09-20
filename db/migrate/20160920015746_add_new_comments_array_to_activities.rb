class AddNewCommentsArrayToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :comments, :text, array: true, default: []
  end
end
