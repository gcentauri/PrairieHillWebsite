class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :title
      t.string :time
      t.integer :vols_needed

      t.timestamps
    end
  end
end
