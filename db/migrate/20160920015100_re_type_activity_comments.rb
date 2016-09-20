class ReTypeActivityComments < ActiveRecord::Migration
  def change
    remove_column :activities, :comments
    #add_column :activities, :comments, :text, array: true, default '[]'
  end
end
