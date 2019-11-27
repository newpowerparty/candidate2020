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

require 'test_helper'

class DonationCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
