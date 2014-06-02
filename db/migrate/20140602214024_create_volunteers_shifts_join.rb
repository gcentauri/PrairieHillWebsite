class CreateVolunteersShiftsJoin < ActiveRecord::Migration
  def change
    create_table 'volunteers_shifts', :id => false do |t|
      t.column 'volunteer_id', :integer
      t.column 'product_id', :integer
    end
  end
end
