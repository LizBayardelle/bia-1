class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :role
      t.string :gender
      t.date :dob
      t.integer :age
      t.integer :goal_weight
      t.integer :goal_body
      t.integer :goal_performance

      t.timestamps null: false
    end
  end
end
