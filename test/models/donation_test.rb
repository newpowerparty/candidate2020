# == Schema Information
#
# Table name: donations
#
#  id                   :bigint           not null, primary key
#  donation_category_id :bigint
#  name                 :string
#  citizend             :string
#  mobile_phone         :string
#  total_amount         :integer
#  description          :text
#  receipt_type         :integer
#  donate_type          :integer
#  confirmed            :boolean
#  confirmed_at         :datetime
#  anonymous            :boolean          default(FALSE)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  payment_type         :string
#  county               :string
#  district             :string
#  zipcode              :integer
#  road                 :string
#

require 'test_helper'

class DonationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
