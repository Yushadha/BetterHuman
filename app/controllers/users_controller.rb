class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create

  end

  def show
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
    params.require(:user).permit([:first_name, :last_name])
  end

  def find_user
    @user = user.find(params[:id])
  end
end
