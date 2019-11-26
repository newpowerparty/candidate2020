class Addroad < ActiveRecord::Migration[5.2]
  def change
    add_column :donations, :road, :string
  end
end
