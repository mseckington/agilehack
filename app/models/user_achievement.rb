class UserAchievement < ActiveRecord::Base
  belongs_to :user
  belongs_to :achievement

  class << self
    def user_achieved?(user, achievement)
      where(user_id: user.id, achievement_id: achievement.id).exists?
    end
  end
end

