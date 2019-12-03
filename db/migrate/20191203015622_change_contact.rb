class ChangeContact < ActiveRecord::Migration[5.2]
  def change
    rename_column :contacts, :phone, :name
    rename_column :contacts, :email, :typee
    rename_column :contacts, :official_site, :text
  end
end
