class RemoveColumnsFromActivity < ActiveRecord::Migration
  def change
    remove_column :activities, :sign
    remove_column :activities, :num_tickets
    remove_column :activities, :vol_needed
    remove_column :activities, :start_time
    remove_column :activities, :end_time
    remove_column :activities, :category
  end
end
