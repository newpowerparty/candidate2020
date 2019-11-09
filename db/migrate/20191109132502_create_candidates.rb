class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :avatar
      t.string :school
      t.text :info
      t.text :experience
      t.jsonb :contact

      t.timestamps
    end
  end
end
