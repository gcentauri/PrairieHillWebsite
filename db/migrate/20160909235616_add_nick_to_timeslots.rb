class AddNickToTimeslots < ActiveRecord::Migration
  def change
    add_column :timeslots, :nick, :string
  end
end
