class BusRoute < ApplicationRecord
    has_many :rider_routes
    has_many :riders, through: :rider_routes
end
