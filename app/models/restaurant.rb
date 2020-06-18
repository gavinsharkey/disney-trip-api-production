class Restaurant < ApplicationRecord
  belongs_to :park, optional: true
  belongs_to :resort, optional: true

  has_many :reservations, as: :reservable
  has_many :days, through: :reservations
end
