class UsersController < ApplicationController
  before_filter :authorize

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def show
    @goal = Goal.where(user_id: current_user.id)
    @new_goal = Goal.new
  end

  def edit
  end

  def update
    find_user
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    find_user
    if @user.destroy
      redirect_to user_path
    else
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
