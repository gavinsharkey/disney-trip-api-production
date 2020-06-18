class Attraction < ApplicationRecord
  belongs_to :park

  has_many :reservations, as: :reservable
  has_many :days, through: :reservations
end
