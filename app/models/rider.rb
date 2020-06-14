class Rider < ApplicationRecord
    has_many :rider_routes , dependent: :destroy 
    has_many :bus_routes, through: :rider_routes

    validates :name, presence: true 
end
