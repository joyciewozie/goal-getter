class AnswerController < ApplicationController
  before_action :set_flat, only: %i[new, create]

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.goal = @goal
    # @goal.user = current_user
    if @answer.save
      redirect_to goal_path(@goal.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end
end
