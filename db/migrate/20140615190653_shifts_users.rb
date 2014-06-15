class ShiftsUsers < ActiveRecord::Migration
  def change
    create_table :shifts_users do |t|
      t.references :shift
      t.references :user
    end
  end
end
