class AddNeedsToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :needs_seconds, :string
    add_column :exercises, :needs_weight, :string
    add_column :exercises, :needs_reps, :string
  end
end
