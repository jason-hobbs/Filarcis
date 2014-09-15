class ProjectsController < ApplicationController
  before_action :get_user
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = @user.id
    respond_to do |format|
      if @project.save
        format.html { redirect_to dashboards_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def project_params
      params.require(:project).permit(:name)
  end
end
