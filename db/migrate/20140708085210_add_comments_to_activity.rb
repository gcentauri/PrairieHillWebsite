class AddCommentsToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :comments, :string
  end
end
