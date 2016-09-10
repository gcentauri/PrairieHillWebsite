class AddGuestnameToTimeslots < ActiveRecord::Migration
  def change
    add_column :timeslots, :guestname, :string
  end
end
