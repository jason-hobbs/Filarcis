class SearchController < ApplicationController
  respond_to :html, :json
  before_action :require_signin
  before_action :get_user

  def index

    if params[:query].blank?
      redirect_to root_url, :gflash => { :warning => "No search term entered" }
    else
      @query = params[:query]
      @notes = Note.where('title ilike ?', "%#{@query}%")
      @contents = Content.where('name ilike ?', "%#{@query}%").where(project_id: Project.where(user_id: @user.id))
    end
  end
end
