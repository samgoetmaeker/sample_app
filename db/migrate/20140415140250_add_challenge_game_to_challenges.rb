class AddChallengeGameToChallenges < ActiveRecord::Migration
  def change
      create_table "challenges", force: true do |t|
	    t.integer  "user_id"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.string   "challenge_game"
	    t.text     "description"
	    t.integer  "player_one_id"
	    t.integer  "player_two_id"
	  end
  end
end
