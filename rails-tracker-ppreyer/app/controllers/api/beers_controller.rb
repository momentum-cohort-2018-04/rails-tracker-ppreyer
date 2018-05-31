class Api::BeersController < ApplicationController
  
  def index 
    @beers = Beer.all
    render json: @beers
  end

  def show
    @beer = Beer.find(params[:id])
    render json: @beer
  end

  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      render json: @beer, status: :created, location: api_beers_path
    else
      render json: @beer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy
  end

  private

  def beer_params
    params.require(:beer).permit(:id, :name, :style, :hop, :yeast, :malts, :ibu, :alcohol, :note_id)
  end

end
