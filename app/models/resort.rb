class Resort < ApplicationRecord
  has_many :restaurants, dependent: :destroy
end
