class Challenge < ActiveRecord::Base
	belongs_to :user
	belongs_to :player_one, class_name: 'User'
	belongs_to :player_two, class_name: 'User'
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
end
