# == Schema Information
#
# Table name: images
#
#  id           :bigint           not null, primary key
#  candidate_id :bigint
#  position     :integer
#  file_name    :string
#  file_url     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Image < ApplicationRecord
  belongs_to :candidate, optional: true
  

  mount_uploader :file_url, AvatarUploader  
end
