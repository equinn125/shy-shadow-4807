class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
    @plants = Plant.plants_by_garden(@garden.id)
  end
end
