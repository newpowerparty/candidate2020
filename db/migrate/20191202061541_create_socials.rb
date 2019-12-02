class CreateSocials < ActiveRecord::Migration[5.2]
  def change
    create_table :socials do |t|
      t.string :fb
      t.string :line
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
