class AddVideoToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :video, :string
  end
end
