class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.text :teaser
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :posts, :user_id
  end
end
