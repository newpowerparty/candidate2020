class ChangeCandidateColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :candidates, :avatar, :headshot
    rename_column :candidates, :school, :type
    remove_column :candidates, :info
    remove_column :candidates, :experience
  end
end
