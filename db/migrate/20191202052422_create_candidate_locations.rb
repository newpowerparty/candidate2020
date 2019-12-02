class CreateCandidateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :candidate_locations do |t|
      t.references :location, foreign_key: true
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
