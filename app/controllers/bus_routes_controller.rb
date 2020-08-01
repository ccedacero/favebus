class BusRoutesController < ApplicationController
  def index
    @bus_routes = BusRoute.all
  end

  def show
    @bus_route = BusRoute.find(params[:id])
  end
end
