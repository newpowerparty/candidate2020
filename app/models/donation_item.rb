class DonationItem < ApplicationRecord
  belongs_to :donation_reward
  belongs_to :donation
end
