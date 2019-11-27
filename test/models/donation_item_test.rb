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

require 'test_helper'

class DonationItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
