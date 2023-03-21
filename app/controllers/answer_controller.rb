class AnswerController < ApplicationController
  def new
    @answer = Answer.new
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
