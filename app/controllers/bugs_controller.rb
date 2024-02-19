class BugsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:new, :create]

  def index
    authorize! :index, Bug

    @bugs = Bug.all

  end


  def new
    authorize! :new, Bug

    @bug = Bug.new


  end

  def create
    authorize! :create, Bug

    @bug = Bug.new(bug_params)
    @bug.project = @project

    if @bug.save
      redirect_to projects_path, notice: 'Bug was successfully assigned to the project.'
    else
      render :new
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def edit
    @bug = Bug.find(params[:id])
    @project = Bug.find(params[:project_id])
  end

  def update
    @bug = Bug.find(params[:id])

    if @bug.update(buges_params)
      redirect_to projects_path, notice: 'Bug updated successfully.'
    else
      render :edit
    end
  end
  def show
    authorize! :show, Bug
  end

  def destroy
  end
  private
  def bug_params
    params.require(:bug).permit(:b_Title,:b_type,:status,:b_deadline, :project_id)
  end
  def buges_params
    params.require(:bug).permit(:b_Title,:b_type,:status,:b_deadline, :project_id, :user_id)
  end

end
