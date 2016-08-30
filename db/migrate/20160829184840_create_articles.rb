class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :link
      t.string :source
      t.string :category

      t.timestamps null: false
    end
  end
end
