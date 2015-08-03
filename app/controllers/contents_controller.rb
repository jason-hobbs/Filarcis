class ContentsController < ApplicationController
  respond_to :html, :json
  helper_method :sort_column, :sort_direction
  before_action :require_signin, except: [:download_file]
  before_action :get_user, except: [:download_file]
  before_action :get_project
  before_action :get_inbox, except: [:download_file]
  before_action :require_correct_user, except: [:download_file]
  before_action :get_content, only: [:show, :update]
  before_action :get_all, only: [:index, :justentries]

  def index
    respond_to do |format|
      format.js
      format.html
    end
  end

  def justentries
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
    @content.save
    render :new
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
    if @content.public
      send_file @content.location.current_path
    else
      unless require_correct_user
        send_file @content.location.current_path
      end
    end
  end

  def share
    @content = @project.contents.find_by(id: params[:content])
    if @content.public
      @content.public = FALSE
    else
      @content.public = TRUE
    end
    @content.save
    respond_to do |format|
      format.js
      format.html
    end
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

def get_all
  if params[:sort].nil?
    @sort = 'name'
  else
    @sort = params[:sort]
  end
  if params[:direction].nil?
    @direction = 'asc'
  else
    @direction = params[:direction]
  end
  @projects = Project.where(:user_id => @user.id).where.not(:name => 'inbox-system').order(:name)
  @contents = @project.contents.order(sort_column + ' ' + sort_direction)
  @notes = @project.notes.order(sort_column_notes + ' ' + sort_direction)
end

def content_params
    params.require(:content).permit(:name, :location, :project_id)
end

private
  def sort_column
    Content.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_column_notes
    Note.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
