class RenameCandidateColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :candidates, :type, :typee
  end
end
