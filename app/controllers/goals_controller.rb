class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def show
    @goal = Goal.find(params[:id])
    # @user = User.new
  end
end
