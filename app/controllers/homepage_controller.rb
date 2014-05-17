class HomepageController < ApplicationController
  before_filter :block_unauthenticated_users

  def index
  end
end
