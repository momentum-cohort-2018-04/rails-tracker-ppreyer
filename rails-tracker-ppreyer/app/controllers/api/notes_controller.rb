class Api::NotesController < ApplicationController

  def index
    @beer = Beer.find(params[:beer_id])
    @notes = @beer.notes
    render json: @notes
  end

  def show
    @beer = Beer.find(params[:beer_id])
    @note = @beer.notes.find(params[:id])
    render json: @note
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @note = Note.find(params[:id])
    if @note
      @note.destroy
      render status 202
    else
      render status 404
    end
  end

  private

  def note_params
    params.require(:note).permit(:id, :content, :beer_id)
  end

end
