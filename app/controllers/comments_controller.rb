class CommentsController < ApplicationController
  def index
    @goal = Goal.find(params[:goal_id])
    @insight = Insight.find(params[:insight_id])
    @comment = Comment.new
  end

  def create
    @goal = Goal.find(params[:goal_id])
    # show all the answers for this goal
    @insight = Insight.find(params[:insight_id])
    # add a new comment
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.insight = @insight
    @insight.goal = @goal
    @answer = Answer.find(comment_params[:answer_id])

    respond_to do |format|
      if @comment.save
        format.html {redirect_to goal_comments_path(@goal.id)}
        format.json
      else
        format.html {render :new, status: :unprocessable_entity}
        format.json
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :answer_id)
  end
end
