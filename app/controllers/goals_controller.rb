class GoalsController < ApplicationController
  before_filter :authorize
  
  def index
  end

  def new
  end

  def create
    @goal_new = Goal.new goal_params
    #@goal.user = current_user
    if @goal_new.save
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def goal_params
    params.require(:goal).permit([:ranking, :description])
  end

  def find_user
    @goal = Goal.find(params[:id])
  end
end
