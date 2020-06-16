class RiderRoutesController < ApplicationController
    def index 
        @rider_routes = RiderRoute.all
    end

    def show 
        @rider_route = RiderRoute.find(params[:id])
        bus_route= @rider_route.bus_route
        @bus_arrival_data = bus_route.fetch_bus_status
    end

    def new 
        @errors = flash[:errors]
        @riders = Rider.all 
        @bus_route = BusRoute.all 
        @route_data = RouteDatum.all 
        @rider_route = RiderRoute.new
    end

    def create
        # route_id = RouteDatum.find(params)
        # bus_route_id = params["rider_route"]["bus_route_id"]
        stop_name = RouteDatum.find_by(stop_id:params["rider_route"]["stop_id"]).stop_name
        params["rider_route"]["stop_name"] = stop_name
        params["rider_route"]["stop_id"] = params["rider_route"]["stop_id"].to_i
        rider_route = RiderRoute.create(rider_route_params)
        redirect_to rider_route_path(rider_route)
    end

    def edit 
        @rider_route = RiderRoute.find(params[:id])
    end

    def update 
        rider_route = RiderRoute.find(params[:id])
        rider_route.update(rider_route_params)
        redirect_to rider_route_path(rider_route_params)
    end

    def destroy 
        rider_route = RiderRoute.find(params[:id])
        rider_route.destroy()
        redirect_to riders_route_path
    end

    private 

    def rider_route_params
        params.require(:rider_route).permit(:stop_id, :stop_name,:rider_id, :bus_route_id)
    end

end
