class ContentsController < ApplicationController
  before_action :require_signin
  #before_action :require_admin
  before_action :get_user
  before_action :get_project
  before_action :get_content, only: [:show]

  def index
    @contents = @project.contents
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
    #if @content.name.include? ".pdf"
    #  send_file(@content.location.current_path, :filename => @content.name, :target => "_blank", :disposition => 'inline', :type => "application/pdf", :x_sendfile=>true)
    #elsif @content.name.include? ".jpg"
    #  send_file(@content.location.current_path, :filename => @content.name, :disposition => 'inline', :type => "image/jpeg", :target => "_blank", :x_sendfile=>true)
    #elsif @content.name.include? ".jpeg"
    #  send_file(@content.location.current_path, :filename => @content.name, :disposition => 'inline', :type => "image/jpeg", :target => "_blank", :x_sendfile=>true)
    #elsif @content.name.include? ".png"
    #  send_file(@content.location.current_path, :filename => @content.name, :disposition => 'inline', :type => "image/png", :target => "_blank", :x_sendfile=>true)
    #else
    #  send_file(@content.location.current_path, :filename => @content.name, :x_sendfile=>true)
    #end
    send_file(@content.location.current_path, :filename => @content.name, :target => "_blank", :disposition => 'inline', :type => @content.content_type, :x_sendfile=>true)
  end

private

def content_params
    params.require(:content).permit(:name, :location, :project_id)
end

end
