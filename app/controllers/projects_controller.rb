class ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_project, only: [:show]
  # before_action :authorize_post, only: [:new,:create,:show, :edit, :update, :destroy]
  def index
    # authorize! :read, Project
    if current_user.manager? || current_user.QA?
      @projects=Project.all
    else
      @projects_assigned_to_user = current_user.projects
      @bugs_assigned_to_user = Bug.joins(:project).where(project: { id: @projects_assigned_to_user })
    end


  end

  def new
    authorize! :new, Project

    # @project.joins.build
    @project = Project.new
    @project.joins.build(user_id: params[:user_id])
    @project_id_for_form = SecureRandom.uuid # Generate a temporary project_id

  end

  def create
    authorize! :create, Project
    @project = Project.new(project_params)


    if @project.save
      # SendProjectAssignmentEmailJob.perform_later(user, project)
      SendProjectAssignmentEmailJob.perform_later(@project.joins.first.user, @project)
      redirect_to project_path(@project), notice: 'project created successfully!'
    else
      render :new
    end
  end
  def project_bugs_path
    # This action is responsible for rendering the bug assignment form.
    @bug = Bug.new
  end
  def edit
    authorize! :edit, Project
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    authorize! :update, Project


    if @project.update(project_params)
      redirect_to projects_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    authorize! :read, Project

    @project = Project.find(params[:id])
    @users=@project.users
    @bugs=@project.bugs
  end

  def destroy
    @project=Project.find(params[:id])
    authorize! :destroy, Project

    if @project.destroy
      redirect_to projects_path, notice:'Project deleted successfully!'
    else
      redirect_to projects_path, notice:'Something went Wrong!'
    end


  end
  def remove_user
    @project = Project.find(params[:id])
    @user = User.find(params[:user_id])

    @project.users.destroy(@user)

    redirect_to @project, notice: 'User removed from the project.'
  end
  def set_project
    @project = Project.find(params[:id])
  end
  # def authorize_post
  #   authorize! action_name.to_sym, Project
  # end
  private

  def project_params
    params.require(:project).permit(:p_Name, :p_desc, joins_attributes: [:user_id, :project_id])
  end

end
