class AddDonationReward < ActiveRecord::Migration[5.2]
  def change
    add_column :donation_rewards, :position, :integer
  end
end
