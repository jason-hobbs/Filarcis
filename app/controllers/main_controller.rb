class MainController < ApplicationController
  before_action :get_user
  def index
    if session[:user_id]
      redirect_to dashboards_path
    end
  end
end
