class Reservation < ApplicationRecord
  belongs_to :day, optional: true
  belongs_to :reservable, polymorphic: true

  validates :time, presence: true, format: { with: /\w*:\w*/, message: 'must be time format' }
end
