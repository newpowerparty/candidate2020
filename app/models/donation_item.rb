class DonationItem < ApplicationRecord
  belongs_to :donation
  belongs_to :donation_reward

  before_validation :set_amount
  
  def set_amount
    self.amount = quantity * donation_reward.amount
  end

end
# == Schema Information
#
# Table name: donation_items
#
#  id                 :bigint           not null, primary key
#  donation_reward_id :bigint
#  donation_id        :bigint
#  quantity           :integer
#  amount             :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

