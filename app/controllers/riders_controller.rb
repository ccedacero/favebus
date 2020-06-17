class RidersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    
    def index 
        @riders = Rider.all
    end

    def new 
        @errors = flash[:errors]
        @rider = Rider.new
    end

    def create
        @rider = Rider.create(rider_params)
        session[:rider_id] = @rider.id 
        redirect_to '/welcome'
        # redirect_to rider_path(rider)
    end

    def show 
        @rider = Rider.find(params[:id])
        bx_routes = @rider.bus_routes.map {|rt| rt.route}
        @bus_arrival = @rider.rider_routes.map {|route| {
            name: route.stop_name,
            bus_arrival_data: route.bus_route.fetch_bus_status.flatten
        }}
        # byebug
    end


    def edit 
        @rider = Rider.find(params[:id])
    end

    def update 
        @rider = Rider.find(params[:id])
        @rider.update(rider_params)
        redirect_to rider_path(rider_params)
    end

    def destroy 
        rider = Rider.find(params[:id])
        rider.destroy()
        redirect_to '/welcome'
    end

    private 

    def rider_params
        params.require(:rider).permit(:name, :username, :password)
    end
        
    

end
