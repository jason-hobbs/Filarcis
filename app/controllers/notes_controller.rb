class NotesController < ApplicationController
  before_action :require_signin
  before_action :get_user
  before_action :get_project, except: [:upload_file]
  before_action :require_correct_user, except: [:upload_file]
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

  def upload_file
    if params[:file]
      FileUtils::mkdir_p(Rails.root.join('public/uploads/files'))
      ext = File.extname(params[:file].original_filename)
      file_name = "#{SecureRandom.urlsafe_base64}#{ext}"
      path = Rails.root.join('public/uploads/files/', file_name)
      File.open(path, "wb") {|f| f.write(params[:file].read)}
      render :text => {:link => "/uploads/files/#{file_name}"}.to_json
    else
      render :text => {:link => nil}.to_json
    end
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
