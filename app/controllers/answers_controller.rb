class AnswersController < ApplicationController
  before_action :set_goal, only: %i[new create]

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.save!
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :template_question_id)
  end

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end
end
