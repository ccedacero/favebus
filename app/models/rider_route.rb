class RiderRoute < ApplicationRecord
  belongs_to :rider
  belongs_to :bus_route

  def fetch_bus_status
   #  byebug
   stop_id =  RouteDatum.find_by(route:self.route).stop_id
    response = HTTParty.get("http://bustime.mta.info/api/siri/stop-monitoring.xml?key=31df2baf-01e5-4a65-80a6-82c960de5740&OperatorRef=MTA&MonitoringRef=#{stop_id}&LineRef=MTA%20NYCT_#{self.route}")
    data = response.parsed_response
    # byebug
    bus_info = []
    if data["Siri"]["ServiceDelivery"]["StopMonitoringDelivery"]["MonitoredStopVisit"] != nil 
    data["Siri"]["ServiceDelivery"]["StopMonitoringDelivery"]["MonitoredStopVisit"].each do |attr|
    #    byebug
       # p "NEXT BUS ARRIVING IN:"
        bus_info << attr["MonitoredVehicleJourney"]["LineRef"][9..-1]
        bus_info << attr["MonitoredVehicleJourney"]["MonitoredCall"]["ExpectedArrivalTime"][9..-1]
        bus_info << attr["MonitoredVehicleJourney"]["MonitoredCall"]["Extensions"]["Distances"]["PresentableDistance"]
        bus_info << attr["MonitoredVehicleJourney"]["DestinationName"]
        bus_info << attr["MonitoredVehicleJourney"]["MonitoredCall"]["Extensions"]["Distances"]["StopsFromCall"]
        bus_info << attr["RecordedAtTime"]    
       # BusRoute.create(route: route, arrival_time: arrival_time, bus_distance:bus_distance, destination_name:destination_name, dispace_by_stops:distance_by_stops,last_update: last_update)    
       # p"NEXT BUS TIME COMING UP"
       # bus_stop = attr["MonitoredVehicleJourney"]["MonitoredCall"]["StopPointName"]
    #    bus = BusRoute.find(self.id)
    #    bus.update(route: route, arrival_time: arrival_time, bus_distance: bus_distance, destination_name: destination_name, dispace_by_stops: distance_by_stops, last_update: last_update)
     end 
    #  byebug
     bus_info
    end
   end
   
end
