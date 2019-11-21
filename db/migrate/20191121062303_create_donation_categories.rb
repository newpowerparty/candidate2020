class CreateDonationCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :donation_categories do |t|
      t.string :name
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
