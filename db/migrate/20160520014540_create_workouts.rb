class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :workout_type
      t.text :teaser
      t.text :description
      t.text :trainer
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :workouts, :user_id
  end
end
