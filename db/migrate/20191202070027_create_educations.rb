class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.references :candidate, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
