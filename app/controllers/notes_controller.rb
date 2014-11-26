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
      redirect_to project_contents_path(@project), :gflash => { :success => "Note Created" }
    else
      render :new
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  private

  def note_params
    params.require(:note).permit(:title, :content, :project_id)
  end

end
