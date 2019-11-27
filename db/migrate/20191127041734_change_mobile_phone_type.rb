class ChangeMobilePhoneType < ActiveRecord::Migration[5.2]
  def change
    change_column :donations, :mobile_phone, :string
  end
end
