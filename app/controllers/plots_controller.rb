class PlotsController < ApplicationController
  def index
    @plots = Plot.all
  end

  def destroy
    plot = Plot.find(params[:id])
    plot.destroy
    redirect_to "/plots"
  end
end
