class RemoveOldColumn < ActiveRecord::Migration
  def change
  	remove_column :challenges, :player_one
  	remove_column :challenges, :player_two
  end
end
