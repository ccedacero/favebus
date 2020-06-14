class BusRoute < ApplicationRecord
    has_many :rider_routes
    has_many :riders, throuhg: :rider_routes
end
