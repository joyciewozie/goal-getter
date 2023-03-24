class GoalsController < ApplicationController
  def index
    @goals = Goal.all.where(user: current_user)
  end

  def show
    @goal = Goal.find(params[:id])
    @collaborator = Collaborator.new
    @collaborators = @goal.collaborators
    @insights = @goal.insights
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      redirect_to goal_path(@goal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.update(goal_params)
    redirect_to goal_path(@goal.id)
  end

  def insight
    @goal = Goal.find(params[:goal_id])
    @answers = TemplateQuestion.where(goal_type: @goal.goal_type).map { |tq| Answer.new(template_question: tq) }
  end

  private

  def goal_params
    params.require(:goal).permit(:goal_type, :name, :description, :status, :photo)
  end
end
