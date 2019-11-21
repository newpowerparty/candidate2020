class CreateDonationRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :donation_rewards do |t|
      t.references :donation_category, foreign_key: true
      t.integer :amount
      t.string :image
      t.boolean :active, default: false
      t.string :name

      t.timestamps
    end
  end
end
