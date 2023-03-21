class AnswerController < ApplicationController
  before_action :set_flat, only: %i[new, create]

  def new
    @answer = Answer.new
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end
end
