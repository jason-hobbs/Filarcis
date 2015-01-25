class SearchController < ApplicationController
  respond_to :html, :json
  before_action :require_signin
  before_action :get_user

  def index
    @query = params[:query]
    @notes = Note.where('title ilike ?', "%#{@query}%")
    @contents = Content.where('name ilike ?', "%#{@query}%")
  end
end
