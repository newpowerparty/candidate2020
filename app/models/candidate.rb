class Candidate < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
end
