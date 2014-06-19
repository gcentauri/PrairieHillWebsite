class ModifyAdminAttributeOnUsers < ActiveRecord::Migration
  def change
    remove_column :users, :admin
    add_column :users, :admin, :boolean, :default => false
    add_index :users, :admin
  end
end
