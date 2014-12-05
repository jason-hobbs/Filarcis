class ContentsController < ApplicationController
  before_action :require_signin
  #before_action :require_admin
  before_action :get_user
  before_action :get_project
  before_action :get_content, only: [:show]

  def index
    @projects = Project.where(:user_id => @user.id).order(:name)
    @contents = @project.contents
    @notes = @project.notes
    respond_to do |format|
      format.js
      format.html
    end
  end

  def new
    @content=Content.new
  end

  def create
    @content = Content.new(content_params)
    @content.project_id = @project.id
    @content.name = @content.location.filename
    if @content.save
      redirect_to dashboards_path, :gflash => { :success => "Files Uploaded" }
    else
      render :new
    end
  end

  def show
    send_file(@content.location.current_path, :filename => @content.name, :target => "_blank", :disposition => 'inline', :type => @content.content_type, :x_sendfile=>true)
  end

  def destroy_multiple
    #fail
    #Content.destroy(params[:content_ids])
    Content.where(:project_id => @project, :id => params[:content_ids]).delete_all
    Note.where(:project_id => @project, :id => params[:content_ids]).delete_all
    redirect_to project_contents_path(@project)
  end

private

def content_params
    params.require(:content).permit(:name, :location, :project_id)
end

end
