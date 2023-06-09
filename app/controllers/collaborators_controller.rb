class CollaboratorsController < ApplicationController
  before_action :set_goal, :check_owner, only: %i[create]

  def index
    @user = current_user
    @collaborators_accepted = Collaborator.where(accepted: true, user: current_user)
    @collaborators = Collaborator.where(accepted: false, user: current_user)
  end

  def create
    @collaborator = Collaborator.new
    @user = User.find_by_email(collaborator_params[:user])

    # goal_owner input user_id
    # @user = User.find(collaborator_params)
    @collaborator.user = @user
    # goal_id assigned to collaborator instance
    @collaborator.goal = @goal

    if @collaborator.save
      redirect_to goal_path(@goal.id, :anchor => "collab-anchor"), alert: "Collaborator added!"
    else
      redirect_to goal_path(@goal.id, :anchor => "collab-anchor"), alert: "Try again!"
    end
  end

  def update
    @collaborator = Collaborator.find(params[:id])
    @collaborator.accepted = (params[:collaborator][:accepted] == "true")
    @collaborator.save
    redirect_to collaborators_path
  end

  def destroy
    # To be done
  end

  private

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end

  def check_owner
    return unless @goal.user != current_user

    redirect_to root_path, alert: 'This goal does not belong to you!'
  end

  # Only allow a list of trusted parameters through.
  def collaborator_params
    params.require(:collaborator).permit(:user)
  end
end
