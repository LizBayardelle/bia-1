class UsersController < ApplicationController
  def new
  @user = User.new
end

def create
  @user = User.create( user_params )
  @user.first_name = params[:user][:first_name]
  @user.last_name = params[:user][:last_name]
  @user.email = params[:user][:email]
  @user.password = params[:user][:password]
  @user.password_confirmation = params[:user][:password_confirmation]
  @user.role = params[:user][:role]
  @user.gender = params[:user][:gender]
  @user.dob = params[:user][:dob]
  @user.age = params[:user][:age]
  @user.goal_weight = params[:user][:goal_weight]
  @user.goal_body = params[:user][:goal_body]
  @user.goal_performance = params[:user][:goal_performance]

  if @user.save
    flash[:notice] = "Welcome to BurnIt Athletics #{@user.first_name}!"
    create_session(@user)
    redirect_to root_path
  else
    flash.now[:alert] = "Whoops! Something went wrong. Please try again."
    render :new
  end
end

def edit
  @user = User.friendly.find(params[:id])
end

def show
  @user = User.friendly.find(params[:id])
end

def update
  @user = User.friendly.find(params[:id])
  @user.full_name = params[:user][:full_name]
  @user.first_name = params[:user][:first_name]
  @user.last_name = params[:user][:last_name]
  @user.email = params[:user][:email]
  @user.password = params[:user][:password]
  @user.password_confirmation = params[:user][:password_confirmation]
  @user.role = params[:user][:role]
  @user.gender = params[:user][:gender]
  @user.dob = params[:user][:dob]
  @user.age = params[:user][:age]
  @user.goal_weight = params[:user][:goal_weight]
  @user.goal_body = params[:user][:goal_body]
  @user.goal_performance = params[:user][:goal_performance]

  if @user.save
    flash[:notice] = "Your information was successfully updated."
    redirect_to @user
  else
    flash.now[:alert] = "Uh oh!  Something is amok. Please try again."
    render :show
  end
end

private

 def user_params
   params.require(:user).permit(:avatar)
 end

end
