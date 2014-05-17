class Achievement < ActiveRecord::Base
  has_many :user_achievements
end
