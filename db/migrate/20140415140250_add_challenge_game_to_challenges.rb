class AddChallengeGameToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :challenge_game, :string
  end
end
