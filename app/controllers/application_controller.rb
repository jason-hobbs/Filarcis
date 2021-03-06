class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private
  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to login_path, :gflash => {:warning => "Please sign in first!"}
    end
  end
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?

  def require_admin
    unless current_user_admin?
      redirect_to root_url, :gflash => {:warning => "Unauthorized access!"}
    end
  end

  def current_user_admin?
    current_user && current_user.admin?
  end

  helper_method :current_user_admin?

  def get_user
    if session[:user_id]
      @user = current_user
    end
  end

  helper_method :get_user

  def get_inbox
    @inbox = Project.find_by(:name => 'inbox-system', :user_id => @user.id)
  end

  helper_method :get_inbox

  def get_project
      @project = Project.find(params[:project_id])
  end

  helper_method :get_project

  def get_content
    @content = @project.contents.find_by(id: params[:id])

  end

  helper_method :get_content

  def require_correct_user
    @user = User.find(@project.user_id)
    redirect_to root_url unless current_user?(@user)
  end

  helper_method :require_correct_user

end
