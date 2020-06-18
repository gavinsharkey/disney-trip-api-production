class Day < ApplicationRecord
  belongs_to :trip
  has_many :reservations
  has_many :restaurants, through: :reservations, source: :reservable, source_type: "Restaurant"
  has_many :attractions, through: :reservations, source: :reservable, source_type: "Attraction"
end
