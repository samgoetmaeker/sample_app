class Game < ActiveRecord::Base
  has_many :scores
  accepts_nested_attributes_for :scores
  self.inheritance_column = 'blalalala'
end
