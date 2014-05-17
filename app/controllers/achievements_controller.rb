class AchievementsController < ApplicationController
  before_filter :block_unauthenticated_users

  def index
    @achievements = Achievement.all
  end
end
