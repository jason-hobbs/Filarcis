class ContentsController < ApplicationController
  before_action :require_signin
  #before_action :require_admin
  before_action :get_user
  before_action :get_project
  def index

    @contents = @project.contents

  end

  def new
    @content=Content.new
  end

def create
      @content = Content.new(content_params)
      if @content.save
        redirect_to dashboards_path, :gflash => { :success => "Files Uploaded" }
      else
        render :new
      end
end

private

def content_params
    params.require(:content).permit(:location)
end

end
