class RiderRoutesController < ApplicationController
    def index 
        @rider_routes = RiderRoutes.all
    end

    def show 
        @rider_route = Rider.find(params[:id])
    end

    def new 
        @errors = flash[:errors]
        @rider_route = RiderRoute.new
    end

    def create
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

    def rider_route_params(*args)
        params.require(:rider_route).permit(:stop_id, :stop_name, :rider_id, :bus_route_id)
    end

end
