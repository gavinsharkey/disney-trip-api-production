class Park < ApplicationRecord
  has_many :attractions, dependent: :destroy
  has_many :restaurants, dependent: :destroy
end
