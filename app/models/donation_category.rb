class DonationCategory < ApplicationRecord
  mount_uploader :image, AvatarUploader
  has_many :donation_rewards
  has_many :donations
end
