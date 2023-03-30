class HighlightsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @goals = Goal.all.where(user: current_user)
    @highlights = Highlight.all.where(goal: @goals)
    # render json: {}
  end

  def create
    @goal = Goal.find(highlights_params[:goal_id])
    @answer = Answer.find(highlights_params[:answer_id])
    @highlight = Highlight.new(highlights_params)

    respond_to do |format|
      if @highlight.save
        format.html { redirect_to goal_path(@goal) }
        format.text { render plain: @answer.highlighted_content }

      else
        format.html { render "goals/show_insights", status: :unprocessable_entity }
        format.text { render plain: @highlight.errors.full_messages.join }
      end
    end
  end

  private

  def highlights_params
    params.require(:highlight).permit(:text, :goal_id, :answer_id)
  end
end
