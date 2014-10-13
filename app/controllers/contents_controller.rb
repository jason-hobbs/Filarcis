class ContentsController < ApplicationController
  before_action :require_signin
  #before_action :require_admin
  before_action :get_user
  before_action :get_project
  before_action :get_content, only: [:show]
  def index

    @contents = @project.contents

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
    #pdf_filename = File.join(Rails.root, @content.location.url)
    send_file(@content.location.current_path, :filename => @content.name, :disposition => 'inline', :type => "application/pdf")
  end

private

def content_params
    params.require(:content).permit(:name, :location, :project_id)
end

end
