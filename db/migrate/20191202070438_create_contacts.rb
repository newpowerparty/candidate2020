class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.references :candidate, foreign_key: true
      t.string :phone
      t.string :email
      t.string :official_site

      t.timestamps
    end
  end
end
