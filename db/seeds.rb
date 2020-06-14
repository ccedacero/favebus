require 'pry'
require "faker"
require 'csv'
require "httparty"

# Rider.dependent_destroy_all
# BusRoute.dependent_destroy_all
# Rider.destroy_all 

# SEEDING NAMES HERE 
# def seed_names
#     10.times do
#       name = Faker::Name.unique.first_name
#       last = Faker::Name.unique.last_name
#       full_name = name + " " + last
#       username = name[0] + last
#       username.downcase!
#       User.create(username: username, name: full_name)
#     end
#   end
 

#  Will need to match the bus routes created below to the stops that I load. 
#  SEEDING BUS-ROUTES 
# response = HTTParty.get("http://bustime.mta.info/api/siri/stop-monitoring.xml?key=31df2baf-01e5-4a65-80a6-82c960de5740&OperatorRef=MTA&MonitoringRef=308209&LineRef=MTA%20NYCT_B63")
# data = response.parsed_response
# binding.pry 

def fetch_bus_status(stop_id,route)
 response = HTTParty.get("http://bustime.mta.info/api/siri/stop-monitoring.xml?key=31df2baf-01e5-4a65-80a6-82c960de5740&OperatorRef=MTA&MonitoringRef=#{stop_id}&LineRef=MTA%20NYCT_#{route}")
 data = response.parsed_response
 data["Siri"]["ServiceDelivery"]["StopMonitoringDelivery"]["MonitoredStopVisit"].each do |attr|
    # binding.pry 
    # p "NEXT BUS ARRIVING IN:"
    p route = attr["MonitoredVehicleJourney"]["LineRef"][9..-1]
    p arrival_time = attr["MonitoredVehicleJourney"]["MonitoredCall"]["ExpectedArrivalTime"]
    p bus_distance = attr["MonitoredVehicleJourney"]["MonitoredCall"]["Extensions"]["Distances"]["PresentableDistance"]
    p destination_name = attr["MonitoredVehicleJourney"]["DestinationName"]
    p distance_by_stops = attr["MonitoredVehicleJourney"]["MonitoredCall"]["Extensions"]["Distances"]["StopsFromCall"]
    p last_update = attr["RecordedAtTime"]    
    # BusRoute.create(route: route, arrival_time: arrival_time, bus_distance:bus_distance, destination_name:destination_name, dispace_by_stops:distance_by_stops,last_update: last_update)    
    # p"NEXT BUS TIME COMING UP"
    # bus_stop = attr["MonitoredVehicleJourney"]["MonitoredCall"]["StopPointName"]
  end 
end
fetch_bus_status("308209","B63")

# if row["route_short_name"] == "Bx22"
# SEEDING RIDER ROUTES INTO DATABASE
# file = "/Users/devtzi/Downloads/bronx_bus_stop_data/routes.txt"
# def load_csv_data(file_path)
#   i = 0 
#   while i < 11 do 
#   CSV.foreach(file_path, :headers => true) do |row|
#   BusRoute.create(route: row["route_short_name"], destination_name: row["route_long_name"])
#   binding.pry 
#     end
#   end     
#  end

# csv = File.read('/Users/devtzi/Downloads/bronx_bus_stop_data/stops.txt')
# i = 0 
# CSV.foreach("/Users/devtzi/Downloads/bronx_bus_stop_data/stops.txt", :headers => true) do |row|
#     if row["stop_id"] == "103007" 
#         binding.pry 
#         a = RiderRoute.create(stop_id: row["stop_id"].to_i, stop_name: row["stop_name"], rider_id: Rider.first.id,  busroute_id: BusRoute.first.id)
#     end

# csv = File.read('/Users/devtzi/Downloads/bronx_bus_stop_data/stops.txt')


    # if row["stop_id"] == "103007" 
# bus_info = []
    # data["Siri"]["ServiceDelivery"]["StopMonitoringDelivery"]["MonitoredStopVisit"].each do |val|
    #     p "NEXT BUS ARRIVING IN:"
        # p val["MonitoredVehicleJourney"]["PublishedLineName"]
        # binding.pry 
        # p val["MonitoredVehicleJourney"]["MonitoredCall"]["Extensions"]["Distances"]["PresentableDistance"]
        #  val["MonitoredVehicleJourney"]["MonitoredCall"].each do |bus|
        #     binding.pry 
        #     if bus[0] == "StopPointName"
        #         p bus[1]
        #     end
        #     if bus[0] == "ExpectedArrivalTime"
        #         p "Expected Arrival: #{bus[1]}"
        #     end
        #     if bus[0] == "ExpectedDepartureTime"
        #         p "Expected Departure: #{bus[1]}"
        #     end
        # end
    # end

    # p 'done seeding'

# # command line create repositiry
# # git merge name of branch here ***************

# # git log branch ^carrot master
# # this compares both branches

# # git diff master
# # git diff

# # -d  = lowecase b has a safeguard for us

# # git branch -d branch name goes here

# # from master
# # git merge add-secnd-header
# # from master, call merge