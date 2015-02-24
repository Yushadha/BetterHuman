class GoalsController < ApplicationController
  before_filter :authorize

  def index
  end

  def new
  end

  def create
    @goal_new = Goal.new goal_params
    @goal_new.user = current_user 
    @goal_new.ranking = Goal.where(user_id: current_user.id).count + 1
    if @goal_new.save
      redirect_to '/users/show', notice: "goal created :)"
    else
      redirect_to '/users/show', alert: "goal not created..."
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
