class Reservation < ApplicationRecord
  belongs_to :day, optional: true
  belongs_to :reservable, polymorphic: true
end
