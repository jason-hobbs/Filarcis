class ContentsController < ApplicationController
  before_action :require_signin
  #before_action :require_admin
  before_action :get_user
  def index
    @project = Project.find(params[:project_id])
    @contents = @project.contents

  end
end
