class DashboardsController < ApplicationController
  before_action :require_signin
  #before_action :require_admin
  before_action :get_user
  def index
    if session[:user_id]
      @user = current_user
    end
      #@projects = Project.where(:user_id => @user.id).order(:name)
      #@project = Project.where(:user_id => @user.id, :name => "inbox-system")
      #redirect_to project_contents_path(@project)
      @project = Project.find_by(:name => 'inbox-system', :user_id => @user.id)
      redirect_to project_contents_path(@project.id)
  end
end
