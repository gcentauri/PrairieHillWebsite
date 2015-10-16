class AddInviteCategoryToEvents < ActiveRecord::Migration
  def change
    add_column :events, :invite_category, :string
  end
end
