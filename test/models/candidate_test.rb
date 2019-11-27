# == Schema Information
#
# Table name: candidates
#
#  id         :bigint           not null, primary key
#  name       :string
#  avatar     :string
#  school     :string
#  info       :text
#  experience :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
