class AddCloumnToCandiate < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :number, :string
    add_column :candidates, :content, :text
  end
end
