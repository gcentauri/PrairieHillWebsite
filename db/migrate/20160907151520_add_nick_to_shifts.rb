class AddNickToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :nick, :string
  end
end
