class Rider < ApplicationRecord
    has_many :rider_routes
    has_many :bus_routes, through: :rider_routes
end
