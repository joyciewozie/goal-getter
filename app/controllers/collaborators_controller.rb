class CollaboratorsController < ApplicationController
  before_action :set_goal, :check_owner, only: %i[create]

  def index
    @user = current_user
<<<<<<< HEAD
    # @collaborators = Collaborator.where(user: current_user)
=======
    @collaborators_accepted = Collaborator.where(accepted: true, user: current_user)
    @collaborators = Collaborator.where(accepted: false, user: current_user)

>>>>>>> 2daafb8cfa6c73749f25d86e4405ee1ace2f8f8f
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
      redirect_to goal_path(@goal.id), notice: "Collaborator added!"
    else
      redirect_to goal_path(@goal.id), notice: "Try again!"
      # render "../views/goals/_collaborators.html.erb ", status: :unprocessable_entity
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
