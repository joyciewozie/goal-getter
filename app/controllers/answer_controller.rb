class AnswerController < ApplicationController
  def new
    @answer = Answer.new
  end
end
