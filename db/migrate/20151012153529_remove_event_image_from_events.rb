class RemoveEventImageFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :event_image, :string
  end
end
