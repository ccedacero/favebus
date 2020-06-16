class BusRoute < ApplicationRecord
    has_many :rider_routes , dependent: :destroy 
    has_many :riders, through: :rider_routes
    has_many :route_datum

end
