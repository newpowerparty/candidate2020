class Image < ApplicationRecord
  belongs_to :candidate, optional: true
  

  mount_uploader :file_url, AvatarUploader  
end
