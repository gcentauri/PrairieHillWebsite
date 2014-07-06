class AddVolunteerStringArrayAttribute < ActiveRecord::Migration
  def change
    add_column :shifts, :volunteers, :text, array: true, default: '[]'
  end
end
