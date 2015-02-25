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
    redirect_to '/users/show', alert: "access denied" unless can? :update, @goal
    if @goal.update goal_params
      redirect_to @goal, notice: "Goal updated successfully!"
    else
      redirect_to '/users/show'
    end
  end

  def update
  end

  def destroy
    find_goal
    @goal.destroy
    redirect_to '/users/show', notice: "goal removed"
    rank_goals
  end

  def move_up
    render params
    # find_goal
    # @goal_above = Goal.where(ranking: (@goal.ranking - 1))
    # @goal.ranking = @goal.ranking - 1
    # @goal_above.ranking = @goal_above.ranking + 1
    # @goal.save
    # @goal_above.save
    # redirect_to '/users/show'
  end

  private

  def goal_params
    params.require(:goal).permit([:ranking, :description])
  end

  def find_goal
    @goal = Goal.find(params[:id])
  end

  def rank_goals
    @goal_user = Goal.where(user_id: current_user.id).order(:ranking)
    counter = 0
    @goal_user.each do |goal|
      counter += 1
      goal.ranking = counter
      goal.save
    end
  end
end
