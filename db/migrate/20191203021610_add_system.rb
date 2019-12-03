class AddSystem < ActiveRecord::Migration[5.2]
  def change
    add_column :systems, :name, :string
    add_column :systems, :description, :string
  end
end
