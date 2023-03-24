 class HighlightsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    render json: {}
  end

  def create
    highlight = Highlight.new(highlights_params)

    render :json => highlight
  end

  private

  def highlights_params
    params.require(:highlight).permit(:text, :answer_id)
  end
end
