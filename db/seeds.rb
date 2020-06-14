require 'pry'
require "faker"
# require 'csv'

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


# CSV.foreach("/Users/devtzi/Downloads/bronx_bus_stop_data/routes.txt", :headers => true) do |row|
#     if row["route_short_name"] == "Bx22"
#   BusRoute.create(route: row["route_short_name"], destination_name: row["route_long_name"])
#     end    
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
        
    
# end/

# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# require "httparty"
# require "pry"
# # require 'xml/to/json'

# # Station_destroy_all()
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

response = HTTParty.get("http://bustime.mta.info/api/siri/stop-monitoring.xml?key=31df2baf-01e5-4a65-80a6-82c960de5740&OperatorRef=MTA&MonitoringRef=308209&LineRef=MTA%20NYCT_B63")
data = response.parsed_response
# MTA NYCT_BX9
# http://gtfsrt.prod.obanyc.com/vehiclePositions?key=31df2baf-01e5-4a65-80a6-82c960de5740&Operator
# 31df2baf-01e5-4a65-80a6-82c960de5740
# # data["Siri"]["ServiceDelivery"]["StopMonitoringDelivery"]["MonitoredStopVisit"][0]["MonitoredVehicleJourney"]["MonitoredCall"]["ExpectedArrivalTime"]


data["Siri"]["ServiceDelivery"]["StopMonitoringDelivery"]["MonitoredStopVisit"].each do |attr|
    # binding.pry 
    # p "NEXT BUS ARRIVING IN:"
    route = attr["MonitoredVehicleJourney"]["LineRef"][9..-1]
    arrival_time = attr["MonitoredVehicleJourney"]["MonitoredCall"]["ExpectedArrivalTime"]
    bus_distance = attr["MonitoredVehicleJourney"]["MonitoredCall"]["Extensions"]["Distances"]["PresentableDistance"]
    destination_name = attr["MonitoredVehicleJourney"]["DestinationName"]
    distance_by_stops = attr["MonitoredVehicleJourney"]["MonitoredCall"]["Extensions"]["Distances"]["StopsFromCall"]
    last_update = attr["RecordedAtTime"]
    
    BusRoute.create(route: route, arrival_time: arrival_time, bus_distance:bus_distance, destination_name:destination_name, dispace_by_stops:distance_by_stops,last_update: last_update)
    
    # p"NEXT BUS TIME COMING UP"
    # bus_stop = attr["MonitoredVehicleJourney"]["MonitoredCall"]["StopPointName"]
end 








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

#     40.8620° N, 73.8857° W

#     MTA_100567

#     # k.each do |attr|
#         # binding.pry
#         # if attr.class == "Hash"
#             # attr.each do |prop|

# # end
# # dependent_destroy_all

# # puts data

# # response = HTTParty.get("https://data.ny.gov/resource/mtafarecardhistory.json?").parsed_response
# # stations = []
# # response.each do |station|
# #   station.each do |attr|
# #     if attr[0] == "station"
# #       Station.create(name: attr[1].strip)
# #     end
# #   end
# # end

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

