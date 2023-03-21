class CollaboratorsController < ApplicationController
  before_action :set_goal, :check_owner

  # GET /goals/:goal_id/collaborators (goal_collaborators)
  def index
    @collaborator = Collaborator.all
  end

  # POST /goals/:goal_id/collaborators
  # only the goal owner can add collaborators to his goals
  def create
    @collaborator = Collaborator.new
    @user = User.find_by_email(params[:collaborator][:user])

    # goal_owner input user_id
    # @user = User.find(collaborator_params)
    @collaborator.user = @user
    # goal_id assigned to collaborator instance
    @collaborator.goal = @goal
    if @collaborator.save
      redirect_to goal_collaborators_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /goals/:goal_id/collaborators/:id (goal_collaborator)
  def show

  end


  # PUT /goals/:goal_id/collaborators/:id (goal_collaborator)
  def update

  end

  # GET /goals/:goal_id/collaborators/new (new_goal_collaborator)
  def new
    @collaborator = Collaborator.new
  end

  # GET /goals/:goal_id/collaborators/:id/edit (edit_goal_collaborator)
  def edit

  end


  def destroy

  end


  private

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end

  def check_owner
    if @goal.user != current_user
      redirect_to root_path, alert: 'This goal does not belong to you!'
    end
  end

  # Only allow a list of trusted parameters through.
  def collaborator_params
    params.require(:collaborator).permit(:email)
  end
end
