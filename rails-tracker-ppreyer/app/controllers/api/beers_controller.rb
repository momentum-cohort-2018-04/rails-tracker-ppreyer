class Api::BeersController < ApplicationController
  
  def index 
    if params[:name].blank?
      @beers = Beer.all
      render json: @beers
    else
      @beer_name = params[:name]
      @beers = Beer.find(@beer_name) 
      render json: @beers
    end
  end

  def show
    @beer = Beer.find(params[:id])
    render json: @beer
  end

  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      render json: @beer, status: 201, location: api_beers_path
    else
      render json: @beer.errors, status: 404
    end
  end

  def update
    @beer = Beer.find(params[:id])
    if @beer.update(beer_params)
      render json: @beer
    else
      render json: @beer.errors, status: 404
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
