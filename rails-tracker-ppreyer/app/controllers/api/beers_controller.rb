class Api::BeersController < ApplicationController
  
  def index 
    @beers = Beer.all
    render json: @beers
  end

  def show
    @beer = Beer.find(params[:id])
    render json: @beer
  end

  def destroy
    @beer = Beer.find(params[:id])
    if @beer
      @beer.destroy
      render status 202
    else
      render status 404
    end
  end
end
