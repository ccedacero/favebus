class RiderRoute < ApplicationRecord
  belongs_to :rider
  belongs_to :bus_route

  # Fetch MTA Data
  def fetch_bus_status
    stop_id = RouteDatum.find_by(route: self.route).stop_id
    response = HTTParty.get("http://bustime.mta.info/api/siri/stop-monitoring.xml?key=....goeshere....&OperatorRef=MTA&MonitoringRef=#{stop_id}&LineRef=MTA%20NYCT_#{self.route}")
    data = response.parsed_response
    bus_info = []
    if data["Siri"]["ServiceDelivery"]["StopMonitoringDelivery"]["MonitoredStopVisit"] != nil
      data["Siri"]["ServiceDelivery"]["StopMonitoringDelivery"]["MonitoredStopVisit"].each do |attr|
        # p "NEXT BUS ARRIVING IN:"
        bus_info << attr["MonitoredVehicleJourney"]["LineRef"][9..-1]
        bus_info << attr["MonitoredVehicleJourney"]["MonitoredCall"]["ExpectedArrivalTime"][9..-1]
        bus_info << attr["MonitoredVehicleJourney"]["MonitoredCall"]["Extensions"]["Distances"]["PresentableDistance"]
        bus_info << attr["MonitoredVehicleJourney"]["DestinationName"]
        bus_info << attr["MonitoredVehicleJourney"]["MonitoredCall"]["Extensions"]["Distances"]["StopsFromCall"]
        bus_info << attr["RecordedAtTime"]
      end
      bus_info
    end
  end
end
