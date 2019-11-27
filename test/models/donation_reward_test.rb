# == Schema Information
#
# Table name: donation_rewards
#
#  id                   :bigint           not null, primary key
#  donation_category_id :bigint
#  amount               :integer
#  image                :string
#  active               :boolean          default(FALSE)
#  name                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class DonationRewardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
