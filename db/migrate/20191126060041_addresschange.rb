class Addresschange < ActiveRecord::Migration[5.2]
  def change
    add_column :donations, :county, :string
    add_column :donations, :district, :string
    add_column :donations, :zipcode, :integer
    remove_column :donations, :address
  end
end
