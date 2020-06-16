class RiderRoute < ApplicationRecord
  belongs_to :rider
  belongs_to :bus_route
end
