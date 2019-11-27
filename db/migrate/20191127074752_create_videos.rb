class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.references :candidate, foreign_key: true
      t.integer :position
      t.string :url

      t.timestamps
    end
  end
end
