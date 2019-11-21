class CreateDonationItems < ActiveRecord::Migration[5.2]
  def change
    create_table :donation_items do |t|
      t.references :donation_reward, foreign_key: true
      t.references :donation, foreign_key: true
      t.integer :quantity
      t.integer :amount

      t.timestamps
    end
  end
end
