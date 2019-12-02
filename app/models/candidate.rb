class Candidate < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :images
  has_many :videos
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
