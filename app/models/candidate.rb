class Candidate < ApplicationRecord
  mount_uploader :headshot, AvatarUploader
  has_many :titles
  has_many :images
  has_many :videos
  has_many :candidate_locations
  has_many :locations, through: :candidate_locations
  has_one :social
end

# == Schema Information
#
# Table name: candidates
#
#  id         :bigint           not null, primary key
#  name       :string
#  headshot   :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  number     :string
#  content    :text
#
