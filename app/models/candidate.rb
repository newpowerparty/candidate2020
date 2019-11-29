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
#  avatar     :string
#  school     :string
#  info       :text
#  experience :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
