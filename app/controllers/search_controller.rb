class SearchController < ApplicationController
  respond_to :html, :json
  before_action :require_signin
  before_action :get_user

  def index
    if params[:query].blank?
      redirect_to root_url, :gflash => { :warning => "No search term entered" }
    else
      @query = params[:query]
      @notes = search_notes
      @contents = search_contents
    end
  end

  def justsearch
    @query = params[:query]
    @notes = search_notes
    @contents = search_contents
    respond_to do |format|
      format.js
      format.html
    end
  end

  private
  def search_notes
    Note.where('title ilike ? or content ilike ?', "%#{@query}%", "%#{@query}%").where(project_id: Project.where(user_id: @user.id))
  end

  def search_contents
    Content.where('name ilike ?', "%#{@query}%").where(project_id: Project.where(user_id: @user.id))
  end



end
