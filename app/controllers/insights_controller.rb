class InsightsController < ApplicationController
  before_action :set_goal, only: %i[show new create]

  def show
    @insight = Insight.find(params[:id])
    @goal = @insight.goal
    @answers = TemplateQuestion.where(goal_type: @goal.goal_type).map { |tq| Answer.new(template_question: tq) }
    # @unaswers = @answers.select {|answer| answer.content.nil?}
    # @answers = [@unaswered.sample]
    @answers_order = @answers.sort_by { |answer| answer.template_question_id }
    @answers = [@answers_order.sample]
    # if @answers.template_question_id = 4
    #   redirect_to goal_path(@goal.id)
    # end
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
    @goal = @insight.goal
    if @insight.save
      # error in redirecting
      redirect_to goal_insight_path(@goal.id, @insight.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def insight_params
    params.require(:insight).permit(:name, :summary, :goal_id, :photo)
  end

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end
end
