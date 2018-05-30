class Api::NotesController < ApplicationController

  def index
    @notes = Note.find(params[:id])
    render json: @notes
  end
  
  def show
    @note = Note.find(params[:id])
    render json: @note
  end

end
