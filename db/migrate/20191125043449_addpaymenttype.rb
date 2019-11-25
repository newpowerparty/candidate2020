class Addpaymenttype < ActiveRecord::Migration[5.2]
  def change
    add_column :donations, :payment_type, :string
  end
end
