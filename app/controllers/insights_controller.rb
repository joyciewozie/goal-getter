require "open-uri"

class InsightsController < ApplicationController
  before_action :set_goal, only: %i[show new create]

  def index
    @insights = Insight.all
  end

  def show
    @insight = Insight.find(params[:id])
    @goal = @insight.goal
    @answers = TemplateQuestion.where(goal_type: @goal.goal_type)
              # @insight.answers.pluck(:template_question_id) returns an array of template question id that has been answered
              .where.not(id: @insight.answers.pluck(:template_question_id))
              .map { |tq| Answer.new(template_question: tq) }
    @answer = @answers.first
  end

  # def answers
  #   @insight = Insight.find(params[:id])
  # endr

  # GET (/goals/:goal_id/insights/new)
  def new
    @insight = Insight.new
    @insight.goal = @goal
  end

  # POST (/goals/:goal_id/insights)
  def create
    @insight = Insight.new(insight_params_new)
    @insight.goal = @goal
    @insight.status = @goal.status
    # do api call to get image
    photo_url = Unsplash::Photo.random(count: 1, query: "#{@insight.name}", orientation: "landscape")[0].urls.regular
    @insight.photo.attach(io: URI.open(photo_url), filename: "image-#{Time.now.strftime("%s%L")}.png")
    if @insight.save
      redirect_to goal_insight_path(@goal.id, @insight.id)
    else
      raise
      render :new, status: :unprocessable_entity
    end
  end

  private

  def insight_params
    params.require(:insight).permit(:name, :summary, :status, :goal_id, :photo)
  end

  def insight_params_new
    params.require(:insight).permit(:name, :summary, :goal_id, :status)
  end

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end
end
