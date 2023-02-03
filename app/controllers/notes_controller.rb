class NotesController < ApplicationController
  before_action :set_params, only: %i[show edit update destroy]

  def index
    @notes = Note.all
  end

  def show; end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.build(notes_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_path, notice: 'Note was successfully created.' }
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @note.update(notes_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
    end
  end

  private

  def set_params
    @note = Note.find(params[:id])
  end

  def notes_params
    params.require(:note).permit(:title, :content)
  end
end
