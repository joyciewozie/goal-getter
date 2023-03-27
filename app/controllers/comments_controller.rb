class CommentsController < ApplicationController
  def index
    @goal = Goal.find(params[:goal_id])
    @comment = Comment.new
  end

  def create
    @goal = Goal.find(params[:goal_id])
    # show all the answers for this goal
    @answers = Answer.where()
    # add a new comment
    @comment = Comment.new(comment_params)
    @comment.goal = @goal
    if @comment.save
      redirect_to goal_comments_path(@goal.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
