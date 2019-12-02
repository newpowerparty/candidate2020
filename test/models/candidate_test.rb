# == Schema Information
#
# Table name: candidates
#
#  id         :bigint           not null, primary key
#  name       :string
#  headshot   :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  number     :string
#  content    :text
#

require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
