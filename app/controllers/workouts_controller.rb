class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new
    @workout.name = params[:workout][:name]
    @workout.workout_type = params[:workout][:workout_type]
    @workout.teaser = params[:workout][:teaser]
    @workout.description = params[:workout][:description]
    @workout.video = params[:workout][:video]
    @workout.difficulty = params[:workout][:difficulty]
    @workout.trainer = params[:workout][:trainer]
    @workout.user_id = params[:workout][:user_id]

    if @workout.save
      flash[:notice] = "Workout was saved successfully."
      redirect_to @workout
    else
      flash.now[:alert] = "Error creating workout. Please try again."
      render :new
    end
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])

    @workout.name = params[:workout][:name]
    @workout.workout_type = params[:workout][:workout_type]
    @workout.teaser = params[:workout][:teaser]
    @workout.description = params[:workout][:description]
    @workout.video = params[:workout][:video]
    @workout.difficulty = params[:workout][:difficulty]
    @workout.trainer = params[:workout][:trainer]
    @workout.user_id = params[:workout][:user_id]

    if @workout.save
       flash[:notice] = "Workout was updated successfully."
      redirect_to @workout
    else
      flash.now[:alert] = "Error saving workout. Please try again."
      render :edit
    end
  end

  def destroy
    @workout = Workout.find(params[:id])

    if @workout.destroy
      flash[:notice] = "\"#{@workout.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the workout."
      render :show
    end
  end
end
