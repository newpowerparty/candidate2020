class DonationReward < ApplicationRecord
  belongs_to :donation_category, optional: true
  mount_uploader :image, AvatarUploader
end
