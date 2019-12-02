class CandidateLocation < ApplicationRecord
  belongs_to :location
  belongs_to :candidate
end
