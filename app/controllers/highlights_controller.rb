class HighlightsController < ApplicationController
  def index
    render json: {}
  end

  def create

  end

  private

  def highlights_params
    params.require(:highlight).permit(:text)
  end
end
