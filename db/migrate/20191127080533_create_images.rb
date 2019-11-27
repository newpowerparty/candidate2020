class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :candidate, foreign_key: true
      t.integer :position
      t.string :file_name
      t.string :file_url

      t.timestamps
    end
  end
end
