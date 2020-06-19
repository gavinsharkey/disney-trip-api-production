class Day < ApplicationRecord
  belongs_to :trip
  has_many :reservations, dependent: :destroy
  has_many :restaurants, through: :reservations, source: :reservable, source_type: "Restaurant"
  has_many :attractions, through: :reservations, source: :reservable, source_type: "Attraction"

  scope :by_created, -> { order(:created_at) }

  def place
    self.trip.days.by_created.index(self) + 1
  end
end
