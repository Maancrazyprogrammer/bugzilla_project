class BugsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:new, :create, :edit, :update,:destroy]
  before_action :set_bug, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :index, Bug

    @bugs = Bug.all

  end


  def new
    authorize! :new, Bug

    @bug = Bug.new
    # @project_id = params[:project_id]
  end


    def create
      authorize! :create, Bug
      @bug = @project.bugs.build(bug_params)

      if @bug.save
        redirect_to @bug, notice: 'Bug was successfully created.'
      else
        render :new
      end
    end


    def edit
      authorize! :edit, Bug
      @bug = Bug.find(params[:id])
    end

    def update
      @bug = Bug.find(params[:id])
      authorize! :update, Bug


      if @bug.update(bug_params)
        redirect_to bugs_path, notice: "Request sucessfull Completed!"
      else
        render :edit, status: :unprocessable_entity
      end
    end
    def show
    authorize! :show, Bug
  end

  def destroy
  end

  private
  def set_bug
    @bug = Bug.find(params[:id])
  end
  def set_project
    @project = Project.find(params[:project_id])
  end

  def bug_params
    params.require(:bug).permit(:b_Title,:b_type,:status,:b_deadline, :project_id,:user_id)
  end


end
