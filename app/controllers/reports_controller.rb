class ReportsController < ApplicationController
  before_action :require_sign_in


  def index
    @reports = Report.all
  end

  def new
    @report = Report.new
  end

  def create
    @exercise = Exercise.find(params[:exercise_id])
    report = @exercise.reports.new(report_params)
    report.user = current_user

    if report.save
      flash[:notice] = "Results saved successfully."
      redirect_to workout_path(@exercise.workout)
    else
      flash[:alert] = "Results failed to save."
      redirect_to workout_path(@exercise.workout)
    end
  end

  def destroy
    @exercise = @workout.exercise.find(params[:id])
    report = @exercise.reports.new(report_params)

    if report.destroy
      flash[:notice] = "Report was deleted successfully."
      redirect_to workout_path(@exercise.workout)
    else
      flash[:alert] = "Report couldn't be deleted. Try again."
      redirect_to workout_path(@exercise.workout)
    end
  end

  private

  def report_params
    params.require(:report).permit(:name, :seconds, :weight, :reps)
  end

  def authorize_user
    report = Report.find(params[:id])
    unless current_user == current_user.admin?
      flash[:alert] = "You do not have permission to create or delete an report."
      redirect_to workout_path(@exercise.workout)
    end
  end
end
