class CreateSystems < ActiveRecord::Migration[5.2]
  def change
    create_table :systems do |t|
      t.integer :total_donation

      t.timestamps
    end
  end
end
