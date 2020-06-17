require 'pry'
require "faker"
require 'csv'
require "httparty"


# 1. Best way to create new rider route instances 
# 2. Where to put my methods 

# Rider.dependent_destroy_all
# BusRoute.dependent_destroy_all
# Rider.destroy_all 


  
def find_routes(stop_name)
    available_routes = []
RouteDatum.all.each do |dt|
    # binding.pry 
    if dt["stop_name"] == stop_name
available_routes << dt["route"]
    end 
end
available_routes.uniq! 
end

# routes_available = find_routes(stop_name)
# stop_name = "WHITE PLAINS RD/E GUN HILL RD"
# stop_id = RouteDatum.find_by(stop_name:stop_name)
# id = stop_id.stop_id

# SEEDING NAMES HERE 
def seed_names
    10.times do
      name = Faker::Name.unique.first_name
      last = Faker::Name.unique.last_name
      full_name = name + " " + last
    #   username = name[0] + last
    #   username.downcase!
      User.create(name: full_name)
    end
  end
#  seed_names()

#  Will need to match the bus routes created below to the stops that I load. 
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
# fetch_bus_status("308209","B63")
# if row["route_short_name"] == "Bx22"
# SEEDING RIDER ROUTES INTO DATABASE


routes = "/Users/devtzi/Downloads/bronx_bus_stop_data/routes.txt"
# MTA NYCT,BX13,Bx13,George Washington Bridge - Yankee Stadium,3,via Ogden Av / W 181st St,006CB7,FFFFFF,-999


# ****I will need to match all the stop_ids to their stop_names and Buses 
# probably store all stop ids, and names and then iterate to see 
# if the stop times data id matches the current iteration stop id 
#     if it does, take the trip id. 
stops = "/Users/devtzi/Downloads/bronx_bus_stop_data/stops.txt"
# stop_id: 102375,stop_name: E 180 ST/SOUTHERN BL
stop_times = "/Users/devtzi/Downloads/bronx_bus_stop_data/stop_times.txt"
# trip_id":"GH_F0-Saturday-000000_BX41_1" "stop_id":"102793"

def ft_bx(str)
    i = str.index('BX')
    if i != nil 
    t = i + 4
    route = str[i...t]
   end
   end
   

def load_csv_data(file_path)
    st_data = {}
    CSV.foreach(file_path, :headers => true) do |row|    
        
        trip_id = ft_bx(row["trip_id"]) 
        if trip_id != nil 
        st_data[row["stop_id"]] = trip_id
                # binding.pry 
        end
  end
  stops = "/Users/devtzi/Downloads/bronx_bus_stop_data/stops.txt"
  stop_info = []
  st_data.each do |st|
  CSV.foreach(stops, :headers => true) do |row|    
    if st[0] == row["stop_id"]
        arr = []
        arr << st[0]
        arr << st[1] 
        arr <<row["stop_name"]
        stop_info << arr 
    end
  end 
  end
  p stop_info.count 
stop_info.uniq
end

rd_data = load_csv_data(stop_times)
unique_routes = rd_data.map {|bx| bx[1]}.uniq 

#  SEEDING BUS-ROUTES 
def seed_bus_routes(data)
    data.each do |rt|
        BusRoute.create(route: rt)
    end
    end

    seed_bus_routes(unique_routes)
# need_formatting = [] 
# rd_data.each do |attr|
# if attr[1][-1] != "_"
    
#     RouteDatum.create(stop_id: attr[0].to_i, stop_name: attr[2], route: attr[1]) 
# else 
#     need_formatting << attr
# end
# binding.pry 
# end
# binding.pry 





#   RouteDatum.create(stop_id: row["stop_id"].to_i, stop_name: row["stop_name"], route:row["trip_id"][22...-2]) 
#   RouteDatum.create(stop_id:row["stop_id"],route:row["trip_id"][22...-2])


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