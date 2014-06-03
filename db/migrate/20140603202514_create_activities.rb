class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :work_area
      t.string :coordinator
      t.boolean :sign
      t.integer :num_tickets
      t.string :vol_needed
      t.text :shift_ids

      t.timestamps
    end
  end
end
