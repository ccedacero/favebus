class StationsController < ApplicationController
  def new
    @bus_station = Station.new
    @bus_stops = RouteDatum.all
  end

  def create
    station = Station.create(station_route_params)
    redirect_to station_path(station)
  end

  def show
    @station = Station.find(params[:id])
    @station_data = @station.fetch_station_status(@station.station_id)
  end

  private

  def station_route_params
    params[:station].permit(:station_id)
  end
end
