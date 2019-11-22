class DonationReward < ApplicationRecord
  belongs_to :donation_category, optional: true
  mount_uploader :image, AvatarUploader
  
  def name_amount
    "#{name} - #{amount}#{I18n.t(:dollar, scope: [:misc])}"
  end
end
