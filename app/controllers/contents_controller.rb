class ContentsController < ApplicationController
  respond_to :html, :json
  before_action :require_signin
  before_action :get_user
  before_action :get_project
  before_action :get_inbox
  before_action :require_correct_user
  before_action :get_content, only: [:show, :update]

  def index
    @projects = Project.where(:user_id => @user.id).where.not(:name => 'inbox-system').order(:name)
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

  def update
    @content.update_attributes(content_params)
    respond_with @content
  end

  def movefile
    params[:source].split(",").each do |file|
      @content = @project.contents.find_by(id: file)
      @note = @project.notes.find_by(id: file)
      if @content
        @content.update_attributes(:project_id => params[:dest])
      end
      if @note
        @note.update_attributes(:project_id => params[:dest])
      end
    end
    redirect_to project_contents_path(params[:dest])
  end

  def show
    #send_file(@content.location.current_path, :filename => @content.name, :target => "_blank", :disposition => 'inline', :type => @content.content_type, :x_sendfile=>true)
    render :layout => false
  end

  def view_file
    @content = @project.contents.find_by(id: params[:content])
    send_file(@content.location.current_path, :filename => @content.name, :target => "_blank", :disposition => 'inline', :type => @content.content_type, :x_sendfile=>true)
  end

  def download_file
    @content = @project.contents.find_by(id: params[:content])
    send_file @content.location.current_path
  end

  def destroy_multiple
    if(params[:content_ids])
      params[:content_ids].each do |file|
        @content = @project.contents.find_by(id: file)
        if @content
          @content.remove_location!
        end
      end
      Content.where(:project_id => @project, :id => params[:content_ids]).delete_all
      Note.where(:project_id => @project, :id => params[:content_ids]).delete_all
    end
    redirect_to project_contents_path(@project)
  end

private

def content_params
    params.require(:content).permit(:name, :location, :project_id)
end

end
