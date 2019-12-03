class DonationReward < ApplicationRecord
  default_scope {order(position: :asc)}
  belongs_to :donation_category
  mount_uploader :image, AvatarUploader
  
  validate  :can_sell?

  def name_amount
    "#{heading} - #{amount}#{I18n.t(:dollar, scope: [:misc])}"
  end

  private
  def can_sell?
    active?
  end
end

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
