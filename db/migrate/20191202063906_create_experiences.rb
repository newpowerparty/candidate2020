class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :content
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
