class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.integer :post_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :comments, :post_id
    add_index :comments, :user_id
  end
end
