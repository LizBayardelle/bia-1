class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :seconds
      t.integer :weight
      t.integer :reps
      t.integer :workout_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :exercises, :workout_id
    add_index :exercises, :user_id
  end
end
