class GuestsController < ApplicationController
  before_filter :block_unauthenticated_users

  def index
    @guests = User.all
  end
end
