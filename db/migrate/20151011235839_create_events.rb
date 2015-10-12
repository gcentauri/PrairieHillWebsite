class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :subtitle
      t.string :location
      t.text :location_address
      t.datetime :date_and_time
      t.string :parent
      t.text :description
      t.text :links
      t.string :event_image_id

      t.timestamps null: false
    end
  end
end
