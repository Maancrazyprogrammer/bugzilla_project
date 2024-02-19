class JoinsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    authorize! :new, Join

    @join = Join.new
    @join.project_id = params[:project_id]
  end

  def create
    authorize! :create, Join
    @join = Join.new(join_params)

    if @join.save
      redirect_to project_path(@join.project), notice: 'Project assigned successfully.'
    else
      render :new
    end
  end


  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def join_params
    params.require(:join).permit(:user_id, :project_id)
  end
end
