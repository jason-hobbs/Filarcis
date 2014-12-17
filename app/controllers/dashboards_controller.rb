class DashboardsController < ApplicationController
  before_action :require_signin
  #before_action :require_admin
  before_action :get_user
  def index
    if session[:user_id]
      @user = current_user
    end
      @projects = Project.where(:user_id => @user.id).order(:name)
      @project = Project.where(:user_id => @user.id, :name => "inbox")
  end
end
