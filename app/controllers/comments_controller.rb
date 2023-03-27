class CommentsController < ApplicationController

  def create
    @comment = Comment.new
    @comment.user = current_user
    if @comment.save
      redirect_to goal_path(@goal.id), notice: "Comment added!"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :answer_id, :user_id)
  end
end
