class Park < ApplicationRecord
  has_many :attractions
  has_many :restaurants
end
