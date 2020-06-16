class RiderRoutesController < ApplicationController
    def index 
        @rider_routes = RiderRoute.all
    end

    def show 
        @rider_route = RiderRoute.find(params[:id])
    end

    def new 
        @errors = flash[:errors]
        @riders = Rider.all 
        @route_data = RouteDatum.all 
        @bus_route = BusRoute.all 
        @rider_route = RiderRoute.new
    end

    def create
        # route_id = RouteDatum.find(params)
        stop_id = RouteDatum.find(params["rider_route"]["bus_route_id"]).stop_id.to_i
        bus_route_id = params["rider_route"]["bus_route_id"]
        stop_name = params["rider_route"]["stop_name"]
        rider_id = params["rider_route"]["rider_id"]
        rider_route = RiderRoute.create(stop_id: stop_id, stop_name: stop_name, rider_id: rider_id, bus_route_id: bus_route_id)
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

    def rider_route_params(*args)
        params.require(:rider_route).permit(*args)
    end

end
