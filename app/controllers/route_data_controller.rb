class RouteDataController < ApplicationController

    def station_information 
        @bus_stop = RouteDatum.new 
        @stop_data= RouteDatum.all
    end
    
end
