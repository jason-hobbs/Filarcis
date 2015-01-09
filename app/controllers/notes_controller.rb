class NotesController < ApplicationController
  before_action :require_signin
  before_action :get_user
  before_action :get_project
  before_action :require_correct_user
  before_action :get_note, only: [:show, :edit, :update]

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

  def edit

  end

  def show

  end

  def update
    if @note.update(note_params)
      redirect_to project_note_path(@project, @note), :gflash => { :success => "Note saved" }
    else
      render :edit
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :content, :project_id)
  end

  def get_note
    @note = Note.find(params[:id])
  end

end
