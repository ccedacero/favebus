class RiderRoute < ApplicationRecord
  belongs_to :rider
  belongs_to :bus_route
  has_many :route_datums 
end
