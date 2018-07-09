class Api::BeersController < ApplicationController
  def index 
    if params[:seen] == "1"
      @beers = Beer.all
      @seen_beers = @beers.select do |beer|
        beer[:seen] == true
      end
      render json: @seen_beers
    elsif params[:seen] == "0"
      @beers = Beer.all
      @unseen_beers = @beers.select do |beer|
        beer[:seen] == false
      end
      render json: @unseen_beers
    elsif params[:sort] == "id"
      @beers = Beer.all
      @sorted_beers = @beers.sort
      render json: @sorted_beers
    elsif params[:sort] == "alcohol"
      @beers = Beer.all
      @sorted_beers = @beers.sort_by(&:alcohol).reverse
      render json: @sorted_beers
    else
      if params[:name].blank?
        @beers = Beer.all
        render json: @beers
      else
        @beer_name = params[:name]
        @beers = Beer.find_by! name: @beer_name
        render json: @beers
      end
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
