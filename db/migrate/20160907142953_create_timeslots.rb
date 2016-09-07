class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.integer :activity_id
      t.integer :shift_id

      t.timestamps null: false
    end
  end
end
