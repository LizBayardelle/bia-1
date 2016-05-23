class RemoveReportStuffFromExercises < ActiveRecord::Migration
  def change
    remove_column :exercises, :seconds, :integer
    remove_column :exercises, :weight, :integer
    remove_column :exercises, :reps, :integer
  end
end
