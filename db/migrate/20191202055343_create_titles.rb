class CreateTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :titles do |t|
      t.string :content
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
