class ExercisesController < ApplicationController
  before_action :require_sign_in


  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @workout = Workout.find(params[:workout_id])
    exercise = @workout.exercises.new(exercise_params)
    exercise.user = current_user

    if exercise.save
      flash[:notice] = "Results saved successfully."
      redirect_to [@workout]
    else
      flash[:alert] = "Results failed to save."
      redirect_to [@workout]
    end
  end

  def destroy
    @workout = Workout.find(params[:post_id])
    exercise = @workout.exercise.find(params[:id])

    if exercise.destroy
      flash[:notice] = "Exercise was deleted successfully."
      redirect_to [@workout]
    else
      flash[:alert] = "Exercise couldn't be deleted. Try again."
      redirect_to [@workout]
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :needs_seconds, :needs_weight, :needs_reps)
  end

  def authorize_user
    exercise = Exercise.find(params[:id])
    unless current_user == current_user.admin?
      flash[:alert] = "You do not have permission to create or delete an exercise."
      redirect_to [exercise.workout]
    end
  end
end
