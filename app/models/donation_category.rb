class DonationCategory < ApplicationRecord
  mount_uploader :image, AvatarUploader
  has_many :donation_rewards
  has_many :donations
end


# == Schema Information
#
# Table name: donation_categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  content    :text
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
