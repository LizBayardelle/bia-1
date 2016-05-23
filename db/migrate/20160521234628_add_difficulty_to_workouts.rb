class AddDifficultyToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :difficulty, :integer
  end
end
