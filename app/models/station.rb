class Station < ApplicationRecord

    def format_str(str)
        string = str.split("T")
        string
      end  
      
    def fetch_station_status(station_id)
        # byebug
        response = HTTParty.get("http://bustime.mta.info/api/siri/stop-monitoring.xml?key=31df2baf-01e5-4a65-80a6-82c960de5740&OperatorRef=MTA&MonitoringRef=#{station_id}")
        data = response.parsed_response
        bus_info = []
        if data["Siri"]["ServiceDelivery"]["StopMonitoringDelivery"]["MonitoredStopVisit"] != nil 
        data["Siri"]["ServiceDelivery"]["StopMonitoringDelivery"]["MonitoredStopVisit"].each do |attr|
        #    byebug
           # p "NEXT BUS ARRIVING IN:"
           if attr["MonitoredVehicleJourney"]["MonitoredCall"]["ExpectedArrivalTime"] != nil
            bus_info << attr["MonitoredVehicleJourney"]["LineRef"][9..-1]
            arrival = attr["MonitoredVehicleJourney"]["MonitoredCall"]["ExpectedArrivalTime"]
            arrival = format_str(arrival)[1][0..7]
            bus_info << arrival
            bus_info << attr["MonitoredVehicleJourney"]["MonitoredCall"]["Extensions"]["Distances"]["PresentableDistance"]
            bus_info << attr["MonitoredVehicleJourney"]["DestinationName"]
            bus_info << attr["MonitoredVehicleJourney"]["MonitoredCall"]["Extensions"]["Distances"]["StopsFromCall"]
      
            last_update = attr["RecordedAtTime"]
            last_update = format_str(attr["RecordedAtTime"])[1][0..7]
            bus_info << last_update
         end 
        end 
         bus_info
        end
       end

end
