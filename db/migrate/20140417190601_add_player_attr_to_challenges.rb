class AddPlayerAttrToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :player_one_id, :integer
    add_column :challenges, :player_two_id, :integer
  end
end
