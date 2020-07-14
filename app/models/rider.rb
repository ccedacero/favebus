class Rider < ApplicationRecord
    has_many :rider_routes , dependent: :destroy 
    has_many :bus_routes, through: :rider_routes ,dependent: :destroy
    has_secure_password
    validates :name, presence: true 
       
end
# //added the dependent for bus_routes here 