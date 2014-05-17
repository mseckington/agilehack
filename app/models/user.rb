class User < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => { :case_sensitive => false }, :email => true, :length => { :maximum => 191 }
  validates :first_name, :presence => true, length: { maximum: 255 }
  validates :last_name, :presence => true, length: { maximum: 255 }

  has_secure_password

  has_many :user_achievements
  has_many :achievements, through: :user_achievements

  class << self
    def authenticate(email, password)
      user = User.find_by_email(email)
      return nil unless user
      user.authenticate(password) ? user : nil
    end
  end

  def achieved?(achievement)
    UserAchievement.user_achieved?(self, achievement)
  end
end
