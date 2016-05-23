class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :exercise_id
      t.integer :reps
      t.integer :seconds
      t.integer :weight
      t.string :notes
      t.integer :workout_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :reports, :exercise_id
    add_index :reports, :workout_id
    add_index :reports, :user_id
  end
end
