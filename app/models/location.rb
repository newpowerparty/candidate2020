class Location < ApplicationRecord
  has_many :candidate_locations
  has_many :candidates, through: :candidate_locations
end
