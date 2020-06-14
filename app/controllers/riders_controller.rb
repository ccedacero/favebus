class RidersController < ApplicationController
    def index 
        @riders = Rider.all
    end

    def show 
        @rider = Rider.find(params[:id])
    end

    def new 
        @errors = flash[:errors]
        @rider = Rider.new
    end

    def create
        rider = Rider.create(rider_params)
        redirect_to rider_path(rider)
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
        redirect_to riders_path
    end

    private 

    def rider_params(*args)
        params.require(:rider).permit(:name)
    end

end
