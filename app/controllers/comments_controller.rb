class CommentsController < ApplicationController
  def new
    @goal = Goal.find(params[:goal_id])
    @comment = Comment.new
  end
end
