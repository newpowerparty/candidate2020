class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.references :donation_category, foreign_key: true
      t.string :name
      t.string :citizend
      t.integer :mobile_phone
      t.integer :total_amount
      t.string :address
      t.text :description
      t.integer :receipt_type
      t.integer :donate_type
      t.boolean :confirmed
      t.datetime :confirmed_at
      t.boolean :anonymous, default: false

      t.timestamps
    end
  end
end
