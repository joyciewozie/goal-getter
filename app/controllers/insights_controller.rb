class InsightsController < ApplicationController
  before_action :set_goal, only: %i[show new create]

  def show
    @insight = Insight.find(params[:id])
    @goal = @insight.goal

    answers = TemplateQuestion
               .where(goal_type: @goal.goal_type)
               # @insight.answers.pluck(:template_question_id) returns an array of template question id that has been answered
               .where.not(id: @insight.answers.pluck(:template_question_id))
               .map { |tq| Answer.new(template_question: tq) }

    @answer = answers.first
  end

  # def answers
  #   @insight = Insight.find(params[:id])
  # endr

  # GET (/goals/:goal_id/insights/new)
  def new
    @insight = Insight.new
  end

  # POST (/goals/:goal_id/insights)
  def create
    @insight = Insight.new(insight_params)
    @insight.goal = @goal
    if @insight.save
      # error in redirecting
      redirect_to goal_insight_path(@goal.id, @insight.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def insight_params
    params.require(:insight).permit(:name, :summary, :goal_id, :status, :photo)
  end

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end
end
