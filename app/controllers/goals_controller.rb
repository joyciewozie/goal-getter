class GoalsController < ApplicationController
  def index
    @goals = Goal.all.where(user: current_user)
  end

  def show
    @goal = Goal.find(params[:id])
    @collaborator = Collaborator.new
    @collaborators = @goal.collaborators
    @insights = @goal.insights

    # select highlights that matches the goal
    # then retrieve the text field and puts into an array
    # Highlight.where(goal: goal).pluck(:text)


  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params_new)
    @goal.user = current_user
    # raise
    photo_url = Unsplash::Photo.random(count: 1, query: "#{@goal.goal_type}", orientation: "landscape")[0].urls.regular
    @goal.photo.attach(io: URI.open(photo_url), filename: "image-#{Time.now.strftime("%s%L")}.png")
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

  def goal_params_new
    params.require(:goal).permit(:goal_type, :name, :description, :status)
  end

  def goal_params
    params.require(:goal).permit(:goal_type, :name, :description, :status, :photo)
  end
end
