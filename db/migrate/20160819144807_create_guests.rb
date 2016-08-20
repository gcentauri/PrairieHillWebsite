class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.text :shift_ids
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
