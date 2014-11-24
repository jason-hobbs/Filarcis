class NotesController < ApplicationController
  before_action :require_signin
  before_action :get_user
  before_action :get_project

  def index
    @notes = @project.notes
    respond_to do |format|
      format.js
      format.html
    end
  end

  def new
    @note=Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.project_id = @project.id
    if @note.save
      redirect_to dashboards_path, :gflash => { :success => "Files Uploaded" }
    else
      render :new
    end
  end

  def show

  end

  private

  def content_params
    params.require(:note).permit(:title, :content, :project_id)
  end

end
