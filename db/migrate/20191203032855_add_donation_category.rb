class AddDonationCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :donation_rewards, :name, :heading
    add_column :donation_rewards, :description, :string
    add_column :donation_rewards, :intro, :text
  end
end
