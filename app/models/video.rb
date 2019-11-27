class Video < ApplicationRecord
  belongs_to :candidate, optional: true

end
