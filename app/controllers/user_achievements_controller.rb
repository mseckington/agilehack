class UserAchievementsController < ApplicationController
  before_filter :block_unauthenticated_users

  def create
    UserAchievement.create(user: current_user, achievement_id: params[:achievement_id])
  end

  def destroy
  end
end
