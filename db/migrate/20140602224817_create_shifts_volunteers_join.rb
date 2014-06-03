class CreateShiftsVolunteersJoin < ActiveRecord::Migration
  def change
    create_table 'shifts_volunteers', :id => false do |t|
      t.column 'volunteer_id', :integer
      t.column 'product_id', :integer
    end
  end
end
