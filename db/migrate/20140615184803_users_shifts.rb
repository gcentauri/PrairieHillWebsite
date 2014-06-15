class UsersShifts < ActiveRecord::Migration
  def change
    create_table :users_shifts do |t|
      t.references :user
      t.references :shift
    end
  end
end
