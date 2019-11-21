class DonationItem < ApplicationRecord
  belongs_to :donation_reward
  belongs_to :donation
  before_validation :set_amount
  
  def set_amount
    self.amount = quantity * donation_reward.amount
  end
end
