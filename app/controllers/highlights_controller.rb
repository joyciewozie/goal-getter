 class HighlightsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @highlights = Highlight.all
    # render json: {}
  end

  def create
    highlight = Highlight.create!(highlights_params)

    render :json => highlight
  end

  private

  def highlights_params
    params.require(:highlight).permit(:text, :goal_id)
  end
end
