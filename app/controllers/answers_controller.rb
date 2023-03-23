class AnswersController < ApplicationController
  before_action :set_insight, only: %i[create]

  def create
    goal = @insight.goal
    # @answers = TemplateQuestion.where(goal_type: @goal.goal_type).map { |tq| Answer.new(template_question: tq) }
    answer = Answer.new(answer_params)
    answer.insight = @insight
    answer.save

    redirect_to goal_insight_path(goal.id, @insight.id)
    # @answers.each do |answer|
    #   answer.content =
    #   answer.save
    # end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :template_question_id, :insight_id)
  end

  def set_insight
    @insight = Insight.find(params[:insight_id])
  end
end
